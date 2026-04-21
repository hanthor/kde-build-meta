kind: cmake
description: sddm - Simple Desktop Display Manager

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qttools.bst

depends:
- freedesktop-sdk.bst:components/linux-pam-base.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DENABLE_JOURNALD=ON
    -DNO_SYSTEMD=OFF
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

sources:
- kind: git_repo
  url: github:sddm/sddm.git
  track: master
  ref: cff7df42e6762914358e6e7deaedc15a1c6c7d57
