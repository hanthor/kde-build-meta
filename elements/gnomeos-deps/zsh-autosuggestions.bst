kind: manual

sources:
- kind: git_repo
  url: github:zsh-users/zsh-autosuggestions.git
  track: 'v*'
  ref: v0.7.1-0-gc3d4e576fec1f040e1f2d4d7e1e83fc1da2f12ae

config:
  build-commands: []

  install-commands:
  - |
    install -Dm 644 zsh-autosuggestions.zsh \
      %{install-root}%{datadir}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
