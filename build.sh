#!/usr/bin/env bash

CDIR="$(cd "$(dirname "$0")" && pwd)"
build_dir=$CDIR/build

while getopts A:K:q option
do
  case "${option}"
  in
    q) QUIET=1;;
    A) ARCH=${OPTARG};;
    K) KERNEL=${OPTARG};;
  esac
done

rm -rf $build_dir
mkdir -p $build_dir

for f in pluginrc.fish omf-conf
do
    cp -r $CDIR/$f $build_dir/
done

cd $build_dir

[ $QUIET ] && arg_q='-q' || arg_q=''

if [ -x "$(command -v git)" ]; then
  git clone $arg_q https://github.com/oh-my-fish/oh-my-fish oh-my-fish
  cd oh-my-fish && git checkout v6
else
  echo You should install git to build: https://duckduckgo.com/?q=install+git+on+linux
  exit 1
fi

rm -rf .git
