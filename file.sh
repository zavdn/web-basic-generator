#!/bin/bash

if [ "$1" = "1" ]; then
  N_EX=$(ls -1 ./src | wc -l)
  N_EX_NEXT=$((N_EX + 1))
  N_EX_NEXT_FORMATED=$(printf "%02d" $N_EX_NEXT)

  echo "$N_EX_NEXT_FORMATED"
fi

if [ "$1" = "2" ]; then
  # Ruta de la carpeta principal
  ruta_carpeta="./src"
  # Inicializar una cadena vacía para almacenar los nombres de las subcarpetas
  subcarpetas=""
  # Recorrer todas las subcarpetas
  for subcarpeta in "$ruta_carpeta"/*; do
    # Verificar si el elemento es una carpeta
    if [ -d "$subcarpeta" ]; then
      # Obtener el nombre de la carpeta sin la ruta completa
      nombre_carpeta=$(basename "$subcarpeta")
      # Agregar el nombre de la carpeta al listado, con una coma si ya hay elementos
      if [ -z "$subcarpetas" ]; then
        subcarpetas="$nombre_carpeta"
      else
        subcarpetas="$subcarpetas,$nombre_carpeta"
      fi
    fi
  done
  # Imprimir el listado de subcarpetas
  echo "$subcarpetas"
fi

