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

{
  imports = [ ];

  services.nginx.enable = true;

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.nginx.virtualHosts."studio.colleges91.com" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:8005";
    locations."/etlstudio".proxyPass = "http://127.0.0.1:5035";
    locations."/data-migs".proxyPass = "http://127.0.0.1:8012";
  };

  security.acme = {
    acceptTerms = true;
    email = "you@example.com";
    certs."studio.colleges91.com" = {
      webroot = "/var/www/html";
    };
  };

  services.certbot.enable = true;

  systemd.services.gunicorn-api = {
    enable = true;
    description = "Gunicorn instance to serve API";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.python3}/bin/gunicorn -w 4 -b 127.0.0.1:8005 app:app";
      WorkingDirectory = "/path/to/your/project";
      Restart = "always";
      User = "nginx";
    };
  };
}
