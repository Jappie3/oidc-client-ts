{
  description = "OpenID Connect (OIDC) and OAuth2 protocol support for browser-based JavaScript applications";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    packages.${system}.default =
      pkgs.buildNpmPackage
      {
        name = "oidc-client-ts";
        pname = "oidc-client-ts";
        npmDepsHash = "sha256-CXVeK6jIQEi39bF0BKzRKTu2+ZM38Rf4nboWVmQ4tnQ=";
        npmFlags = ["--verbose"];
        src = ./.;
      };
  };
}
