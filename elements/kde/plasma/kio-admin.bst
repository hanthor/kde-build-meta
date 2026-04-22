kind: cmake
description: kio-admin - KIO worker for admin file operations

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/frameworks/kio.bst
- kde/frameworks/ki18n.bst
- kde/libs/polkit-qt-1.bst
- freedesktop-sdk.bst:components/polkit.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON
    -DQT_MAJOR_VERSION=6

sources:
- kind: git_repo
  url: kde:system/kio-admin.git
  track: release/25.04
  ref: 0a33652a901a702813d617c2e1a29af1c0379d42
