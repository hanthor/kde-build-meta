kind: autotools
description: libfyaml — YAML parser library (required by AppStream >= 1.0)

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:pantoniou/libfyaml.git
  track: 'v*'
  ref: v1.0.0-alpha7-0-g1bc5793851f768cb120b4a6f81c55151abb0c2ba
