{ ... }:
{
  programs.zsh = {
    enable = true;
    enableVteIntegration = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 5000;
      path = /* zsh */ "$HOME/.zsh_history";
      append = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      saveNoDups = true;
      ignorePatterns = [
        "rm *"
      ];
    };

    initContent =
      /* zsh */ ''
        fastfetch --config examples/8.jsonc

        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' list-colors "$${(s.:.)LS_COLORS}"
        zstyle ':completion:*' menu no
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

        # eval "$(fzf --zsh)"
        eval "$(zoxide init --cmd cd zsh)"

        export PNPM_HOME="/home/hesham/.local/share/pnpm"
        case ":$PATH:" in
          *":$PNPM_HOME:"*) ;;
          *) export PATH="$PNPM_HOME:$PATH" ;;
        esac
      '';

    sessionVariables = {};

    shellAliases = {
      reload = "source ~/.zshrc";
      cls = "clear";
      ls = "eza";
      ll = "eza -l";
      la = "eza -a";
      # fetch = "fastfetch --config examples/6.jsonc";
      fetch = "fastfetch --config examples/26.jsonc";
      quickfetch = "fastfetch --config examples/8.jsonc";
      brave = "brave-browser --user-data-dir=~/.config/brave_shared";
      memgrind = "valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --log-file=valgrind-out.txt";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "fzf" ];
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "Aloxaf/fzf-tab"; }
      ];
    };
  };
}
