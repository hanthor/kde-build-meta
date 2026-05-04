kind: manual

sources:
- kind: git_repo
  url: github:zsh-users/zsh-history-substring-search.git
  track: 'v*'
  ref: v1.1.0-0-g87ce96b74b51a28462d3958cfc8e58e09db1bc5f

config:
  build-commands: []

  install-commands:
  - |
    install -Dm 644 zsh-history-substring-search.zsh \
      %{install-root}%{datadir}/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
