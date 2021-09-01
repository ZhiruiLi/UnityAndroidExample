@echo off
cd /D "%~dp0"

WHERE upack
IF %ERRORLEVEL% NEQ 0 (
  WHERE go
  IF %ERRORLEVEL% NEQ 0 (
    echo you must install golang first
    exit /b 2
  )
  go get -u github.com/zhiruili/upack@latest
)

upack /v /a .\AndroidProject /e com.example.mysdk.MainActivity /m mysdk -p android.permission.BATTERY_STATS .\Assets\Plugins\Android

goto :eof
