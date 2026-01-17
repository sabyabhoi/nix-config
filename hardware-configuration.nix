{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
      kernelModules = [];
    };
    kernelParams = ["amd_pstate=active"];
    kernelModules = ["kvm-amd" "tcp-bbr"];
    kernel.sysctl."net.ipv4.tcp_congestion_control" = "bbr";
    extraModulePackages = [];
  };
  powerManagement.cpuFreqGovernor = "schedutil";

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/68965b90-534c-4b1f-808f-a218904f1532";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D8B8-2E4E";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
