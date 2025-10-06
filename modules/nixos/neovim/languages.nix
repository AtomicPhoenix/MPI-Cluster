let
  enableLanguage = {
    enable = true;
    lsp.enable = true;
  };
in {
  enableFormat = true;
  enableTreesitter = true;

  nix = enableLanguage // {extraDiagnostics.enable = true;};
  bash = enableLanguage;
  clang = enableLanguage;

  markdown = {
    enable = true;
    lsp.enable = true;
    extensions.markview-nvim.enable = true;
  };
}
