{ config, pkgs, ... }:

{
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Install system-wide packages
  environment.systemPackages = with pkgs; [
    python311
    postgresql_15
    pgadmin
    nginx
  ];

  # Enable PostgreSQL with initial setup
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_15;
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      local all all trust
      host all all 127.0.0.1/32 trust
    '';
    initialScript = ./init-db.sql;
  };

  # Enable Nginx and configure default server
  services.nginx = {
    enable = true;
    virtualHosts."localhost" = {
      root = "/var/www/html";
      locations."/" = { index = "index.html"; };
    };
  };

  # Open required firewall ports
  networking.firewall.allowedTCPPorts = [ 5432 80 443 ];
}
