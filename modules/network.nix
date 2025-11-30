{
  inputs,
  pkgs,
  ...
}: {
  networking = {
    useDHCP = false;
    hostName = "nixos";
    networkmanager = {
      enable = true;
      # dns = "none";
    };

    stevenblack = {
      enable = true;
      block = ["porn"];
    };

    # nameservers = [
    #   "1.1.1.1"
    #   "1.0.0.1"
    #   "2606:4700:4700::1111"
    #   "2606:4700:4700::1001"
    # ];
    resolvconf.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [80 443 20];
    };
  };
}
