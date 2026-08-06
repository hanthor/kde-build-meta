kind: cmake
description: qt6-qtquick3d

variables:
  cmake-local: -DFEATURE_quick3d_assimp=OFF

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qtdeclarative.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/vulkan-headers.bst

sources:
- kind: git_repo
  url: github:qt/qtquick3d.git
  track: 'v6.*'
  exclude:
  - '*rc*'
  - '*alpha*'
  - '*beta*'
  ref: v6.11.1-0-g19ac94c4d07fa6f7d22169e1251adc77a37c2dca
