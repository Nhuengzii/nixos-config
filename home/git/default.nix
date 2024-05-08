{config, pkgs, ...}:
{
    programs.git = {
        enable = false;
        userName = "nhuengzii";
        userEmail = "32nhuengzii@gmail.com";
        extraConfig = {
            init.defaultBranch = "main";
        };
    };
}
