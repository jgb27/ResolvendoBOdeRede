@REM Autor: Joao Gustavo Bispo
@REM Data: 05/06/2024
@REM Descricao: Menu principal para a solucao de problemas de rede

@echo off
title Script para Solucao de Problemas de Rede

:checkAdmin
:: Verifica se o script esta sendo executado com privilegios de administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Por favor, execute este script como administrador.
    pause
    exit
)

:menu
cls
echo =========================================
echo           SOLUCAO DE PROBLEMAS DE REDE
echo =========================================
echo 1. Corrigir problemas de rede
echo 2. Informacoes do Sistema
echo 3. Verificar configuracao de rede
echo 0. Sair
echo =========================================
set /p choice=Escolha uma opcao (1, 2, 3, 0):

if "%choice%"=="1" goto corrigir_rede
if "%choice%"=="2" goto info_sistema
if "%choice%"=="3" goto verifica_rede
if "%choice%"=="4" goto sair
echo Opcao invalida. Tente novamente.
pause
goto menu

:corrigir_rede
call corrigir_rede.bat
goto menu

:verifica_rede
call verifica_rede.bat
goto menu

:info_sistema
call info_sistema.bat
goto menu

:sair
cls
echo Saindo do programa...
exit
