{
  systemd.services.certbot-init = {
    description = "Initial Let's Encrypt SSL certificate via Certbot";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStartPre = "${pkgs.systemd}/bin/systemctl stop nginx.service";
      ExecStart = ''
        ${pkgs.certbot}/bin/certbot certonly \
          --standalone \
          --non-interactive \
          --agree-tos \
          --email your-email@example.com \
          -d studio.colleges91.com
      '';
      ExecStartPost = "${pkgs.systemd}/bin/systemctl start nginx.service";
    };
  };
}
