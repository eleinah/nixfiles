{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [  ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [  ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/bd966a5e-411b-46dd-b8f2-1c8f961de529";
      fsType = "xfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/EC9A-E9C0";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=00777" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/cd4455de-538d-442e-9c49-5ac44dccfcb8"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
