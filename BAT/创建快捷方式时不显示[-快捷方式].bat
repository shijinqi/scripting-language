@ECHO OFF
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /t REG_BINARY /d 00000000 /f

IF %ERRORLEVEL%==0 (
	ECHO ���óɹ�
) ELSE (
	ECHO ����ʧ��
)
ECHO. & PAUSE