kind: cmake
description: Vulkan API headers (updated for modern vulkan-hpp RAII support)

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: -DBUILD_TESTS=OFF

sources:
- kind: git_repo
  url: github:KhronosGroup/Vulkan-Headers.git
  track: 'v1.4.*'
  ref: v1.4.354-0-g01393c3df0e5285b54ee6527466513f9e614be94
