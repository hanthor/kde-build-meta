kind: cmake
description: kuserfeedback

build-depends:
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kuserfeedback.git
  track: v6.22.0
  ref: d882ae3f76d0b12c7035e1b7884c03c41996b93f
