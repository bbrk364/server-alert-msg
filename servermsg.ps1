# Queries all active user session for user
Write-Host "================================================================================================================================================================"
$currentUsers = Query User
Write-Host $currentUsers -ForegroundColor Cyan
Write-Host "================================================================================================================================================================
"

# Default server message
$defaultMsg = "Emergency server maintenance needs to be preformed.  The server will shutdown in 5 minutes.  Please save your work, and log off.`n`n- William"
Write-Host "Default Server Message:"
Write-Host "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
Write-Host $defaultMsg -ForegroundColor Cyan
Write-Host "----------------------------------------------------------------------------------------------------------------------------------------------------------------
"

# Option to use a custom message
$msg = Read-Host -Prompt "Server Message (Leave blank for default)"

if (!$msg) {
    $msg = $defaultMsg
}

Write-Host "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
Write-Host $msg -ForegroundColor Green
Write-Host "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
Write-Host "================================================================================================================================================================
"

# Default userlist to send the message
$defaultUsers = "williamcrutchfield", "wcrutchfield"
#Write-Host "================================================================================================================================================================"
Write-Host "Default Users:"
Write-Host "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
Write-Host $defaultUsers -ForegroundColor Cyan
Write-Host "----------------------------------------------------------------------------------------------------------------------------------------------------------------
"

# Option to use a custom userlist
Write-Host "Input must be in the format of `(`"user1`"`,`"user2`"`)" -ForegroundColor Yellow
$users = Read-Host -Prompt "Users to Recieve Message (Leave blank for default)"

if (!$users) {
    $users = $defaultUsers
}

Write-Host "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
Write-Host $users -ForegroundColor Green
Write-Host "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
Write-Host "================================================================================================================================================================
"
Write-Host "Does everyting look correct?" -ForegroundColor Green
$continue = Read-Host -Prompt "Press y to continue"

if ($continue -ne "y" -or $continue -ne "Y") {
    exit
}

Write-Host ""

foreach ($user in $users) {
    MSG $user /V /W $msg
}

Write-Host ""
Read-Host 'Press any key to exit'
