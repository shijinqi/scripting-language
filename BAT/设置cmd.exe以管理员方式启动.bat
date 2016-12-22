@ECHO OFF
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Windows\System32\cmd.exe" /t REG_SZ /d "RUNASADMIN" /f

IF %ERRORLEVEL%==0 (
	ECHO 设置成功
) ELSE (
	ECHO 设置失败
)
ECHO. & PAUSE