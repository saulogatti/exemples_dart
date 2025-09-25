# Script PowerShell para atualizar dependências e rodar build_runner

Write-Host "Atualizando dependências..."
flutter pub upgrade --major-versions

Write-Host "Executando build_runner..."
flutter pub run build_runner build --delete-conflicting-outputs

Write-Host "Processo finalizado."
