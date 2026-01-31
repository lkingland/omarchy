# Neovim IDE Integration

You're running inside Neovim via **claudecode.nvim**.

## What works automatically

- **File edits**: Edit/Write tools trigger diff views for user approval
- **Selections**: When user sends a selection, you receive it via the protocol
- **Diagnostics**: Call `mcp__ide__getDiagnostics` for LSP errors/warnings

## If you need more context

Query the editor via `$NVIM` socket:

```bash
# Window layout (find code window vs sidebars/terminals)
nvim --server "$NVIM" --remote-expr 'json_encode(map(range(1, winnr("$")), {_, nr -> {"winnr": nr, "buf": bufname(winbufnr(nr)), "ft": getbufvar(winbufnr(nr), "&filetype")}}))'

# Cursor position and nearby lines (adjust winnr as needed)
nvim --server "$NVIM" --remote-expr 'json_encode({"file": expand("%:p"), "line": line("."), "context": getline(max([1,line(".")-5]), line(".")+5)})'
```

When uncertain what the user is looking at, ask rather than guessing.
