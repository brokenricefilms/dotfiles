#Include %A_ScriptDir%\desktop_switcher.ahk

launch_or_swich_chrome()
{
IfWinExist ahk_exe chrome.exe
{
 WinActivateBottom, ahk_exe chrome.exe
}
Else
{
 Run "C:\Program Files\Google\Chrome\Application\chrome.exe"
}
Return
}

launch_or_swich_windows_terminal()
{
IfWinExist ahk_exe WindowsTerminal.exe
{
 WinActivateBottom, ahk_exe WindowsTerminal.exe
}
Else
{
 Run "C:\Users\PC\AppData\Local\Microsoft\WindowsApps\wt.exe"
}
Return
}

!w::launch_or_swich_chrome()
!c::launch_or_swich_windows_terminal()

!q::!F4
