{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
  [ (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  
  fileSystems."/" =
  { device = "/dev/disk/by-uuid/b8ce42ff-9561-4408-8709-711aa5cfdb25";
    fsType = "xfs";
  };

  fileSystems."/boot" =
  { devices = "/dev/disk/by-uuid/19E8-B230";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices =
  [ { device = "/dev/disk/by-uuid/8ae14bdb-07a6-465b-ae83-4675e5051882"; }
  ];
  
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
