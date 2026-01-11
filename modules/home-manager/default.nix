# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  # my-module = import ./my-module.nix;
  librepods = import ./librepods.nix;
  helium-browser = import ./helium-browser.nix;
  hytale = import ./hytale.nix;
}
