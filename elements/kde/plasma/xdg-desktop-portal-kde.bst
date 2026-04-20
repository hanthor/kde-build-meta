kind: cmake
description: xdg-desktop-portal-kde - KDE XDG portal backend

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:plasma/xdg-desktop-portal-kde.git
  track: Plasma/6.6
  ref: c5124ded06778816807d7c89f8be31586115f026
