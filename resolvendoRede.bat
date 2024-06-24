@REM Autor: Joao Gustavo Bispo
@REM Data: 05/06/2024
@REM Descricao: Script para corrigir problemas de rede no Windows com menu interativo e melhorias

@echo off
title Script para Solucao de Problemas de Rede

:checkAdmin
:: Verifica se o script esta sendo executado com privilégios de administrador
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
echo 2. Reiniciar o PC
echo 3. Sair
echo =========================================
set /p choice=Escolha uma opcao (1, 2, 3): 

if "%choice%"=="1" goto corrigir_rede
if "%choice%"=="2" goto reiniciar_pc
if "%choice%"=="3" goto sair
echo Opcao invalida. Tente novamente.
pause
goto menu

:corrigir_rede
cls
echo Corrigindo problemas de rede...
call:release_ip
call:renew_ip
call:flush_dns
call:register_dns
call:renew_netbios
call:reset_ip
call:reset_winsock
echo Rede atualizada com sucesso.
echo Pressione qualquer tecla para voltar ao menu.
pause
goto menu

:release_ip
echo Liberando endereco IP...
ipconfig /release
if %errorLevel% neq 0 echo Erro ao liberar endereco IP.
echo =====================================
goto:eof

:renew_ip
echo Renovando endereco IP...
ipconfig /renew
if %errorLevel% neq 0 echo Erro ao renovar endereco IP.
echo =====================================
goto:eof

:flush_dns
echo Limpando cache DNS...
ipconfig /flushdns
if %errorLevel% neq 0 echo Erro ao limpar cache DNS.
echo =====================================
goto:eof

:register_dns
echo Registrando DNS...
ipconfig /registerdns
if %errorLevel% neq 0 echo Erro ao registrar DNS.
echo =====================================
goto:eof

:renew_netbios
echo Renovando registros NetBIOS...
nbtstat -rr
if %errorLevel% neq 0 echo Erro ao renovar registros NetBIOS.
echo =====================================
goto:eof

:reset_ip
echo Redefinindo configuracoes de IP...
netsh int ip reset all
if %errorLevel% neq 0 echo Erro ao redefinir configuracoes de IP.
echo =====================================
goto:eof

:reset_winsock
echo Redefinindo Winsock...
netsh winsock reset
if %errorLevel% neq 0 echo Erro ao redefinir Winsock.
echo =====================================
goto:eof

:reiniciar_pc
cls
echo O PC sera reiniciado em 10 segundos.
timeout /t 10 /nobreak >nul
shutdown -r -c "Reiniciando em 10 segundos" -t 10
goto sair

:sair
cls
echo Saindo do programa...
exit
