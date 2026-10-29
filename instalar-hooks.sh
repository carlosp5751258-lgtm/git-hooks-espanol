#!/usr/bin/env bash
# =====================================================================
# Instala los hooks de .githooks/ en un repositorio git usando
# "git config core.hooksPath" (sin copiar nada a .git/hooks).
#
# Uso:
#   ./instalar-hooks.sh                 -> instala en el repo actual
#   ./instalar-hooks.sh /ruta/al/repo   -> instala en otro repo
#   ./instalar-hooks.sh --desinstalar [/ruta/al/repo]
#
# Si el repo destino no tiene carpeta .githooks/, la copia desde
# este pack. Como .githooks/ se versiona, todo tu equipo comparte
# los mismos hooks: cada persona solo ejecuta este script una vez.
# =====================================================================
set -euo pipefail

DIR_PACK="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CARPETA_HOOKS=".githooks"

desinstalar=0
if [[ "${1:-}" == "--desinstalar" ]]; then
  desinstalar=1
  shift
fi
if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  sed -n '3,13p' "$0" | sed 's/^# \{0,1\}//'
  exit 0
fi

destino="${1:-$PWD}"

if ! raiz="$(git -C "$destino" rev-parse --show-toplevel 2>/dev/null)"; then
  echo "✖ '$destino' no es un repositorio git. Ejecuta 'git init' primero." >&2
  exit 1
fi

if (( desinstalar )); then
  git -C "$raiz" config --unset core.hooksPath || true
  echo "✔ core.hooksPath eliminado en $raiz. Git vuelve a usar .git/hooks."
  exit 0
fi

# Aviso si ya hay otro gestor de hooks configurado (ej. husky).
actual="$(git -C "$raiz" config --get core.hooksPath || true)"
if [[ -n "$actual" && "$actual" != "$CARPETA_HOOKS" ]]; then
  echo "⚠ core.hooksPath ya apunta a '$actual' (¿husky?). Se reemplazará por '$CARPETA_HOOKS'." >&2
fi

# Copia los hooks del pack si el repo todavía no los tiene.
if [[ ! -d "$raiz/$CARPETA_HOOKS" ]]; then
  if [[ ! -d "$DIR_PACK/$CARPETA_HOOKS" ]]; then
    echo "✖ No se encontró $DIR_PACK/$CARPETA_HOOKS" >&2
    exit 1
  fi
  cp -R "$DIR_PACK/$CARPETA_HOOKS" "$raiz/$CARPETA_HOOKS"
  echo "• Copiada la carpeta $CARPETA_HOOKS/ a $raiz"
fi

# Los hooks deben ser ejecutables o git los ignora en silencio.
chmod +x "$raiz/$CARPETA_HOOKS"/*

# Ruta relativa: funciona aunque el repo se mueva de carpeta.
git -C "$raiz" config core.hooksPath "$CARPETA_HOOKS"

echo "✔ Hooks instalados en $raiz"
for hook in "$raiz/$CARPETA_HOOKS"/*; do
  echo "   - $(basename "$hook")"
done
echo ""
echo "Siguiente paso: git add $CARPETA_HOOKS && git commit -m \"chore: agregar git hooks\""
