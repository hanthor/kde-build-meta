kind: manual

sources:
- kind: git_repo
  url: github:zsh-users/zsh-completions.git
  track: '[0-9]*.[0-9]*.[0-9]*'
  ref: 0.35.0-0-g685afd177b24e1b19451aa12ce9b62ba74aa3fe1

config:
  build-commands: []

  install-commands:
  - |
    install -dm 755 %{install-root}%{datadir}/zsh/site-functions
    cp src/* %{install-root}%{datadir}/zsh/site-functions/

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
