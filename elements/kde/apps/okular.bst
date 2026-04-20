kind: cmake
description: okular - KDE document viewer

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON
    -DOKULAR_UI=desktop

sources:
- kind: git_repo
  url: kde:graphics/okular.git
  track: release/25.04
  ref: 85a264dbd54bebd3bd971d6649e872b178b0e3aa
