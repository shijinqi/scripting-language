@ECHO OFF

IF NOT EXIST .\YsubBB (MD .\YsubBB)
COPY /Y .\Ysub\* /B .\YsubBB
@ECHO ���Ƶ�YsubBB

IF NOT EXIST .\YsubCW (MD .\YsubCW)
COPY /Y .\Ysub\* /B .\YsubCW
@ECHO ���Ƶ�YsubCW

IF NOT EXIST .\YsubDB (MD .\YsubDB)
COPY /Y .\Ysub\* /B .\YsubDB
@ECHO ���Ƶ�YsubDB

IF NOT EXIST .\YsubGPL (MD .\YsubGPL)
COPY /Y .\Ysub\* /B .\YsubGPL
@ECHO ���Ƶ�YsubGPL

@ECHO ON
REM @ECHO. & PAUSE



