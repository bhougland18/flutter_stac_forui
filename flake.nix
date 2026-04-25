{
  description = "STAC forui components integration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nix-config.url = "path:/home/ben/nix-config";
    codex.url = "github:openai/codex";
    gemini-cli.url = "github:sadjow/gemini-cli-nix";
    claude-code.url = "github:sadjow/claude-code-nix";
  };

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      nix-config,
      codex,
      gemini-cli,
      claude-code,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      imports = [
        (nix-config + /devshells/features/core.nix)
        (nix-config + /devshells/features/ai-tools.nix)
        (nix-config + /devshells/features/beads.nix)
        (nix-config + /devshells/features/direnv.nix)
        (nix-config + /devshells/features/flutter.nix)
        (nix-config + /devshells/features/jujutsu.nix)
        (nix-config + /devshells/features/stac.nix)
      ];

      perSystem =
        { pkgs, lib, ... }:
        {
          config = {
            dendritic.devShell = {
              description = "STAC forui components development shell";
              packages = [ pkgs.patchelf ];
              features = {
                ai_tools.enable = lib.mkForce false;
                beads.enable = lib.mkForce true;
                direnv.enable = lib.mkForce true;
                flutter.enable = lib.mkForce true;
                jujutsu.enable = lib.mkForce true;
                stac.enable = lib.mkForce true;

                # Explicitly disable features not needed for this project
                android.enable = lib.mkForce false;
                rust.enable = lib.mkForce false;
                native_cc.enable = lib.mkForce false;
                crane.enable = lib.mkForce false;
                cargo_polylith.enable = lib.mkForce false;
                rinf.enable = lib.mkForce false;
                rust_devtools.enable = lib.mkForce false;
              };
            };
          };
        };
    };
}
