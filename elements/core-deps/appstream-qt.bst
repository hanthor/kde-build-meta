kind: meson
description: AppStreamQt — Qt6 bindings for AppStream metadata library

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/sed.bst
- freedesktop-sdk.bst:components/itstool.bst
- freedesktop-sdk.bst:components/libxml2.bst
- freedesktop-sdk.bst:components/libxmlb.bst
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/docbook-xml.bst
- freedesktop-sdk.bst:components/docbook-xsl.bst
- freedesktop-sdk.bst:components/appstream.bst
- core-deps/libfyaml.bst
- freedesktop-sdk.bst:components/gperf.bst
- kde/qt6/qt6-qtbase.bst

depends:
- freedesktop-sdk.bst:components/appstream.bst
- core-deps/libfyaml.bst
- kde/qt6/qt6-qtbase.bst

variables:
  meson-local: >-
    -Dqt=true
    -Dgir=false
    -Ddocs=false
    -Dman=false
    -Dapidocs=false
    -Dvapi=false
    -Dstemming=false
    -Dbash-completion=false

config:
  install-commands:
    (>):
    # Keep only the Qt bindings (libAppStreamQt, headers, cmake config) and
    # remove everything else — the base C library is provided by
    # freedesktop-sdk:components/appstream.bst and must not be duplicated.
    - |
      rm -rf "%{install-root}%{libdir}/libappstream"*
      rm -rf "%{install-root}%{includedir}/appstream"
      rm -rf "%{install-root}%{libdir}/cmake/AppStream"
      rm -rf "%{install-root}%{libdir}/pkgconfig/appstream.pc"
      rm -rf "%{install-root}%{datadir}/appdata"
      rm -rf "%{install-root}%{datadir}/appstream"
      rm -rf "%{install-root}%{datadir}/locale"
      rm -rf "%{install-root}%{datadir}/man"
      rm -rf "%{install-root}%{datadir}/metainfo"
      rm -rf "%{install-root}%{datadir}/dbus-1"
      rm -rf "%{install-root}%{datadir}/bash-completion"
      rm -rf "%{install-root}%{datadir}/doc"
      rm -rf "%{install-root}%{datadir}/gettext"
      rm -rf "%{install-root}%{datadir}/gtk-doc"
      rm -rf "%{install-root}%{datadir}/installed-tests"
      rm -f  "%{install-root}%{bindir}/appstreamcli"
      rm -f  "%{install-root}%{bindir}/appstream-util"

sources:
- kind: git_repo
  url: github:ximion/appstream.git
  track: 'v1.*'
  ref: v1.1.3-0-g559d20cd46919346ef05916c58f75cbfe1a1c919
