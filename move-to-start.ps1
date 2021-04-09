param(
    $path = $pwd
)
function IsAdministrator
{
    $Identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $Principal = New-Object System.Security.Principal.WindowsPrincipal($Identity)
    $Principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
}

function IsUacEnabled
{
    (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System).EnableLua -ne 0
}

#
# Main script
#
$currentPath = $pwd
if (!(IsAdministrator))
{
    if (IsUacEnabled)
    {
        [string[]]$argList = @('-NoProfile', '-NoExit', '-File', $MyInvocation.MyCommand.Path)
        $argList += $MyInvocation.BoundParameters.GetEnumerator() | Foreach {"-$($_.Key)", "$($_.Value)"}
        $argList += $MyInvocation.UnboundArguments
        $argList += "-path $pwd"
        Start-Process PowerShell.exe -Verb Runas  -ArgumentList $argList
        return
    }
    else
    {
        throw "You must be administrator to run this script"
    }
}

Write-Output "Path: $path"
Write-Output "Current directory: $pwd"
Write-Output "Compiling."
C:\Program` Files\AutoHotkey\Compiler\Ahk2Exe.exe /in "$path\Keyboardy.ahk" /out "$path\Keyboardy.exe"
Write-Output "Finished compiling."

# Create a scheduled task to run Keyboardy on login or startup
$Action = New-ScheduledTaskAction -Execute "$path\Keyboardy.exe"
$Trigger = New-ScheduledTaskTrigger -AtLogOn 
$Settings = New-ScheduledTaskSettingsSet -MultipleInstances Parallel 
$Principal = New-ScheduledTaskPrincipal -RunLevel Highest -LogonType Interactive -UserId 'Abdulrhman'
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings -Principal $Principal
#Unregister-ScheduledTask -TaskName 'Keyboardy startup'
Register-ScheduledTask -TaskName 'Keyboardy startup' -InputObject $Task


$startupPath = "C:\Users\Abdulrhman\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
echo "Moving exe to startup"
Copy-Item -Path "$path\Keyboardy.exe" -Destination "$startupPath"  -Force
echo "Moved"
Read-Host -Prompt "Press Enter to exit"