kind: cmake
description: Qt6 tools module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/qt6/qt6-qtdeclarative.bst

config:
  # qtdiag/qtdiag6 are hard-linked; break them before the freedesktop-sdk
  # stripper runs (it refuses to process files with multiple hard links)
  install-commands:
    (>):
    - |
      find /buildstream-install/usr/bin -type f -links +1 | while IFS= read -r f; do
        tmp=$(mktemp "${f}.XXXXXX")
        cp -a "$f" "$tmp"
        mv -f "$tmp" "$f"
      done

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qttools-everywhere-src-6.9.3.tar.xz
  ref: 0cf7ab0e975fc57f5ce1375576a0a76e9ede25e6b01db3cf2339cd4d9750b4e9
