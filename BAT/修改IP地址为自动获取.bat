@echo off
netsh interface ip set address name="本地连接" source=dhcp
netsh interface ip set dns "本地连接" dhcp
echo IP地址已修改为自动获取，按任意键关闭本窗口！
pause>nul