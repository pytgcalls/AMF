# shellcheck disable=SC1090
source <(curl -s https://raw.githubusercontent.com/pytgcalls/build-toolkit/refs/heads/master/build-toolkit.sh)

try_setup_msvc

AMF_VERSION=$(get_version "amf")
build_and_install "https://github.com/GPUOpen-LibrariesAndSDKs/AMF.git" "v$AMF_VERSION" configure-static \
  --setup-commands="cp ../tools/configure ../tools/Makefile ." \
  --prefix="$(pwd)/AMF/build/" --windows="--toolchain=msvc"

mkdir -p artifacts/lib
cp AMF/build/lib/libamf.a artifacts/lib/"$(os_lib_format static amf)"
cp -r AMF/build/include artifacts/include/