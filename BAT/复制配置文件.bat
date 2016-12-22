@ECHO OFF

IF NOT EXIST .\资产估值系统\Main\Config (MD .\资产估值系统\Main\Config)
COPY /Y D:\工作\连接工具\config\YssSysConfig.xml /B .\资产估值系统\Main\Config
@ECHO 复制到估值系统成功

IF NOT EXIST .\资产估值系统\新版估值报表系统\Config (MD .\资产估值系统\新版估值报表系统\Config)
COPY /Y D:\工作\连接工具\config\YssSysConfig.xml /B .\资产估值系统\新版估值报表系统\Config
@ECHO 复制到报表系统成功

IF NOT EXIST .\财务系统\Config (MD .\财务系统\Config)
COPY /Y D:\工作\连接工具\config\YssSysConfig.xml /B .\财务系统\Config
@ECHO 复制到财务系统成功

IF NOT EXIST .\导入导出工具\Config (MD .\导入导出工具\Config)
COPY /Y D:\工作\连接工具\config\YssSysConfig.xml /B .\导入导出工具\Config
@ECHO 复制到导入导出系统成功

IF NOT EXIST .\股票篮子系统\Config (MD .\股票篮子系统\Config)
COPY /Y D:\工作\连接工具\config\YssSysConfig.xml /B .\股票篮子系统\Config
@ECHO 复制到股票篮子系统成功

IF NOT EXIST .\划款指令系统\Config (MD .\划款指令系统\Config)
COPY /Y D:\工作\连接工具\config\YssSysConfig.xml /B .\划款指令系统\Config
@ECHO 复制到划款指令系统成功

IF NOT EXIST .\数据库集中管理工具\Config (MD .\数据库集中管理工具\Config)
COPY /Y D:\工作\连接工具\config\YssSysConfig.xml /B .\数据库集中管理工具\Config
@ECHO 复制到数据库集中管理工具成功

@ECHO ON
REM @ECHO. & PAUSE



