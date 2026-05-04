kind: cmake

sources:
- kind: git_repo
  url: github:lsof-org/lsof.git
  track: '4.*'
  ref: 4.99.6-0-gb173315c8f94bf61d52094857ea3fe7d0f5aaff9

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DLSOF_MAN_PAGE_DATE=OFF
