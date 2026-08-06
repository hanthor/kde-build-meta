kind: cmake
description: Qt6 declarative (QML) module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/python3.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/vulkan-headers.bst
- kde/qt6/qt6-qtshadertools.bst

sources:
- kind: git_repo
  url: github:qt/qtdeclarative.git
  track: 'v6.*'
  exclude:
  - '*rc*'
  - '*alpha*'
  - '*beta*'
  ref: v6.11.1-0-ga02bed441965ee1f18f856352c7d5ee5ba35d795
