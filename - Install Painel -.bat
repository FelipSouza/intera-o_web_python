@echo off
cls

del "C:\Users\Public\PainelChamados.py"
del "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\executarPainelChamados.bat"

cls

copy "PainelChamados.py" "C:\Users\Public\"
copy "executarPainelChamados.bat" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"


install_py.bat

cls
echo.
echo Arquivos copiados!
echo.
echo.
echo Valeu Felipe!
echo.
echo.
pause

