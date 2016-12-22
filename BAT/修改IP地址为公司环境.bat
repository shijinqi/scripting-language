@echo off
netsh interface ip set address name="本地连接" source=static 192.168.72.23 255.255.252.0 192.168.75.1 1
netsh interface ip set dns "本地连接" static 202.96.128.68 primary
netsh interface ip add dns "本地连接" 202.96.134.133
echo IP地址已修改为公司环境，按任意键关闭本窗口！
pause>nul