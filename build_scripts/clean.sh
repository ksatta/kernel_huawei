ORIG_PWD=`pwd`
BUILD_SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
KERNEL_ROOT_DIR=$BUILD_SCRIPTS_DIR/..

cd $KERNEL_ROOT_DIR

make clean

cd $ORIG_PWD
