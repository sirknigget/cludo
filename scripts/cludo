#!/usr/bin/env zsh
# cludo — Claude Haiku terminal command assistant
# Usage: cludo <describe what you want to do>

if [[ $# -eq 0 ]]; then
  echo "Usage: cludo <describe what you want to do>"
  exit 1
fi

user_prompt="$*"
full_prompt="You are a shell command assistant for macOS/zsh. The user will describe what they want to do in the terminal. Respond with ONLY the exact command to run—no explanation, no markdown fences, no extra text. Just the raw command on a single line.

User request: ${user_prompt}"

cmd=$(claude --model claude-haiku-4-5-20251001 -p "$full_prompt" 2>/dev/null)

if [[ -z "$cmd" ]]; then
  echo "cludo: no command returned" >&2
  exit 1
fi

# Strip markdown code fences in case the model adds them
cmd=$(printf '%s' "$cmd" | sed -E '/^```/d' | grep -v '^[[:space:]]*$' | head -1)

if [[ -z "$cmd" ]]; then
  echo "cludo: could not parse command from response" >&2
  exit 1
fi

echo ""
printf "  \033[1;36m%s\033[0m\n" "$cmd"
echo ""
printf "Run? [y]es / [n]o / [c]opy to clipboard: "
read -r choice
echo ""

case "$choice" in
  y|Y)
    eval "$cmd"
    ;;
  c|C)
    printf '%s' "$cmd" | pbcopy
    echo "Copied to clipboard."
    ;;
  *)
    echo "Aborted."
    ;;
esac
