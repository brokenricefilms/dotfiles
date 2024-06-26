#KeyHistory
#NoEnv
#SingleInstance Force
#InstallMouseHook
#InstallKeybdHook
SetBatchLines -1
ListLines Off
SendMode Input
SetWorkingDir %A_ScriptDir%

SC056::RControl
;SC151::movingWindowToOtherDisplay() ;PgDn SC149 PgUp
Home::^#F11
End::^#F12
AppsKey::RControl
!^F1::Send, #^0
#WheelDown::Volume_Up
#WheelUp::Volume_Down

#Include, %A_ScriptDir%\lib\TimelineClick.ahk
#Include, %A_ScriptDir%\lib\snippets.ahk

#IfWinActive, ahk_exe Resolve.exe
{
    F13:: ;Change hotkey to desired hotkey
    TimelineClick(["\ImageSearch\Resolve\EditPage.png", "\ImageSearch\Resolve\Fairlight.png",  "\ImageSearch\Resolve\CutPage.png"], [75,63,45])
    return
}

#IfWinActive ahk_exe chrome.exe
F2::^w
F1::^+t
F3::
Send, ^c
Sleep, 50
Send, ^t
Sleep, 50
Send, ^v
Send, {enter}
return
F4::
Send, ^c
Sleep, 50
Send, ^t
Sleep, 50
Send, y{Space}
Send, ^v
Sleep, 50
Send, {enter}
return
#IfWinActive

#IfWinActive ahk_exe WindowsTerminal.exe
F1::^+t
F2::^+w
f3::^+p
#IfWinActive

movingWindowToOtherDisplay() {
  Send #+{Left}
  SysGet, monitors, MonitorCount

  SysGet, MonitorCount, MonitorCount
  SysGet, MonitorPrimary, MonitorPrimary
  
  current := 0
  Loop, %MonitorCount%
  {
    SysGet, Monitor, Monitor, %A_Index%
    CoordMode, Mouse, Screen
    MouseGetPos, MouseX, MouseY
    if (  (MouseX >= MonitorLeft) && (MouseX < MonitorRight) && (MouseY >= MonitorTop) && (MouseY < MonitorBottom) )
    {
      current := A_Index
      currentRX := (MouseX - MonitorLeft) / (MonitorRight - MonitorLeft)
      currentRY := (MouseY - MonitorTop) / (MonitorBottom - MonitorTop)
      break
    }
  }
  next := current + 1
  
  if (next > MonitorCount)
    next := 1
  SysGet, Monitor, Monitor, %next%
  
  newX := MonitorLeft + currentRX*(MonitorRight - MonitorLeft)
  newY := MonitorTop + currentRY*(MonitorBottom - MonitorTop)
  
  DllCall("SetCursorPos", "int", newX, "int", newY)
  DllCall("SetCursorPos", "int", newX, "int", newY)
}

toggleMaxWindow()
{
  WinGet, WinState, MinMax, A
  if (WinState = 1)
  {
    WinRestore, A
  }
  else
  {
    WinMaximize, A
  }
}

Tab & e::Run, "C:\Users\master\editing\Projects"
Tab & w::Run, "C:\Users\master\Downloads"
Tab & r::Run, "C:\Users\master\Pictures"
Tab & t::Run, "C:\Users\master\Videos\"

Tab::Tab

Space & ,::Send {PgUp}
Space & -::Volume_Down
Space & 1::Send ^#1
Space & 2::Send ^#2
Space & 3::Send ^#3
Space & 4::Send ^#4
Space & 5::Send ^#5
Space & =::Volume_Up
Space & F11::toggleMaxWindow()
Space & F1::Send #^6
Space & F2::Send #^7
Space & v::Send #!+v
Space & F3::Send #^8
Space & F4::Send #^9
Space & F5::Send #^0
Space & F9::Reload
Space & [::Send !{Left}
Space & ]::Send !{Right}
Space & c::^c
Space & d::BS
Space & e::Up
Space & f::MButton
Space & g::RButton
Space & h::Send {Blind}{Left}
Space & i::Send {Blind}{Home}
Space & j::Send {Blind}{Down}
Space & k::Send {Blind}{Up}
Space & l::Send {Blind}{Right}
Space & m::Send {PgDn}
;Space & n::movingWindowToOtherDisplay()
Space & n::^t
Space & o::Send {Blind}{End}
Space & p::Send ^{PgDn}
Space & a::
While GetKeyState("a", "P") {
 Send {WheelDown}
 Sleep, 1
}
Return
Space & q::
While GetKeyState("q", "P") {
 Send {WheelUp}
 Sleep, 1
}
Return
Space & r::Down
Space & s::Send, {Click 2}
Space & t::Right
Space & u::Send ^{PgUp}
Space & w::Left
Space & x::Del
Space & z::^z
Space & Tab::Send, ^{WheelDown}
Space & `::Send, ^{WheelUp}
Space & Esc::Send !{F4}
Space & b::Browser_Back

 Space::Send  {Space}
+Space::Send +{Space}
!Space::Send !{Space}
#Space::Send #{Space}
^Space::Send ^{Space}

`; & d::Send +v{Del}
`; & z::Send +z+z
`; & j::Send ^+,
`; & l::Send ^+.
`; & s::
MouseMove 653, 757, 0 
Click
Return

 `;::Send  {;}
+`;::Send +{;}
!`;::Send !{;}
#`;::Send #{;}
^`;::Send ^{;}
