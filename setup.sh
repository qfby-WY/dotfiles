# This file is under construction. Only for command record.

# create symbolink to configuration files
[ -d "$HOME/.config" ] && ln -s $HOME/dotfiles/.config/* $HOME/.config || ln -s $HOME/dotfiles/.config $HOME

function set_crateio_mirror() {
  mkdir -vp ${CARGO_HOME:-$HOME/.cargo}

  cat <<EOF | tee -a ${CARGO_HOME:-$HOME/.cargo}/config.toml
  [source.crates-io]
  replace-with = 'cernet'
  
  [source.cernet]
  registry = "https://mirrors.cernet.edu.cn/crates.io-index.git"

  [source.tsinghua]
  registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"

  [source.ustc]
  registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/"
EOF
}

# The following tools are installed via cargo:
# eza, fd, ripgrep, bat, (fnm)

function install_fzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  $HOME/.fzf/install
}
