# Neovim IDE Integration

You're running inside Neovim via **claudecode.nvim**. You have two ways to access editor context:

## 1. Socket Queries (Neovim RPC)

Query the editor directly via `$NVIM` socket. Examples:

```bash
# Current file, line, content at cursor
nvim --server "$NVIM" --remote-expr 'json_encode({"file": expand("#".winbufnr(1).":p"), "line": getcurpos(1)[1], "content": getbufline(winbufnr(1), getcurpos(1)[1])[0]})'

# Window layout (to find code window vs terminals/sidebars)
nvim --server "$NVIM" --remote-expr 'json_encode(map(range(1, winnr("$")), {_, nr -> {"winnr": nr, "name": bufname(winbufnr(nr)), "filetype": getbufvar(winbufnr(nr), "&filetype")}}))'

# Lines around cursor (adjust window number as needed)
nvim --server "$NVIM" --remote-expr 'json_encode(getbufline(winbufnr(1), max([1,getcurpos(1)[1]-5]), getcurpos(1)[1]+5))'
```

Window 1 may be a sidebar (neo-tree, NvimTree). Query layout first if unsure.

## 2. MCP Tool

`mcp__ide__getDiagnostics` - Returns LSP errors/warnings. Use when debugging.

## File Edits

Use standard `Edit`/`Write` tools. Claude Code automatically shows diffs in the IDE for user approval.

## Proactive Context

When the user asks about code without specifying what, consider querying the socket to see what they're looking at, or ask for clarification.

## Visual Selection

When the user references a selection that cleared on window switch, query the last visual marks:

```bash
# Get last visual selection range from buffer N
nvim --server "$NVIM" --remote-expr 'json_encode([nvim_buf_get_mark(N, "<"), nvim_buf_get_mark(N, ">")])'
```

Use window layout query first to find the correct buffer number.