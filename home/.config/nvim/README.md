# Configuração do Neovim

Esta configuração usa Lua e gerencia plugins com [lazy.nvim](https://github.com/folke/lazy.nvim).

## Organização

- `init.lua` carrega os módulos de configuração.
- `lua/config/` contém opções, atalhos, autocmds, diagnósticos, LSP e a inicialização do lazy.nvim. O realce de sintaxe usa o recurso nativo do Neovim.
- `lua/plugins/` contém um arquivo por plugin. `all-themes.lua` agrupa os temas instalados para troca pelo Omarchy.
- `after/plugin/` contém ajustes aplicados depois que os plugins carregam, como a transparência.

O Lazy importa automaticamente os arquivos de `lua/plugins/`. Para adicionar um plugin, crie um arquivo nessa pasta com a especificação dele.

## Inicialização

Depois de vincular os dotfiles ao diretório pessoal, inicie o Neovim normalmente. Na primeira abertura, a configuração instala o `lazy.nvim` e os plugins declarados.

## Atalhos principais

A tecla líder é espaço.

- `Ctrl-s`: salvar
- `Espaço e`: alternar o explorador de arquivos
- `Espaço q`: alternar diagnósticos
- `Espaço s f`: buscar arquivos
- `Espaço s g`: buscar texto no projeto
- `Espaço Espaço`: buscar buffers
- `t t`: alternar terminal inferior
- `t f`: alternar terminal flutuante
- No modo de inserção, `(`, `[` e `{`, além de aspas simples e duplas, inserem também o delimitador de fechamento.

Os atalhos do LSP ficam disponíveis quando um servidor se conecta ao buffer. Para abrir o gerenciador de plugins, execute `:Lazy`.
