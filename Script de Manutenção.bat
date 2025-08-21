@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion
title ⚙️ Diagnóstico e Manutenção do Windows
color 0A
mode con cols=100 lines=40

:menu
cls
set "SP=          "

echo %SP%╔═══════════════════════════════════════════════╦════════════════════════════════════════════════╗
echo %SP%║   🛠️ DIAGNÓSTICO E MANUTENÇÃO DO WINDOWS      ║                                                ║
echo %SP%╠═══════════════════════════════════════════════╬════════════════════════════════════════════════╣
echo %SP%║ [01] Teste de Memória RAM                     ║ [16] Relatório de Bateria                      ║
echo %SP%║ [02] Desfragmentação de Disco                 ║ [17] Teste de Bateria                          ║
echo %SP%║ [03] Verificação de Disco (CHKDSK)            ║ [18] Download de Drivers (Intel)               ║
echo %SP%║ [04] Verificação de Arquivos SFC              ║ [19] Especificações de Hardware                ║
echo %SP%║ [05] Limpeza de Arquivos Temporários          ║ [20] Relatório de Erros do Windows             ║
echo %SP%║ [06] Windows Update / Drivers                 ║ [21] Limpeza Arquivos Prefetch                 ║
echo %SP%║ [07] Verificar Status SMART do HD             ║ [22] Ativação do Windows 10/11                 ║
echo %SP%║ [08] Informações do Sistema                   ║ [23] Criar Ponto de Restauração                ║
echo %SP%║ [09] Teste de Velocidade da CPU               ║ [24] Limpeza Avançada de Disco                 ║
echo %SP%║ [10] Informações da GPU                       ║ [25] Resetar Configurações de Rede             ║
echo %SP%║ [11] Número de Série do Equipamento           ║ [26] Verificar Integridade DISM                ║
echo %SP%║ [12] Chave de Ativação do Windows             ║ [27] Verificar Programas na Inicialização      ║
echo %SP%║ [13] Versão da BIOS                           ║ [28] Resetar Cache Store/DNS                   ║
echo %SP%║ [14] Gabinete Aberto                          ║ [29] Teste de Velocidade de Internet           ║
echo %SP%║ [15] Limpar Alerta de Memória                 ║ [30] 🚪 Sair                                   ║
echo %SP%╚═══════════════════════════════════════════════╩════════════════════════════════════════════════╝
echo.

set /p choice="Escolha uma opção (1-30): "

if "%choice%"=="1" goto TesteMemoria
if "%choice%"=="2" goto Desfragmentacao
if "%choice%"=="3" goto VerificacaoDisco
if "%choice%"=="4" goto VerificacaoSFC
if "%choice%"=="5" goto LimpezaTemp
if "%choice%"=="6" goto Atualizacoes
if "%choice%"=="7" goto TesteHD
if "%choice%"=="8" goto InfoSistema
if "%choice%"=="9" goto TesteCPU
if "%choice%"=="10" goto InfoGPU
if "%choice%"=="11" goto NumeroSerie
if "%choice%"=="12" goto ChaveAtivacao
if "%choice%"=="13" goto VersaoBIOS
if "%choice%"=="14" goto GabineteAberto
if "%choice%"=="15" goto AlertaMemoria
if "%choice%"=="16" goto RelatorioBateria
if "%choice%"=="17" goto TesteBateria
if "%choice%"=="18" goto DownloadDrivers
if "%choice%"=="19" goto EspecificacoesDispositivos
if "%choice%"=="20" goto RelatorioErros
if "%choice%"=="21" goto InstrucoesDPKDM
if "%choice%"=="22" goto AtivacaoSO
if "%choice%"=="23" goto CriarPontoRestauração
if "%choice%"=="24" goto LimpezaAvancada
if "%choice%"=="25" goto ResetarRede
if "%choice%"=="26" goto VerificarDISM
if "%choice%"=="27" goto Inicializacao
if "%choice%"=="28" goto ResetarCache
if "%choice%"=="29" goto TesteSpeed
if "%choice%"=="30" goto Sair
goto menu

REM ==================== FUNÇÕES ====================

:TesteMemoria
cls & echo 🔍 Teste de Memória RAM... & pause & mdsched.exe & goto menu

:Desfragmentacao
cls & echo 🌀 Desfragmentando disco C:... & defrag C: -h -v & pause & goto menu

:VerificacaoDisco
cls & echo 🔍 Verificando disco C:... & chkdsk C: /f /r & pause & goto menu

:VerificacaoSFC
cls & echo 🛠️ Verificando arquivos do sistema... & sfc /scannow & pause & goto menu

:LimpezaTemp
cls & echo 🧹 Limpando arquivos temporários... & del /s /q %temp%\*.* >nul & echo ✔ Limpeza concluída. & pause & goto menu

:Atualizacoes
cls & echo ⏳ Abrindo Windows Update... & start ms-settings:windowsupdate & pause & goto menu

:TesteHD
cls & echo 📀 Verificando status SMART do HD... & wmic diskdrive get status & pause & goto menu

:InfoSistema
cls & echo 📋 Informações do Sistema... & systeminfo & pause & goto menu

:TesteCPU
cls & echo ⚡ Informações da CPU... & wmic cpu get name,CurrentClockSpeed,MaxClockSpeed & pause & goto menu

:InfoGPU
cls & echo 🎨 Informações da GPU... & wmic path win32_videocontroller get name,AdapterRAM,DriverVersion,VideoProcessor & pause & goto menu

:NumeroSerie
cls & echo 🏷️ Número de Série do Equipamento... & wmic bios get serialnumber & pause & goto menu

:ChaveAtivacao
cls & echo 🔑 Chave de Ativação do Windows... & wmic path softwarelicensingservice get OA3xOriginalProductKey & pause & goto menu

:VersaoBIOS
cls & echo 🔍 Versão da BIOS... & wmic bios get smbiosbiosversion & pause & goto menu

:GabineteAberto
cls
echo ==========================================
echo    ORIENTAÇÃO: AVISO DE GABINETE ABERTO
echo ==========================================
echo.
echo 1. Reinicie e acesse BIOS (F2)
echo 2. No chipset, procure "Aviso gabinete aberto" e limpe.
echo 3. Salve e saia, configure conforme necessidade.
echo ** Esta configuração varia conforme OEM.
pause
goto menu

:AlertaMemoria
cls
echo ==========================================
echo    ORIENTAÇÃO: LIMPAR ALERTA DE MEMÓRIA
echo ==========================================
echo 1. Acesse BIOS (F2)
echo 2. Vá até Segurança e limpe o alerta.
echo ** Localização varia conforme OEM.
pause
goto menu

:RelatorioBateria
cls & echo 🔋 Gerando relatório de bateria... & powercfg /batteryreport /output "C:\battery_report.html" & echo ✔ Relatório salvo em C:\battery_report.html & pause & goto menu

:TesteBateria
cls & echo 🔋 Teste de eficiência (energy report)... & powercfg /energy /output "C:\energy_report.html" & echo ✔ Relatório salvo em C:\energy_report.html & pause & goto menu

:DownloadDrivers
cls & echo 🌐 Acessando site de drivers (Daten)... & start "" https://www.intel.com.br/content/www/br/pt/support/detect.html & pause & goto menu

:EspecificacoesDispositivos
cls & echo 📦 Listagem de dispositivos... & pnputil /enum-devices & pause & goto menu

:RelatorioErros
cls & echo 📑 Relatório de eventos de segurança... & wevtutil query-events Security /format:Table > "C:\relatorio_erros.txt" & echo ✔ Relatório salvo em C:\relatorio_erros.txt & pause & goto menu

:LimpezaPrefetch
cls
echo 🧹 Limpando Prefetch...
pause
del /s /q C:\Windows\Prefetch\*.* >nul 2>&1
echo ✔ Prefetch limpo com sucesso.
pause
goto menu

echo ** Nota: A localização dessa opção pode variar conforme o modelo do computador.
pause
goto menu

:AtivacaoSO
cls
echo 🪪 Ativação do Windows: use uma chave válida ou conta Microsoft com licença digital.
echo.
echo 1. Ativação por Telefone (Windows 11)
echo.
echo Pressione as teclas Win (tecla com o logotipo do Windows, geralmente ao lado do espaço) + R
echo para abrir a janela "Executar", digite: SLUI 4
echo.
echo (Observe que há um espaço entre SLUI e 4), e clique em OK.
echo.
echo 2. Selecione o país: Brasil e clique em "Avançar".
echo.
echo 3. Ligue para o número de telefone 0800 para entrar em contato com o
echo Centro de Ativação de Produtos Microsoft.
echo.
echo Você será conduzido por um menu automatizado onde deverá responder a
echo algumas perguntas sobre o produto que está tentando ativar (Windows 11),
echo se já o ativou (responda Nao), e se possui uma chave de produto (responda Sim).
echo.
pause
goto menu

:CriarPontoRestauração
cls
echo 🛡️ Criando ponto de restauração...
powershell -Command "Checkpoint-Computer -Description 'PontoManual' -RestorePointType 'MODIFY_SETTINGS'"
echo ✔ Ponto de restauração criado.
pause
goto menu

:LimpezaAvancada
cls
echo 🧼 Limpeza Avançada de Disco...
cleanmgr /sageset:1
cleanmgr /sagerun:1
pause
goto menu

:ResetarRede
cls
echo 🌐 Resetando Configurações de Rede...
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
echo ✔ Configurações de rede redefinidas.
pause
goto menu

:VerificarDISM
cls
echo 🛠️ Verificando imagem do sistema (DISM)...
DISM /Online /Cleanup-Image /RestoreHealth
pause
goto menu

:Inicializacao
cls
echo 🖥 Verificando programas na inicialização...
start taskmgr
pause
goto menu

:ResetarCache
cls
echo ♻️ Resetando Cache da Windows Store e DNS...
wsreset.exe
ipconfig /flushdns
echo ✔ Cache da Store e DNS redefinidos.
pause
goto menu

:TesteSpeed
cls & echo 📶 Testando velocidade de Internet... & start "" https://www.speedtest.net/pt & pause & goto menu


:Sair
cls & echo 👋 Saindo do utilitário... & timeout /t 2 >nul & exit


