{
  imports =
  [ (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  
  fileSystems."/" =
  { device = "/dev/disk/by-uuid/5a3ae749-b3e4-4869-9c37-21929e543177";
    fsType = "xfs";
  };

  fileSystems."/boot" =
  { devices = "/dev/disk/by-uuid/5988-F8EF";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices =
  [ { device = "/dev/disk/by-uuid/a279f40f-2fd5-4545-acaa-afc6bc900e74"; }
  ];
  
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
