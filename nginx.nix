{ config, pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.nginx = {
    enable = true;

    recommendedProxySettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;

    virtualHosts."api.colleges91.com" = {
      enableACME = true;
      forceSSL = true;

      locations = {
        "/" = { proxyPass = "http://127.0.0.1:8080"; };
        "/crudapp" = { proxyPass = "http://127.0.0.1:8000"; };
        "/getapi" = { proxyPass = "http://127.0.0.1:8001"; };
        "/postapi" = { proxyPass = "http://127.0.0.1:8002"; };
        "/updateapi" = { proxyPass = "http://127.0.0.1:8003"; };
        "/deleteapi" = { proxyPass = "http://127.0.0.1:8004"; };
        "/db_schema_api" = { proxyPass = "http://127.0.0.1:8006"; };
        "/coreapi" = { proxyPass = "http://127.0.0.1:8007"; };
        "/cms" = { proxyPass = "http://127.0.0.1:8008"; };
        "/sqlviews" = { proxyPass = "http://127.0.0.1:8009"; };
        "/auth" = { proxyPass = "http://127.0.0.1:8011"; };
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    email = "youremail@example.com"; # Change this
  };
}
