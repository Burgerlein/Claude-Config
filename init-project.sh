#!/usr/bin/env bash
# Bindet claude-config als Submodule in das aktuelle Projekt ein.
# Aufruf im Projekt-Root:  /pfad/zu/init-project.sh [dotnet|vue]
set -euo pipefail

CONFIG_REPO="${CONFIG_REPO:-https://github.com/Burgerlein/claude-config.git}"
DIR=".claude-config"
IMPORT_LINE="@${DIR}/global/CLAUDE.md"
STACK="${1:-}"

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
  echo "Kein Git-Repo. Zuerst 'git init' ausführen." >&2
  exit 1
}
cd "$(git rev-parse --show-toplevel)"

# 1. Submodule
if [ -d "$DIR" ]; then
  echo "• $DIR existiert bereits"
else
  git submodule add "$CONFIG_REPO" "$DIR"
fi

# 2. Import-Zeile in die Projekt-CLAUDE.md
touch CLAUDE.md
if ! grep -qxF "$IMPORT_LINE" CLAUDE.md; then
  { printf '%s\n\n' "$IMPORT_LINE"; cat CLAUDE.md; } > CLAUDE.md.tmp
  mv CLAUDE.md.tmp CLAUDE.md
  echo "• Import in CLAUDE.md eingetragen"
fi

# 3. Optional: Stack-Vorlage anhängen
if [ -n "$STACK" ]; then
  TEMPLATE="$DIR/templates/CLAUDE.$STACK.md"
  MARKER="<!-- claude-config:$STACK -->"
  if [ ! -f "$TEMPLATE" ]; then
    echo "! Vorlage $TEMPLATE nicht gefunden" >&2
  elif grep -qxF "$MARKER" CLAUDE.md; then
    echo "• Vorlage '$STACK' bereits vorhanden"
  else
    { printf '\n%s\n' "$MARKER"; cat "$TEMPLATE"; } >> CLAUDE.md
    echo "• Vorlage '$STACK' angehängt"
  fi
fi

# 4. Skills verlinken
if [ -d "$DIR/skills" ]; then
  mkdir -p .claude/skills
  for skill in "$DIR"/skills/*/; do
    [ -d "$skill" ] || continue
    name="$(basename "$skill")"
    ln -sfn "../../$DIR/skills/$name" ".claude/skills/$name"
    echo "• Skill verlinkt: $name"
  done
fi

# 5. Start-Skripte kopieren (vorhandene nicht überschreiben)
if [ -d "$DIR/templates/scripts" ]; then
  mkdir -p scripts
  cp -rn "$DIR/templates/scripts/." scripts/
  echo "• Start-Skripte nach scripts/ kopiert"
fi

echo "Fertig. Mit 'git add .' und einem Commit festhalten."
