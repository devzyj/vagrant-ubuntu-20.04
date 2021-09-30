@echo off

set VirtualBoxName=%1
set SystemDate=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%

echo vagrant package %VirtualBoxName%-%SystemDate%.box
vagrant package --base %VirtualBoxName% --output %VirtualBoxName%-%SystemDate%.box