kind: cmake
description: sddm - Simple Desktop Display Manager

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-options: >-
    -DBUILD_TESTING=OFF
    -DENABLE_JOURNALD=ON
    -DNO_SYSTEMD=OFF
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

sources:
- kind: git_repo
  url: github:sddm/sddm.git
  track: master
  ref: cff7df42e6762914358e6e7deaedc15a1c6c7d57
