# cludo

![cludo](cludo.png)

A friendly Claude-superpowered terminal assistant. Describe what you want to do in plain English — cludo generates the shell command and asks before running it.

## Who is this for?

Sometimes you just need that one command you can never quite remember — the right `find` flags, how to rebase interactively, or what the `tar` extraction syntax is. You don't want to open a browser, start a Claude Code session, switch models, or deal with configured permissions. You just want the command, right now, in your terminal.

cludo is for:

- **Shell learners** — explore what commands exist and how they work without leaving the terminal
- **Tool learners** — learning git, ffmpeg, docker, or any CLI tool? ask in plain English and see the exact syntax
- **Anyone who forgets syntax** — stop context-switching; stay in the terminal and keep your flow

cludo skips the overhead and gets straight to the point.

## Prerequisites

- macOS with zsh
- [Claude CLI](https://github.com/anthropics/claude-code) installed and authenticated

## Install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/sirknigget/cludo/main/scripts/install.sh)
```

This installs the `cludo` script to `~/.local/bin`. Make sure that directory is in your `PATH`.

## Usage

```
cludo <describe what you want to do>
```

**Examples:**

```bash
cludo find all python files modified in the last week
cludo show disk usage sorted by size
cludo kill the process using port 3000
cludo compress all jpg files in this folder
```

cludo will show you the generated command and prompt for confirmation:

```
$ cludo find large files over 100mb

  find . -size +100M -type f

Run it? [y/n/c] (c = copy to clipboard):
```

- `y` — execute the command
- `c` — copy to clipboard without executing
- `n` / anything else — cancel

## How it works

1. Your description is sent to Claude Haiku with a strict system prompt instructing it to return only a raw shell command
2. cludo strips any markdown formatting from the response
3. You see the command and choose what to do with it
4. If a clarification is returned, it is shown and cludo exits

## License

MIT
