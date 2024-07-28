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
!^F1::send #^0
#WheelDown::Volume_Up
#WheelUp::Volume_Down
^;::Send {Esc}
Esc::!F4

#Include, %A_ScriptDir%\lib\TimelineClick.ahk
#Include, %A_ScriptDir%\lib\snippets.ahk

#IfWinActive, ahk_exe Resolve.exe
{
    F13:: ;Change hotkey to desired hotkey
    TimelineClick(["\ImageSearch\Resolve\EditPage.png", "\ImageSearch\Resolve\Fairlight.png",  "\ImageSearch\Resolve\CutPage.png"], [75,63,45])
    return
}

#IfWinActive ahk_exe floorp.exe
F1::^+t
F2::^w
F3::
send ^c
Sleep, 50
send ^t
Sleep, 50
send ^v
send {enter}
return
F4::
send ^c
Sleep, 50
send ^t
Sleep, 50
send v{space}
send ^v
Sleep, 50
send {enter}
return
F5::
send ^c
Sleep, 50
send ^t
Sleep, 50
send i{space}
send ^v
Sleep, 50
send {enter}
return
^o::^+a
F6::
send ^c
Sleep, 50
send ^t
Sleep, 50
send t{space}
send ^v
Sleep, 50
send {enter}
return
!r::Send ^+!k
!f::Send ^+!j
!a::
send ^t
Sleep, 50
send `%{space}
return
!w::Send ^{PgUp}
!s::Send ^{PgDn}
F13::Send ^t
#IfWinActive

#IfWinActive ahk_exe WindowsTerminal.exe
F3::^+t
F2::^+w
F13::!/
#IfWinActive

#IfWinActive ahk_exe obsidian.exe
F1::+1
F13::p
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
Tab & t::Run, "E:\YouTube\"
Tab & 2::Run, "E:\obs\"

Tab::Tab

space & ,::PgUp
space & -::Volume_Down
space & 1::Send ^#1
space & 2::Send ^#2
space & 3::Send ^#3
space & 4::Send ^#4
space & 5::Send ^#5
space & =::Volume_Up
space & F11::toggleMaxWindow()
space & F1::Send #^6
space & F2::Send #^7
space & v::Send #!+v
space & F3::Send #^8
space & F4::Send #^9
space & F5::Send #^0
space & F9::Reload
space & [::Send !{Left}
space & ]::Send !{Right}
space & c::^c
space & d::BS
space & e::Up
space & f::MButton
space & g::RButton
space & h::Left
space & i::Home
space & j::Down
space & k::Up
space & l::Right
space & m::PgDn
;space & n::movingWindowToOtherDisplay()
space & n::^t
space & o::End
space & p::Send ^{PgDn}
space & a::
While GetKeyState("a", "P") {
 Send {WheelDown}
 Sleep, 1
}
Return
space & q::
While GetKeyState("q", "P") {
 Send {WheelUp}
 Sleep, 1
}
Return
space & r::Down
space & s::send {Click 2}
space & t::Right
space & u::Send ^{PgUp}
space & w::Left
space & x::Del
space & z::^z
space & Tab::send ^{WheelDown}
space & `::send ^{WheelUp}
space & Esc::Send !{F4}
space & b::Browser_Back
space & F13::#Tab

 space::Send  {space}
+space::Send +{space}
!space::Send !{space}
#space::Send #{space}
^space::Send ^{space}

`; & d::
Send +v
Sleep 50
Send {Del}
return
`; & j::Send ^+,
`; & l::Send ^+.

 `;::Send  {;}
+`;::Send +{;}
!`;::Send !{;}
#`;::Send #{;}
