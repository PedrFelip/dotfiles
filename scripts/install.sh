#!/usr/bin/env bash
set -euo pipefail

repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)

if ! command -v stow >/dev/null 2>&1; then
  if ! command -v pacman >/dev/null 2>&1; then
    printf 'Erro: este instalador requer Arch Linux e pacman.\n' >&2
    exit 1
  fi

  printf 'GNU Stow não encontrado. Instalando pelo pacman...\n'
  sudo pacman --sync --needed stow
fi

if ! command -v yay >/dev/null 2>&1; then
  printf 'Erro: yay não está instalado. Instale-o antes de continuar.\n' >&2
  exit 1
fi

printf 'Verificando a fonte Departure Mono...\n'
yay --sync --needed otf-departure-mono

backup_root="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
backup_created=0

while IFS= read -r relative; do
  [[ $relative == home/* ]] || continue

  source_file="$repo_dir/$relative"
  [[ -f $source_file ]] || continue

  target="$HOME/${relative#home/}"
  [[ -e $target || -L $target ]] || continue

  # Keep links already managed by this checkout and back up everything else.
  if [[ -L $target && $(readlink -f -- "$target") == "$source_file" ]]; then
    continue
  fi

  backup_path="$backup_root/${relative#home/}"
  mkdir -p -- "$(dirname -- "$backup_path")"
  mv -- "$target" "$backup_path"
  backup_created=1
done < <(git -C "$repo_dir" ls-files --cached --others --exclude-standard)

if ((backup_created)); then
  printf 'Arquivos antigos movidos para: %s\n' "$backup_root"
fi

stow --no-folding \
  --ignore='^\.config/nvim/lua/plugins/theme\.lua$' \
  --restow --target="$HOME" --dir="$repo_dir" home

if ! command -v omarchy >/dev/null 2>&1; then
  printf 'Erro: Omarchy não está instalado.\n' >&2
  exit 1
fi

printf 'Instalando plugins do Omarchy...\n'

install_plugin() {
  local id=$1
  local url=$2

  if omarchy plugin list --json | jq -e --arg id "$id" 'any(.[]; .id == $id)' >/dev/null; then
    omarchy plugin enable "$id"
  else
    omarchy plugin add "$url" --enable --yes
  fi
}

install_plugin quickshell.spotify https://github.com/stappmus/Omarchy-Spotify.git
install_plugin stappmus.lyrics https://github.com/stappmus/Omasing.git

# Instala os temas
omarchy theme install https://github.com/bjarneo/omarchy-coffee-theme

omarchy theme install https://github.com/r-bart/omarchy-starsend-theme.git
omarchy theme set starsend

# Tema Kanji nos workspaces
omarchy pkg add noto-fonts-cjk

# garante que font eseja no sistema e ativa o plugin de workspaces do Kanji
omarchy plugin add https://github.com/bjarneo/omarchy-kanji-workspaces.git --enable
omarchy plugin disable omarchy.workspaces
printf 'Dotfiles vinculados com sucesso.\n'
