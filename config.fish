# rbenv設定
set -gx PATH '/Users/yukio.okabe/.rbenv/shims' $PATH
set -gx RBENV_SHELL fish
source '/usr/local/Cellar/rbenv/1.1.2/libexec/../completions/rbenv.fish'
command rbenv rehash 2>/dev/null
function rbenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (rbenv "sh-$command" $argv|psub)
  case '*'
    command rbenv "$command" $argv
  end
end

# fzf 設定
set -U FZF_ENABLE_OPEN_PREVIEW 1   # ファイルのオープン時にプレジューウインドウを表示
