export DOTNET_ROOT=$/usr/lib/dotnet
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

if [ -e /home/andy/.nix-profile/etc/profile.d/nix.sh ]; then . /home/andy/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
