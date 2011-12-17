ORIG_PWD=`pwd`

BUILD_SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
KERNEL_ROOT_DIR=$BUILD_SCRIPTS_DIR/..

datever=`date +%d-%m-%Y_%H-%M-%S`

cd $KERNEL_ROOT_DIR

# http://releases.linaro.org/11.11/components/android/toolchain/4.5/android-toolchain-eabi-linaro-4.5-2011.10-1-2011-10-21_15-21-26-linux-x86.tar.bz2
# http://releases.linaro.org/11.11/components/android/toolchain/4.6/android-toolchain-eabi-linaro-4.6-2011.11-4-2011-11-15_12-22-49-linux-x86.tar.bz2

# https://sourcery.mentor.com/sgpp/lite/arm/portal/package8736/public/arm-none-eabi/arm-2011.03-42-arm-none-eabi.bin

U8800_COMPILE_BY="ksatta" U8800_COMPILE_HOST="$datever" make ARCH=arm CROSS_COMPILE=/store/android/sourcery/bin/arm-none-eabi- -j8

cd $ORIG_PWD

echo "datever:$datever"

# comment out to disable beep when build done. (on ubuntu beep requires "sudo modprobe pcspkr" and "sudo apt-get install beep")
# beep