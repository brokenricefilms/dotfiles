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
Home::!^F11
End::!^m
AppsKey::RControl
CapsLock::RControl
Insert::CapsLock

#Include, %A_ScriptDir%\lib\TimelineClick.ahk

#IfWinActive, ahk_exe Resolve.exe
{
    Capslock::
    TimelineClick(["\ImageSearch\Resolve\EditPage.png", "\ImageSearch\Resolve\Fairlight.png",  "\ImageSearch\Resolve\CutPage.png"], [80,63,45])
    return
}

;#IfWinActive ahk_exe Resolve.exe
;#If GetKeyState("Ctrl") == 0 && GetKeyState("Alt") == 0 && GetKeyState("LButton") == 1
;LShift::
;Send {n}
;keywait, LShift
;return
;#IfWinActive

#IfWinActive ahk_exe chrome.exe
F2::^w
F1::^+t
F3::^PgUp
F4::^PgDn
#IfWinActive

#IfWinActive ahk_exe firefox.exe
F2::^w
F1::^+t
F3::^PgUp
F4::^PgDn
#IfWinActive

#IfWinActive ahk_exe floorp.exe
F2::^w
F1::^+t
F3::^PgUp
F4::^PgDn
#IfWinActive

#IfWinActive ahk_exe brave.exe
F2::^w
F1::^+t
F3::^PgUp
F4::^PgDn
#IfWinActive

#IfWinActive ahk_exe Obsidian.exe
F1::+1
F2::+2
F3::7
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

Tab & e::MButton
Tab & w::
While GetKeyState("w", "P") {
 Send {WheelDown}
 Sleep, 20
}
Return
Tab & r::
While GetKeyState("r", "P") {
 Send {WheelUp}
 Sleep, 20
}
Return

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
Space & F3::Send #^8
Space & F4::Send #^9
Space & F5::Send #^0
Space & F9::Reload
Space & WheelDown::Volume_Up
Space & WheelUp::Volume_Down
Space & w::Left
Space & [::Send !{Left}
Space & ]::Send !{Right}
Space & `::Run, "C:\Users\master\editing\Projects"
Space & `;::^BS
Space & c::^c
Space & d::BS
Space & e::Up
Space & f::MButton
Space & g::
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
Space & r::Down
Space & t::Right
Space & u::Send ^{PgUp}
Space & v::^v
Space & x::Del
Space & y::Send !{F4}
Space & z::^z
Space & Tab::Run, "C:\Users\master\Downloads"

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
