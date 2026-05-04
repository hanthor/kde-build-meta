kind: manual

sources:
- kind: git_repo
  url: github:zsh-users/zsh-syntax-highlighting.git
  track: '[0-9]*.[0-9]*.[0-9]*'
  ref: 0.8.0-0-ge0165eaa730dd0fa321a6a6de74f092fe7630f1b

config:
  build-commands: []

  install-commands:
  - |
    install -Dm 644 zsh-syntax-highlighting.zsh \
      %{install-root}%{datadir}/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    cp -r highlighters %{install-root}%{datadir}/zsh/plugins/zsh-syntax-highlighting/

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
