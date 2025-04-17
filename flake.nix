{
  description = "API Studio with Nginx, PostgreSQL, and Certbot";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";  # Use recent Nixpkgs
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShell = pkgs.mkShell {
          name = "apistudio-env";

          buildInputs = with pkgs; [
            python3
            python3Packages.virtualenv

            postgresql
            pgadmin4

            nginx

            certbot
            certbot-nginx  # <-- This is the correct plugin name in nixpkgs 23.11+

            bash
            git
            curl
          ];

          shellHook = ''
            echo "🚀 API Studio Dev Shell Ready!"
          '';
        };
      });
}
