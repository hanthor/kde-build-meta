kind: stack

depends:
# Custom versions of os-release and useradd — must come BEFORE gnomeos-deps/deps.bst
# (which now has them removed to avoid conflicts)
- oci/integration/os-release.bst
- freedesktop-sdk.bst:vm/config/useradd-ostree.bst
- gnomeos-deps/deps.bst

# OS-related config
- gnomeos/fwupd-efi-signed-maybe.bst
- gnomeos/import-deployment-pub-key.bst
- gnomeos/public-keys.bst
- gnomeos/reload-sysext.bst
- gnomeos/replace-signed-systemd-boot.bst
- gnomeos/systemd-pcrlock-workaround.bst

# Add the kernel
- freedesktop-sdk.bst:components/linux-firmware.bst
- gnomeos/initramfs/signed-modules.bst
- oci/initramfs.bst

# Currently only in -devel
- gnomeos-deps/bootc.bst

- oci/integration/bootc-config.bst
- freedesktop-sdk.bst:vm/config/sudo-nopasswd.bst

- oci/integration/lvm2-enable-activation.bst

public:
  bst:
    integration-commands:
    # Required for bootc to create the image
    - mkdir -p /boot
    - mkdir -p /sysroot
    - mkdir -p /sysroot/ostree
    # This needs to be a relative symlink
    # for some reason
    - ln -s sysroot/ostree ostree

    - rm --verbose --recursive --force /root
    # These also get created by 10-bootc.conf tmpfiles
    # but we need them to exist for the OCI image to
    # be usable as a container as well
    - mkdir -p /var/home
    - mkdir -p /var/roothome
    - mkdir -p /var/opt
    - mkdir -p /var/mnt

    - ln -s /var/home /home
    - ln -s /var/roothome /root
    - ln -s /var/opt /opt
    - ln -s /var/mnt /mnt

    - touch /etc/machine-id
    # Remove non-.ko files from /lib/modules (depmod cleanup)
    - find /lib/modules -type f ! -name "*.ko" ! -name "*.ko.gz" ! -name "modules.*" -delete
