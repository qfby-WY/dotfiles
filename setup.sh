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

function update_lazygit() {
  api_url="https://api.github.com/repos/jesseduffield/lazygit/releases/latest"
  LATEST_VERSION=$(curl -fsS ${api_url} | grep -Po '"tag_name": *"v\K[^"]*')
  if [[ -x "$(command -v lazygit)" ]]; then
    CURRENT_VERSION=$(lazygit --version | grep -Po '(?:^|, )version=\K\d+\.\d+\.\d+')
    if [[ "${CURRENT_VERSION}" == "${LATEST_VERSION}" ]]; then
      echo "alreadly the latest!"
      return 0
    fi
  fi
  cd $HOME/Downloads/
  download_url="https://github.com/jesseduffield/lazygit/releases/download"
  download_url+="/v${LATEST_VERSION}/lazygit_${LATEST_VERSION}_Linux_x86_64.tar.gz"
  curl -Lo lazygit.tar.gz ${download_url}
  tar xf lazygit.tar.gz lazygit
  install -Dm 755 lazygit $HOME/.local/bin/
  rm -rf lazygit*
  cd $HOME
}
