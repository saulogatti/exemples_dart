#!/bin/bash
# Script para atualizar dependências e rodar build_runner

set -e

echo "Atualizando dependências..."
flutter pub upgrade

echo "Executando build_runner..."
flutter pub run build_runner build --delete-conflicting-outputs

echo "Processo finalizado."
