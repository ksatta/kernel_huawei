ORIG_PWD=`pwd`
BUILD_SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
KERNEL_ROOT_DIR=$BUILD_SCRIPTS_DIR/..

datever=`cat $KERNEL_ROOT_DIR/include/generated/compile.h | grep LINUX_COMPILE_HOST | cut -d" " -f3 | tr -d \"`
zipname="ksatta-u8800-2.6.35_$datever"

cp $KERNEL_ROOT_DIR/arch/arm/boot/zImage $BUILD_SCRIPTS_DIR/anykernel_zip_template/kernel/zImage

cd $BUILD_SCRIPTS_DIR/anykernel_zip_template
zip -r temp.zip *

mv temp.zip ../anykernel_zips/$zipname.zip

cd $ORIG_PWD

echo "Press enter to send to phone (sendtophone.sh) or CTRL-C to not send"
read

$BUILD_SCRIPTS_DIR/sendtophone.sh $BUILD_SCRIPTS_DIR/anykernel_zips/$zipname.zip