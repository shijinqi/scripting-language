@ECHO OFF

IF NOT EXIST .\�ʲ���ֵϵͳ\Main\Config (MD .\�ʲ���ֵϵͳ\Main\Config)
COPY /Y D:\����\���ӹ���\config\YssSysConfig.xml /B .\�ʲ���ֵϵͳ\Main\Config
@ECHO ���Ƶ���ֵϵͳ�ɹ�

IF NOT EXIST .\�ʲ���ֵϵͳ\�°��ֵ����ϵͳ\Config (MD .\�ʲ���ֵϵͳ\�°��ֵ����ϵͳ\Config)
COPY /Y D:\����\���ӹ���\config\YssSysConfig.xml /B .\�ʲ���ֵϵͳ\�°��ֵ����ϵͳ\Config
@ECHO ���Ƶ�����ϵͳ�ɹ�

IF NOT EXIST .\����ϵͳ\Config (MD .\����ϵͳ\Config)
COPY /Y D:\����\���ӹ���\config\YssSysConfig.xml /B .\����ϵͳ\Config
@ECHO ���Ƶ�����ϵͳ�ɹ�

IF NOT EXIST .\���뵼������\Config (MD .\���뵼������\Config)
COPY /Y D:\����\���ӹ���\config\YssSysConfig.xml /B .\���뵼������\Config
@ECHO ���Ƶ����뵼��ϵͳ�ɹ�

IF NOT EXIST .\��Ʊ����ϵͳ\Config (MD .\��Ʊ����ϵͳ\Config)
COPY /Y D:\����\���ӹ���\config\YssSysConfig.xml /B .\��Ʊ����ϵͳ\Config
@ECHO ���Ƶ���Ʊ����ϵͳ�ɹ�

IF NOT EXIST .\����ָ��ϵͳ\Config (MD .\����ָ��ϵͳ\Config)
COPY /Y D:\����\���ӹ���\config\YssSysConfig.xml /B .\����ָ��ϵͳ\Config
@ECHO ���Ƶ�����ָ��ϵͳ�ɹ�

IF NOT EXIST .\���ݿ⼯�й�����\Config (MD .\���ݿ⼯�й�����\Config)
COPY /Y D:\����\���ӹ���\config\YssSysConfig.xml /B .\���ݿ⼯�й�����\Config
@ECHO ���Ƶ����ݿ⼯�й����߳ɹ�

@ECHO ON
REM @ECHO. & PAUSE



