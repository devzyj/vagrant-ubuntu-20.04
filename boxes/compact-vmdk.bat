@echo off

:: 压缩虚拟机硬盘文件脚本
:: 使用方式 ./compact-vmdk.bat "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" "C:\xxx.vmdk"
set VBoxManagePath=%~f1
set VirtualBoxDir=%~dp2
set VirtualBoxName=%~n2
set SystemDate=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%

echo clonehd "%VirtualBoxDir%%VirtualBoxName%.vmdk" to "%VirtualBoxDir%%VirtualBoxName%-%SystemDate%.vdi"
"%VBoxManagePath%" clonehd "%VirtualBoxDir%%VirtualBoxName%.vmdk" "%VirtualBoxDir%%VirtualBoxName%-%SystemDate%.vdi" --format vdi

echo compact "%VirtualBoxDir%%VirtualBoxName%-%SystemDate%.vdi"
"%VBoxManagePath%" modifyhd "%VirtualBoxDir%%VirtualBoxName%-%SystemDate%.vdi" --compact

echo clonehd "%VirtualBoxDir%%VirtualBoxName%-%SystemDate%.vdi" to "%VirtualBoxDir%%VirtualBoxName%-%SystemDate%.vmdk"
"%VBoxManagePath%" clonehd "%VirtualBoxDir%%VirtualBoxName%-%SystemDate%.vdi" "%VirtualBoxDir%%VirtualBoxName%-%SystemDate%.vmdk" --format vmdk
