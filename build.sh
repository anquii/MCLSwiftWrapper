BASE_DIR=$PWD
FRAMEWORK=MCLSwiftWrapper
CONFIGURATION=Release
PROJECT="$BASE_DIR/$FRAMEWORK.xcodeproj"

ARCHIVE_DIR="$BASE_DIR/Archives"
ARCHIVE_DIR_MACOSX="$ARCHIVE_DIR/macosx.xcarchive"
ARCHIVE_DIR_IPHONEOS="$ARCHIVE_DIR/iphoneos.xcarchive"
ARCHIVE_DIR_IPHONESIMULATOR="$ARCHIVE_DIR/iphonesimulator.xcarchive"
RELEASE_DIR="$BASE_DIR/Release"
OUTPUT_FILENAME="$FRAMEWORK.xcframework"

set -e

rm -rf $ARCHIVE_DIR
rm -rf $RELEASE_DIR

mkdir -p $ARCHIVE_DIR
mkdir -p $RELEASE_DIR

pushd "$BASE_DIR/Submodules/mcl"
git reset --hard
git apply "$BASE_DIR/mcl.patch"

# macosx
xcodebuild archive                                          \
    -project $PROJECT                                       \
    -scheme $FRAMEWORK                                      \
    -configuration $CONFIGURATION                           \
    -sdk macosx                                             \
    -archivePath $ARCHIVE_DIR_MACOSX                        \
    ONLY_ACTIVE_ARCH=NO                                     \
    SWIFT_SERIALIZE_DEBUGGING_OPTIONS=NO

# iphoneos
xcodebuild archive                                          \
    -project $PROJECT                                       \
    -scheme $FRAMEWORK                                      \
    -configuration $CONFIGURATION                           \
    -sdk iphoneos                                           \
    -archivePath $ARCHIVE_DIR_IPHONEOS                      \
    ONLY_ACTIVE_ARCH=NO                                     \
    SWIFT_SERIALIZE_DEBUGGING_OPTIONS=NO

# iphonesimulator
xcodebuild archive                                          \
    -project $PROJECT                                       \
    -scheme $FRAMEWORK                                      \
    -configuration $CONFIGURATION                           \
    -sdk iphonesimulator                                    \
    -archivePath $ARCHIVE_DIR_IPHONESIMULATOR               \
    ONLY_ACTIVE_ARCH=NO                                     \
    SWIFT_SERIALIZE_DEBUGGING_OPTIONS=NO

# bundle
xcodebuild archive                                                                                          \
    -create-xcframework                                                                                     \
    -framework "$ARCHIVE_DIR_MACOSX/Products/Library/Frameworks/$FRAMEWORK.framework"                       \
    -debug-symbols "$ARCHIVE_DIR_MACOSX/dSYMs/$FRAMEWORK.framework.dSYM"                                    \
    -framework "$ARCHIVE_DIR_IPHONEOS/Products/Library/Frameworks/$FRAMEWORK.framework"                     \
    -debug-symbols "$ARCHIVE_DIR_IPHONEOS/dSYMs/$FRAMEWORK.framework.dSYM"                                  \
    -debug-symbols `find "$ARCHIVE_DIR_IPHONEOS/BCSymbolMaps" -name "*.bcsymbolmap" -type f -maxdepth 1`    \
    -framework "$ARCHIVE_DIR_IPHONESIMULATOR/Products/Library/Frameworks/$FRAMEWORK.framework"              \
    -debug-symbols "$ARCHIVE_DIR_IPHONESIMULATOR/dSYMs/$FRAMEWORK.framework.dSYM"                           \
    -output "$RELEASE_DIR/$OUTPUT_FILENAME"

# zip
pushd $RELEASE_DIR
rm -rf "$FRAMEWORK.zip"
zip -r "$FRAMEWORK.zip" ./$OUTPUT_FILENAME
rm -rf ./$OUTPUT_FILENAME
popd
