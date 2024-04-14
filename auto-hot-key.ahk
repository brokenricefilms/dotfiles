;KeyHistory
#NoEnv
#SingleInstance Force
#InstallMouseHook
#InstallKeybdHook

SC056::RControl ; MSI |\ key
;SC151::movingWindowToOtherDisplay() ;PgDn SC149 PgUp
SC147::#^v
AppsKey::RControl
SetCapsLockState, off
;LControl::#Space

#IfWinActive ahk_exe Resolve.exe
#If GetKeyState("Ctrl") == 0 && GetKeyState("Alt") == 0 && GetKeyState("LButton") == 1
LShift::
Send {n}
keywait, LShift
return
#IfWinActive

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

#IfWinActive ahk_exe brave.exe
F2::^w
F1::^+t
F3::^PgUp
F4::^PgDn
#IfWinActive

#IfWinActive ahk_exe WindowsTerminal.exe
F11::!+-
F12::!+=
F1::^+w
F2::^+t
F3::^PgDn
F4::^PgUp
F7::!Left
F8::!Down
F9::!Up
F10::!Right
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

Tab & ,::Tab
Tab & -::Tab
Tab & .::Tab
Tab & /::Tab
Tab & 0::Tab
Tab & 1::Tab
Tab & 2::Tab
Tab & 3::Tab
Tab & 4::Tab
Tab & 5::Tab
Tab & 6::Tab
Tab & 7::Tab
Tab & 8::Tab
Tab & 9::Tab
Tab & =::Tab
Tab & F10::Tab
Tab & F11::Tab
Tab & F12::Tab
Tab & F1::Tab
Tab & F2::Tab
Tab & F3::Tab
Tab & F4::Tab
Tab & F5::Tab
Tab & F6::Tab
Tab & F7::Tab
Tab & F8::Tab
Tab & F9::Tab
Tab & [::Tab
Tab & \::Tab
Tab & ]::Tab
Tab & `::Tab
Tab & `;::Tab
Tab & a::Tab
Tab & b::Tab
Tab & c::Tab
Tab & d::Tab
Tab & e::Tab
Tab & f::Tab
Tab & g::Tab
Tab & h::Tab
Tab & i::Tab
Tab & j::Tab
Tab & k::Tab
Tab & l::Tab
Tab & m::Tab
Tab & n::Tab
Tab & o::Tab
Tab & p::Tab
Tab & q::Tab
Tab & r::Tab
Tab & s::Tab
Tab & t::Tab
Tab & u::Tab
Tab & v::Tab
Tab & w::Tab
Tab & x::Tab
Tab & y::Tab
Tab & z::Tab

Tab::Tab

Space & '::
Space & ,::Send {PgUp}
Space & -::
While GetKeyState("-", "P") {
 Send {Volume_Down}
 Sleep, 30
}
Return
Space & .::
Space & /::
Space & 0::
Space & 1::Send ^#1
Space & 2::Send ^#2
Space & 3::Send ^#3
Space & 4::Send ^#4
Space & 5::Send ^#5
Space & 6::
Space & 7::
Space & 8::
Space & 9::
Space & =::
While GetKeyState("=", "P") {
 Send {Volume_Up}
 Sleep, 30
}
Return
Space & F10::
Space & F11::toggleMaxWindow()
Space & F12::
Space & F1::Send #^6
Space & F2::Send #^7
Space & F3::Send #^8
Space & F4::Send #^9
Space & F5::Send #^0
Space & F6::
Space & F7::
Space & F8::
Space & F9::Reload
Space & WheelDown::Volume_Up
Space & WheelUp::Volume_Down
Space & [::Send !{Left}
Space & \::
Space & ]::Send !{Right}
Space & `::Home
Space & a::
While GetKeyState("a", "P") {
 Send {WheelDown}
 Sleep, 5 
}
Return
Space & b::
Space & c::
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
Space & q::
While GetKeyState("q", "P") {
 Send {WheelUp}
 Sleep, 5
}
Return
Space & r::Down
Space & s::Send, {Click 2}
Space & t::Right
Space & u::Send ^{PgUp}
Space & v::#v
Space & w::Left
Space & x::
Space & y::Send !{F4}
Space & z::^z
Space & Tab::!Tab

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
