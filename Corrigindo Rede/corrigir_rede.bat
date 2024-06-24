@REM Autor: Joao Gustavo Bispo
@REM Data: 05/06/2024
@REM Descricao: Script para corrigir problemas de rede no Windows

@echo off
cls
echo Corrigindo problemas de rede...

:release_ip
echo Liberando endereco IP...
ipconfig /release
if %errorLevel% neq 0 echo Erro ao liberar endereco IP.
echo =====================================

:renew_ip
echo Renovando endereco IP...
ipconfig /renew
if %errorLevel% neq 0 echo Erro ao renovar endereco IP.
echo =====================================

:flush_dns
echo Limpando cache DNS...
ipconfig /flushdns
if %errorLevel% neq 0 echo Erro ao limpar cache DNS.
echo =====================================

:register_dns
echo Registrando DNS...
ipconfig /registerdns
if %errorLevel% neq 0 echo Erro ao registrar DNS.
echo =====================================

:renew_netbios
echo Renovando registros NetBIOS...
nbtstat -rr
if %errorLevel% neq 0 echo Erro ao renovar registros NetBIOS.
echo =====================================

:reset_ip
echo Redefinindo configuracoes de IP...
netsh int ip reset all
if %errorLevel% neq 0 echo Erro ao redefinir configuracoes de IP.
echo =====================================

:reset_winsock
echo Redefinindo Winsock...
netsh winsock reset
if %errorLevel% neq 0 echo Erro ao redefinir Winsock.
echo =====================================

echo Rede atualizada com sucesso.
echo Pressione qualquer tecla para voltar ao menu.
pause
