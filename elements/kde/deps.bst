kind: stack
description: KDE Aurora OS dependencies

depends:
# Base OS stack from freedesktop-sdk
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/util-linux-full.bst
- freedesktop-sdk.bst:components/linux.bst
- freedesktop-sdk.bst:components/wireless-regdb-bin.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/dbus.bst
- freedesktop-sdk.bst:components/dracut.bst
# os-release removed: provided by oci/integration/os-release.bst
- freedesktop-sdk.bst:components/shadow.bst
- freedesktop-sdk.bst:components/tzdata.bst
- freedesktop-sdk.bst:components/iproute2.bst
- freedesktop-sdk.bst:components/udisks.bst
- freedesktop-sdk.bst:vm/base-filesystem.bst
- freedesktop-sdk.bst:vm/config/journald.bst
- freedesktop-sdk.bst:vm/config/networkd.bst
- freedesktop-sdk.bst:vm/config/resolved.bst
# useradd-default removed: provided by freedesktop-sdk.bst:vm/config/useradd-ostree.bst
- freedesktop-sdk.bst:vm/config/flathub.bst
- freedesktop-sdk.bst:components/usbutils.bst
- freedesktop-sdk.bst:components/hosts.bst
- freedesktop-sdk.bst:components/flatpak.bst

# KDE Plasma Desktop
- kde/org.kde.plasma.desktop.bst
- kde/config/plasma.bst

# KDE Applications
- kde/org.kde.apps.bst

# KDE Qt-adjacent libraries
- kde/libs/qcoro.bst
- kde/libs/qtkeychain-qt6.bst
- kde/libs/poppler-qt6.bst

# bootc for image-based updates
- gnomeos-deps/bootc.bst

# Audio
- freedesktop-sdk.bst:components/pipewire-daemon.bst
- freedesktop-sdk.bst:components/wireplumber.bst

# Network
- freedesktop-sdk.bst:components/networkmanager.bst

# Security
- freedesktop-sdk.bst:vm/config/sudo.bst
- freedesktop-sdk.bst:components/polkit.bst

# Graphics
- freedesktop-sdk.bst:vm/mesa-default.bst

# Storage
- freedesktop-sdk.bst:components/btrfs-progs.bst

# Containers
- freedesktop-sdk.bst:components/podman.bst
- freedesktop-sdk.bst:components/skopeo.bst
- gnomeos-deps/distrobox.bst
- gnomeos-deps/toolbox.bst

# Networking tools
- freedesktop-sdk.bst:components/iproute2.bst
- freedesktop-sdk.bst:components/iputils.bst

# Firewall
- gnomeos-deps/nftables.bst
- gnomeos-deps/firewalld.bst

# Shell and text tools
- freedesktop-sdk.bst:components/bash-completion.bst
- freedesktop-sdk.bst:components/bash-config.bst
- freedesktop-sdk.bst:components/jq.bst
- freedesktop-sdk.bst:components/less.bst
- freedesktop-sdk.bst:components/nano.bst
- freedesktop-sdk.bst:components/vim.bst

# Git
- freedesktop-sdk.bst:components/git.bst
- freedesktop-sdk.bst:components/git-lfs.bst

# Firmware
- freedesktop-sdk.bst:components/linux-firmware.bst
- freedesktop-sdk.bst:components/sof-firmware.bst

# SSH
- freedesktop-sdk.bst:components/openssh-systemd.bst

# Sync
- freedesktop-sdk.bst:components/rsync.bst

# Hardware
- gnomeos-deps/android-udev-rules.bst
- gnomeos-deps/iio-sensor-proxy.bst
- gnomeos-deps/nvme-cli.bst
- gnomeos-deps/uinput.bst
- gnomeos-deps/switcheroo-control.bst
- gnomeos-deps/efibootmgr.bst

# Filesystem support
# ntfs-3g omitted: modern kernels have ntfs3 built-in (5.15+)
- gnomeos-deps/btrfsmaintenance.bst

# Printing and scanning
- gnomeos-deps/sane-backends.bst
- gnomeos-deps/sane-airscan.bst

# VM support
- gnomeos-deps/virtiofsd.bst
- gnomeos-deps/swtpm.bst
- gnomeos-deps/spice-vdagent.bst
- freedesktop-sdk.bst:components/unzip.bst

# Network utilities
- gnomeos-deps/dnsmasq.bst
- gnomeos-deps/iw.bst
- gnomeos-deps/nss-mdns.bst

# Wayland utilities
- gnomeos-deps/wl-clipboard.bst

# Realtime audio privileges
- gnomeos-deps/realtime-privileges.bst

# Zram swap
- gnomeos-deps/zram-generator.bst

# Console
- gnomeos-deps/kmscon.bst

# Shell
- gnomeos-deps/fish.bst

# Zsh plugins
- gnomeos-deps/zsh-autosuggestions.bst
- gnomeos-deps/zsh-syntax-highlighting.bst
- gnomeos-deps/zsh-history-substring-search.bst
- gnomeos-deps/zsh-completions.bst

# Flathub
- gnomeos-deps/flathub-config.bst

# System config
- gnomeos-deps/journald-config.bst
- gnomeos-deps/nm-connectivity-config.bst
- gnomeos-deps/wpa-supplicant-config.bst

# Noise suppression
- gnomeos-deps/noise-suppression-for-voice.bst

# KDE Plasma extras
- kde/plasma/plasma-vault.bst

(?):
- arch == "aarch64":
    depends:
      (>):
      - gnomeos-deps/deps-aarch64.bst
- arch == "x86_64":
    depends:
      (>):
      - gnomeos-deps/microcode.bst
      - freedesktop-sdk.bst:components/ovmf.bst
