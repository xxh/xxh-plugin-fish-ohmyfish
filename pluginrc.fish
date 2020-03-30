set CURRENT_DIR (dirname (realpath (status current-filename)))
set -gx OMF_PATH "$CURRENT_DIR/oh-my-fish"
set -gx OMF_CONFIG "$CURRENT_DIR/omf-conf"
source $OMF_PATH/init.fish
