@echo off for /r %%i in (run.bat) do ( cd "%%~dpi" call "%%i" )
