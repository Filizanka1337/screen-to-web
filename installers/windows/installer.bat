@echo off

REM Sprawdzenie wersji Pythona
python --version | findstr /C:"Python 3.9" >nul

IF %errorlevel% NEQ 0 (
    REM Python 3.9 nie jest zainstalowany, używanie winget do instalacji
    winget install Python3 --exact --version 3.9.* -e
)

REM Odczytanie pliku "lista.txt"
setlocal enabledelayedexpansion
for /f "delims=" %%i in (lista.txt) do (
    REM Instalowanie bibliotek pipem
    python -m pip install %%i
)

echo Instalacja zakończona.
