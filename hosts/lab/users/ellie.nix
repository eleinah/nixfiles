{ config, pkgs, ... }:

{
  # DON'T FORGET TO SET A PASSWORD!
  users.users.ellie = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "input"
    ];
    shell = pkgs.zsh;
    openssh = {
      authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD2M/FCDrMBjERs4nwyXFuNxYMnBwA3fWvb5WiGhkzJdKLv1lBG9VHFOjTGssWhd+y2Y48VgjwmPjg37MxbVEa90wPydGgLzwg69OxyXaJ5D+wXXm0JAHhvhDec3hYN9LXXUDrnFJ7oM5huc5kaAWAdIR0XvETuE1H/Si2IRtSdnh2wvWAEPv16GQ+L95lnpEEhStyy2DqEjrChIvaqXbdHORlxC31whLw3OXmZMOi//PicPgH3oqW+N7UPdbLt0B5L/85nNsPE+/hEBag4yps3EyRApTKWt9v88q3CfiZRY/jIrp/Y4nwJ5DdajFJ6cPyovwWN5M/mwIj7RnvLqmjouwWwP7VMrXd3PEf0v5/Ixj+9Fi+TmLLqeKYG5nxhDfGw0Uywmf7ftpZtSbGdpITNIZJY79be8857d5JC41mIA/hXc7FuRn11yqJc73IjmUp9uqM2EGp+nAQ4LjEHuBPq+d7DQqBi1bsgU54yOzFWdwHa6IYhHWQOjKNuXpdpd6XOyyoXfxi6R693/e1t0FMGmB8ITOGl2WqDSgcXl2QDAYMB0ITcwW006saNR08zFn5KmXT0JhgTDECQwvdNetqA9HFN7eckBecmmni2h40GK5DwsSfPcXMBIwTjI8mHv0bnmi5mV1osJM7sJWCydkyKrOmzbQmVjHl6ZxiHBwzcmw== openpgp:0x161BB29F"
      ];
    }
  };
}
