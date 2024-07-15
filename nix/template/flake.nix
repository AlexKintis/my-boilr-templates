{
  description = "{{ProjectDescription}}";

  inputs = {
    nixpkgs.url = "nixpkgs"; # Resolves to github:NixOS/nixpkgs

    # Helpers for system-specific outputs
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:

    # Create system-specific outputs for the standard Nix systems
    # https://github.com/numtide/flake-utils/blob/master/default.nix#L3-L9
    flake-utils.lib.eachDefaultSystem (system:
      let
      	pkgs = import nixpkgs { inherit system; };
        nativeBuildInputs = with pkgs; [ {{NeededPackages}} ];
      in
      {

        # Create a script that runs `npm deploy`
        packages.default = pkgs.writeScriptBin "run-app" ''
          #!${pkgs.runtimeShell}
          # FIXME: Change the following line to run your app
          # ${pkgs.cargo}/bin/cargo run
        '';

        # Create a default app that runs the script
        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/run-app";
        };

        # Create a shell that has the needed packages
        devShells.default = pkgs.mkShell {

            nativeBuildInputs = nativeBuildInputs; 

            shellHook = ''
                clear;
                echo "#################"
                echo "# In nix shell! #"
                echo "#################"
            '';
        };

      });
}
