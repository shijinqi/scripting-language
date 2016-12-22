@ECHO OFF

COPY /Y .\Connect\fundacc.lic /B .\资产估值系统\Main
COPY /Y .\Connect\fundacc.lic /B .\资产估值系统\数据接口管理
COPY /Y .\Connect\fundacc.lic /B .\资产估值系统\业务凭证管理
@ECHO 复制到估值系统成功

COPY /Y .\Connect\fundacc.lic /B .\资产估值系统\新版估值报表系统
@ECHO 复制到报表系统成功

COPY /Y .\Connect\fundacc.lic /B .\财务系统
@ECHO 复制到财务系统成功

COPY /Y .\Connect\fundacc.lic /B .\导入导出工具
@ECHO 复制到导入导出系统成功

COPY /Y .\Connect\fundacc.lic /B .\股票篮子系统
@ECHO 复制到股票篮子系统成功

COPY /Y .\Connect\fundacc.lic /B .\划款指令系统
@ECHO 复制到划款指令系统成功

@ECHO ON
REM @ECHO. & PAUSE



