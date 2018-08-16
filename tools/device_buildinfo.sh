#!/bin/bash

partition="$1"

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <vendor|odm>" 1>&2
  exit 1
fi

if [ "$partition" != "vendor" ] && [ "$partition" != "odm" ]; then
  echo "Unknown partition name: $partition" 1>&2
  exit 1
fi

echo "# begin build properties"
echo "# autogenerated by device_buildinfo.sh"

echo "ro.${partition}.build.id=$BUILD_ID"
echo "ro.${partition}.build.version.incremental=$BUILD_NUMBER"
echo "ro.${partition}.build.version.sdk=$PLATFORM_SDK_VERSION"
echo "ro.${partition}.build.version.release=$PLATFORM_VERSION"
echo "ro.${partition}.build.type=$TARGET_BUILD_TYPE"
echo "ro.${partition}.build.tags=$BUILD_VERSION_TAGS"

echo "ro.product.board=$TARGET_BOOTLOADER_BOARD_NAME"
echo "ro.board.platform=$TARGET_BOARD_PLATFORM"

echo "ro.product.${partition}.manufacturer=$PRODUCT_MANUFACTURER"
echo "ro.product.${partition}.model=$PRODUCT_MODEL"
echo "ro.product.${partition}.brand=$PRODUCT_BRAND"
echo "ro.product.${partition}.name=$PRODUCT_NAME"
echo "ro.product.${partition}.device=$TARGET_DEVICE"

echo "# end build properties"
