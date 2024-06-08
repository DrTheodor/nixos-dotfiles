{ pkgs, config, lib, inputs, ... }:

with lib;

{
  nixpkgs.overlays = [
    (_: final: {
      wlroots = final.wlroots.overrideAttrs (_: {
        patches = [
          ./patches/wlroots-nvidia.patch
          ./patches/wlroots-screenshare.patch
        ];
      });
    })
  ];  

  # Works for Wayland as well
  services.xserver.videoDrivers = [ "nvidia" ];

  environment.variables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    XDG_SESSION_TYPE = "wayland";
    LIBVA_DRIVER_NAME = "nvidia";
    NIXOS_OZONE_WL = "1";
  };
  
  hardware.nvidia = {
    # Is needed for Wayland compositors
    modesetting.enable = true;

    powerManagement.enable = false; 
    powerManagement.finegrained = false;

    # Use open source driver
    open = false;

    # Enable nvidia settings menu
    nvidiaSettings = true;
    
    # Driver package. Using an outdated driver which doesn't cause problems with games.
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "535.113.01";
      sha256_64bit = "sha256-KOME2N/oG39en2BAS/OMYvyjVXjZdSLjxwoOjyMWdIE=";
      sha256_aarch64 = "sha256-k7k22z5PYZdBVfuYXVcl9SFUMqZmK4qyxoRwlYyRdgU=";
      openSha256 = "sha256-dktHCoESqoNfu5M73aY5MQGROlZawZwzBqs3RkOyfoQ=";
      settingsSha256 = "sha256-qNjfsT9NGV151EHnG4fgBonVFSKc4yFEVomtXg9uYD4=";
      persistencedSha256 = "sha256-ci86XGlno6DbHw6rkVSzBpopaapfJvk0+lHcR4LDq50=";

      ibtSupport = true;
    };
  };
}
