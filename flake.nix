{
  description = "API Studio full deployment environment with Python, PostgreSQL, pgAdmin, Nginx, and Certbot";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShell = pkgs.mkShell {
          name = "apistudio-env";

buildInputs = with pkgs; [
  python3
  python3Packages.virtualenv

  postgresql
  pgadmin4

  nginx

  (certbot.override {
    plugins = [ certbotPlugins.nginx ];
  })

  bash
  git
  curl
          ];
        };
      });
}
