{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.gpg = {
    enable = true;

    settings = {
      use-agent = true;
      no-greeting = true;
      no-comments = true;
      auto-key-locate = "local";
      keyid-format = "0xlong";
      with-fingerprint = true;
      utf8-strings = true;
      display-charset = "utf-8";
      require-secmem = true;
      require-cross-certification = true;
      no-random-seed-file = true;
      force-mdc = true;
      list-options = "show-keyring";

      personal-cipher-preferences = "AES256 AES192 AES CAST5";
      personal-digest-preferences = "SHA512 SHA384 SHA256";
      cert-digest-algo = "SHA512";

      personal-compress-preferences = "Uncompressed";

      default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES CAST5 Uncompressed";
    };

    scdaemonSettings = {
      disable-ccid = true;
      pcsc-shared = true;
    };
  };
}
