@echo off

:: vagrant package 脚本（在当前目录下，生成以时间格式命名的 box 文件）
:: 使用方式 ./package.bat <VirtualBox_Name>
set VirtualBoxName=%1
set SystemDate=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%

echo vagrant package %VirtualBoxName%-%SystemDate%.box
vagrant package --base %VirtualBoxName% --output %VirtualBoxName%-%SystemDate%.box