```bat
:: bat脚本不支持中文，实际使用时需要删除中文注释
:: 脚本需要放置在指定工程根目录,在ide的before build中调用。
:: 生成svnversion.h，工程中需要应用该文件，获取svn号。

@echo off
set src_dir=%~dp0

:: 整个SVN的id
:: 找到指定行
::for /f "delims=" %%i in ('svn info ^| findstr "Revision"') do set rev=%%i
:: 截取指定位置开始字符
::set rev=%rev:~10%

:: SVN下指定目录的id，可能一个SVN下有多个工程目录
:: 找到指定行，获取指定切片
for /f "tokens=4 delims= " %%i in ('svn info ^| findstr "Rev:"') do set rev=%%i

echo #define SVN_REVISION %rev% > "%src_dir%"svnversion.h

```

