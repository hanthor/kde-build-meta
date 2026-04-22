kind: cmake
description: kate - Advanced text editor

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/frameworks/kdoctools.bst
- kde/libs/qtkeychain-qt6.bst
- kde/qt6/qt6-qtbase.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kguiaddons.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/kiconthemes.bst
- kde/frameworks/ktexteditor.bst
- kde/frameworks/kparts.bst
- kde/frameworks/kio.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:utilities/kate.git
  track: release/25.04
  ref: 9df9b4582936d0b0620c5614d0c0eba4e6c3456a
