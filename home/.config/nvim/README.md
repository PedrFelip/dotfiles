# Configuração inicial do Neovim

Esta configuração usa Lua e instala plugins com [lazy.nvim](https://github.com/folke/lazy.nvim).

## Como usar

Inicie o Neovim apontando para esta pasta:

```sh
nvim --config /home/pedrofelipe/.config/new-nvim
```

Na primeira abertura, o bootstrap clona o lazy.nvim; depois o lazy instala os plugins declarados em `lua/config/lazy.lua`.

Atalhos iniciais (a tecla líder é espaço):

- `Espaço w`: salvar
- `Espaço q`: fechar janela
- `Espaço e`: explorador de arquivos
- `Espaço ff`: buscar arquivos
- `Espaço fg`: buscar texto no projeto (requer `ripgrep`)
- `Espaço fb`: buscar buffers

Para abrir o gerenciador de plugins, execute `:Lazy`.
