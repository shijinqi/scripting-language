@echo off
netsh interface ip set address name="��������" source=static 192.168.72.23 255.255.252.0 192.168.75.1 1
netsh interface ip set dns "��������" static 202.96.128.68 primary
netsh interface ip add dns "��������" 202.96.134.133
echo IP��ַ���޸�Ϊ��˾��������������رձ����ڣ�
pause>nul