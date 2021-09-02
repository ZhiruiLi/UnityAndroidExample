@echo off
cd /D "%~dp0"

upack --help >nul 2>&1 || (
  go install github.com/zhiruili/upack@latest
)

upack /v /a .\AndroidSample /e com.example.mod.MainActivity /m mod -p android.permission.BATTERY_STATS .\Assets\Plugins\Android

goto :eof
