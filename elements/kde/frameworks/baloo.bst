kind: cmake
description: baloo

build-depends:
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/baloo.git
  track: v6.22.0
  ref: e14a102aaf956030181821bfd93c11ce2981e529
