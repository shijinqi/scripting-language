@ECHO OFF
COLOR F9
ECHO �������ϵͳ�����ļ������Ե�......
DEL /F /S /Q %SystemDrive%\*.tmp
DEL /F /S /Q %SystemDrive%\*._mp
DEL /F /S /Q %SystemDrive%\*.log
DEL /F /S /Q %SystemDrive%\*.gid
DEL /F /S /Q %SystemDrive%\*.chk
DEL /F /S /Q %SystemDrive%\*.old
DEL /F /S /Q %SystemDrive%\recycled\*.*
DEL /F /S /Q %WinDir%\*.bak
DEL /F /S /Q %WinDir%\prefetch\*.*
RD /S /Q %WinDir%\temp & md %WinDir%\temp
DEL /F /Q %UserProfile%\cookies\*.*
DEL /F /Q %UserProfile%\recent\*.*
DEL /F /S /Q "%UserProfile%\Local Settings\Temporary Internet Files\*.*"
DEL /F /S /Q "%UserProfile%\Local Settings\Temp\*.*"
DEL /F /S /Q "%UserProfile%\recent\*.*"
ECHO ���ϵͳ������ɣ�
ECHO. & PAUSE