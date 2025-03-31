#!/bin/bash

# --- Configuración ---
REPOSITORY_URL="git@github.com:<tu_usuario>/santiagomosca.github.io.git" # Reemplaza con tu URL
PELICAN_CONFIG="portfolio/pelicanconf.py"
CONTENT_DIR="portfolio/content"
OUTPUT_SUBMODULE="portfolio/output"
COMMIT_MESSAGE_SUBMODULE="${1:-Actualizar sitio web generado por Pelican}"
COMMIT_MESSAGE_MAIN="${2:-Actualizar referencia del submódulo portfolio/output}"

# --- Funciones ---
error_exit() {
  echo "Error: $1" >&2
  exit 1
}

check_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    error_exit "El comando '$1' no está instalado. Por favor, instálalo."
  fi
}

# --- Comprobaciones iniciales ---
check_command pelican
check_command git

# --- Generar el sitio web con Pelican ---
echo "Generando el sitio web con Pelican..."
pelican "$CONTENT_DIR" -o "$OUTPUT_SUBMODULE" -s "$PELICAN_CONFIG" || error_exit "Falló la generación del sitio web con Pelican."
echo "Sitio web generado en '$OUTPUT_SUBMODULE'."

# --- Navegar al submódulo y hacer git add, commit y push ---
echo "Navegando al directorio del submódulo: '$OUTPUT_SUBMODULE'"
cd "$OUTPUT_SUBMODULE" || error_exit "No se pudo acceder al directorio del submódulo."

echo "Agregando cambios en el submódulo..."
git add . || error_exit "Falló 'git add' en el submódulo."

# Comprobar si hay cambios para commitear
if ! git diff --cached --quiet; then
  echo "Commiteando cambios en el submódulo con mensaje: '$COMMIT_MESSAGE_SUBMODULE'"
  git commit -m "$COMMIT_MESSAGE_SUBMODULE" || error_exit "Falló 'git commit' en el submódulo."

  echo "Subiendo cambios del submódulo..."
  git push origin main || error_exit "Falló 'git push' del submódulo."
else
  echo "No hay cambios para commitear en el submódulo."
fi

# --- Volver al repositorio principal y actualizar la referencia del submódulo ---
echo "Volviendo al directorio raíz del repositorio principal..."
cd ../.. || error_exit "No se pudo volver al directorio raíz."
cd ../.. || error_exit "No se pudo volver al directorio raíz (otra vez)." # Por si acaso

echo "Agregando la referencia actualizada del submódulo..."
git add "$OUTPUT_SUBMODULE" || error_exit "Falló 'git add' de la referencia del submódulo."

echo "Commiteando la referencia actualizada del submódulo con mensaje: '$COMMIT_MESSAGE_MAIN'"
git commit -m "$COMMIT_MESSAGE_MAIN" || error_exit "Falló 'git commit' de la referencia del submódulo."

echo "Subiendo los cambios al repositorio principal..."
git push origin main || error_exit "Falló 'git push' del repositorio principal."

echo "Proceso completado. Tu sitio web debería estar actualizado en GitHub Pages."
