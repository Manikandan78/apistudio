{ config, pkgs, ... }:

{
  home.username = "ltsupport";  # Replace with your username
  home.homeDirectory = "/home/ltsupport";

  # Install required packages for the user
  home.packages = with pkgs; [
    python311
    postgresql_15
    pgadmin
    nginx
  ];

  # PostgreSQL command-line aliases
  home.file.".config/postgresql/pg_aliases.sh".text = ''
    alias pgstart="sudo systemctl start postgresql"
    alias pgstop="sudo systemctl stop postgresql"
    alias pgstatus="sudo systemctl status postgresql"
    alias psql="psql -U microapi -d apicloud"
  '';

  # Set home state version
  home.stateVersion = "23.11";
}

home.file."bin/certbot-renew.sh" = {
  executable = true;
  text = ''
    #!/bin/bash
    certbot certonly --standalone --non-interactive --agree-tos \
      --email your-email@example.com -d studio.colleges91.com \
      && sudo systemctl reload nginx
  '';
};
