@ECHO OFF
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Windows\System32\cmd.exe" /t REG_SZ /d "RUNASADMIN" /f

IF %ERRORLEVEL%==0 (
	ECHO ���óɹ�
) ELSE (
	ECHO ����ʧ��
)
ECHO. & PAUSE