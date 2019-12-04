# This script simply forces servermsg.ps1 to run as an administrator.
$currentPath = $MyInvocation.MyCommand.Path
$dir = Split-Path $currentPath
$scriptPath = $dir + "\servermsg.ps1"

Start-Process powershell -Verb runAs $scriptPath
