{ config, pkgs, ... }:

{

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "C.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "en_GB.UTF-8/UTF-8"
    "C.UTF-8/UTF-8"
  ];

  i18n.extraLocaleSettings = {
    LC_ALL = "C.UTF-8";
  };

}
