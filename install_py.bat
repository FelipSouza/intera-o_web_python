@Echo off

    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (

    goto UACPrompt
) else (
goto gotAdmin)


:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"


:MAIN

:check_connection
ping -n 1 www.google.com >nul 2>&1
if %errorlevel% neq 0 (
    echo O PC está desconectado. Tentando novamente...
    timeout /t 2 >nul
    goto check_connection
)

echo Internet OK. Continuando com a instalação...

cls

REM Define a URL do instalador do Python
set PYTHON_INSTALLER_URL=https://www.python.org/ftp/python/3.11.4/python-3.11.4-amd64.exe

REM Define o nome do arquivo do instalador
set PYTHON_INSTALLER=python-installer.exe

REM Baixa o instalador do Python
echo Baixando o instalador do Python...
powershell -Command "Invoke-WebRequest -Uri %PYTHON_INSTALLER_URL% -OutFile %PYTHON_INSTALLER%"

REM Executa o instalador do Python com opções para adicionar ao PATH e instalar pip
echo Instalando o Python...
start /wait %PYTHON_INSTALLER% /quiet InstallAllUsers=1 PrependPath=1 Include_pip=1

REM Remove o instalador após a instalação
del %PYTHON_INSTALLER%

REM Verifica se o Python e pip foram instalados corretamente
echo Verificando a instalação do Python...
python --version
pip --version

REM Instala os pacotes selenium e webdriver-manager
echo Instalando os pacotes selenium e webdriver-manager...
pip install selenium webdriver-manager

REM Verifica a instalação dos pacotes
echo Verificando a instalação dos pacotes...
pip show selenium
pip show webdriver-manager

