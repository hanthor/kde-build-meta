kind: cmake
description: kscreen - KDE screen management

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:plasma/kscreen.git
  track: Plasma/6.6
  ref: dafe40feb429d3aba4e8d5db8625de3e373884c9
