@ECHO OFF
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /t REG_BINARY /d 00000000 /f

IF %ERRORLEVEL%==0 (
	ECHO 设置成功
) ELSE (
	ECHO 设置失败
)
ECHO. & PAUSE