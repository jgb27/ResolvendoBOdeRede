@REM Autor: Joao Gustavo Bispo
@REM Data: 05/06/2024
@REM Descricao: Script para verificar o status da rede

@echo off
cls
echo Verificando o status da rede...
echo =========================================
echo Informacoes de rede
echo =========================================
echo.
echo Endereco IP:
ipconfig | findstr /i "ipv4"
echo.
echo Gateway Padrao:
ipconfig | findstr /i "gateway"
echo.
echo Servidor DNS:
ipconfig | findstr /i "dns"
echo.
echo Conexao com a Internet:
ping -n 1 www.google.com | findstr /i "perda"
echo.
echo Conexao com o Gateway:
ping -n 1
echo.
echo Conexao com o Servidor DNS:
ping -n 1
echo.
echo =========================================
echo.
pause
exit
