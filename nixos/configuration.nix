# This file contains a function with the format
# { input }: {output (name value paris of options)}
# pkgs is the set of all nix packages (what channel are they from?)
# config is the current environment, can check curernt values of options.
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.hostId = "86800cb9";
  networking.wireless.enable = true;  # Enables wireless.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "lat9w-16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

   fonts = {
     fonts = with pkgs; [
       inconsolata  # monospaced nice programming font
#	powerline-fonts-2014-12-27	
     ];
   };
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
  #   wget
	zsh
	neovim
	tmux
        dmenu # Used by xmonad to run programs
	firefoxWrapper
	pidgin
	git
	termite
	leiningen
	irssi
	ctags # Used by tagbar in vim
        python3 #DO I RLY NEED THIS
	haskellPackages.ghc
	haskellPackages.hdevtools # Used in Vim to inteact with GHC
	haskellPackages.hlint # Lint for Vim
	haskellPackages.hoogle
	haskellPackages.pointfree
	haskellPackages.ghcMod
   ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  #Specific for NIXOS on Virtual box, the only line specific for that
  services.virtualboxGuest.enable = true;

  services.xserver = {
  # Enable the X11 windowing system.
    enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";
    
  # Enable the KDE Desktop Environment.
  #  displayManager.kdm.enable = true;
  #  desktopManager.kde4.enable = true;

  # Enable xmonad
    windowManager.default = "xmonad";
    windowManager.xmonad.enable = true;
    windowManager.xmonad.enableContribAndExtras = true;

    # Dont use any desktop manager
    desktopManager.default = "none";

   # Display manager is responsible for the login screen
   # Default displaymanager is slim (lightdm is the best alternative)
   displayManager.auto.enable = true;
   displayManager.auto.user = "henke";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.guest = {
    name = "henke";
    description = "Henrik Larsson";
    group = "users";
    extraGroups = [ "wheel" ]; # Enable SUDO usage
    uid = 1000;
    createHome = true;
    home = "/home/henke";
    shell = "/run/current-system/sw/bin/zsh";
  };

}
