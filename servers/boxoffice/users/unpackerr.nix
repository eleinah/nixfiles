{
  config,
  lib,
  pkgs,
  ...
}:

{
  users.users.unpackerr = {
    isSystemUser = true;
    home = "/var/lib/unpackerr";
    group = "download";
  };
}
