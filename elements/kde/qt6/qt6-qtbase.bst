kind: cmake
description: Qt6 base module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/openssl.bst
- freedesktop-sdk.bst:components/sqlite.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-options: >-
    -DINSTALL_ARCHDATADIR=lib
    -DQT_DISABLE_RPATH=ON
    -DBUILD_WITH_PCH=FALSE
    -DQT_FEATURE_openssl_linked=ON
    -DQT_FEATURE_system_sqlite=ON

config:
  install-commands:
    (>):
    - |
      # Break hardlinks that confuse freedesktop-sdk-stripper
      for f in "%{install-root}"/usr/bin/qtpaths6 \
                "%{install-root}"/usr/bin/androiddeployqt6 \
                "%{install-root}"/usr/bin/qmake6; do
        [ -f "$f" ] && cp --remove-destination "$f" "${f%6}"
        [ -f "$f" ] && cp --remove-destination "$f" "$f"
      done

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qtbase-everywhere-src-6.9.3.tar.xz
  ref: c5a1a2f660356ec081febfa782998ae5ddbc5925117e64f50e4be9cd45b8dc6e
