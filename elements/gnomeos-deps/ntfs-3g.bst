kind: autotools

sources:
- kind: git_repo
  url: github:tuxera/ntfs-3g.git
  track: '[0-9][0-9][0-9][0-9].[0-9]*.[0-9]*'
  ref: 2022.10.3-0-g4f4ee50dd7a48d5a4c8f0476b019e6a46a0e7de

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/util-linux.bst

variables:
  conf-local: >-
    --disable-static
    --with-fuse=external
    --enable-posix-acls
    --enable-xattr-mappings
