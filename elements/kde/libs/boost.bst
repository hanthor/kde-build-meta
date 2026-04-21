kind: cmake
description: Boost C++ Libraries (headers)

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DBOOST_INCLUDE_LIBRARIES=""
    -DBOOST_ENABLE_PYTHON=OFF

sources:
- kind: tar
  url: https://archives.boost.io/release/1.87.0/source/boost_1_87_0.tar.bz2
  ref: af57be25cb4c4f4b413ed692fe378affb4352ea50fbe294a11ef548f4d527d89
  base-dir: boost_1_87_0
