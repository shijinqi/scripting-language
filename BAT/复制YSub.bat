@ECHO OFF

IF NOT EXIST .\YsubBB (MD .\YsubBB)
COPY /Y .\Ysub\* /B .\YsubBB
@ECHO 复制到YsubBB

IF NOT EXIST .\YsubCW (MD .\YsubCW)
COPY /Y .\Ysub\* /B .\YsubCW
@ECHO 复制到YsubCW

IF NOT EXIST .\YsubDB (MD .\YsubDB)
COPY /Y .\Ysub\* /B .\YsubDB
@ECHO 复制到YsubDB

IF NOT EXIST .\YsubGPL (MD .\YsubGPL)
COPY /Y .\Ysub\* /B .\YsubGPL
@ECHO 复制到YsubGPL

@ECHO ON
REM @ECHO. & PAUSE



