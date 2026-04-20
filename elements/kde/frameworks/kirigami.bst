kind: cmake
description: kirigami

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst

variables:
  cmake-options: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kirigami.git
  track: v6.22.0
  ref: a5fbb933b96333dcfe9bfcc2deea3fd5b0396c8b
