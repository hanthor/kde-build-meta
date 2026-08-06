kind: cmake
description: Qt6 tools module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/vulkan-headers.bst
- kde/qt6/qt6-qtdeclarative.bst

variables:
  cmake-local: -DFEATURE_assistant=OFF

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
- kind: git_repo
  url: github:qt/qttools.git
  track: 'v6.*'
  exclude:
  - '*rc*'
  - '*alpha*'
  - '*beta*'
  ref: v6.11.1-0-g947c5f152f4abc06f9e135b411c06a6fbe608aed
