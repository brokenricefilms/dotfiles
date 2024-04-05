;#InstallKeybdHook
;KeyHistory
#SingleInstance Force

#IfWinActive ahk_exe chrome.exe
F1::^w
F2::^+t
F3::^PgUp
F4::^PgDn
#IfWinActive

#IfWinActive ahk_exe brave.exe
F1::^w
F2::^+t
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

SC056::RControl ; MSI |\ key
;SC152::MButton ; MSI Insert
;SC151::movingWindowToOtherDisplay() ;PgDn SC149 PgUp
AppsKey::RControl

Esc::!Tab

CapsLock & ,::
CapsLock & -::
CapsLock & .::
CapsLock & /::
CapsLock & 0::
CapsLock & 1::
CapsLock & 2::
CapsLock & 3::
CapsLock & 4::
CapsLock & 5::
CapsLock & 6::
CapsLock & 7::
CapsLock & 8::
CapsLock & 9::
CapsLock & =::
CapsLock & F10::
CapsLock & F11::
CapsLock & F12::
CapsLock & F1::
CapsLock & F2::
CapsLock & F3::
CapsLock & F4::
CapsLock & F5::
CapsLock & F6::
CapsLock & F7::
CapsLock & F8::
CapsLock & F9::
CapsLock & [::
CapsLock & \::
CapsLock & ]::
CapsLock & `::
CapsLock & `;::
CapsLock & a::
CapsLock & b::
CapsLock & c::
CapsLock & d::WheelDown
CapsLock & e::WheelUp
CapsLock & f::Right
CapsLock & g::Home
CapsLock & h::
CapsLock & i::
CapsLock & j::
CapsLock & k::
CapsLock & l::
CapsLock & m::
CapsLock & n::
CapsLock & o::
CapsLock & p::
CapsLock & q::
CapsLock & r::!Left
CapsLock & s::Left
CapsLock & t::!Right
CapsLock & u::
CapsLock & v::
CapsLock & w::^w
CapsLock & x::
CapsLock & y::
CapsLock & z::
CapsLock & Tab::
CapsLock & Space::

 CapsLock::Esc
+CapsLock::Send +{Esc}
!CapsLock::Send !{Esc}
#CapsLock::Send #{Esc}
^CapsLock::Send ^{Esc}

SetCapsLockState, alwaysoff

Space & '::
Space & ,::Send {PgUp}
Space & -::Send {Volume_Down}
Space & .::
Space & /::
Space & 0::
Space & 1::Send ^#6
Space & 2::Send ^#7
Space & 3::Send ^#8
Space & 4::Send ^#9
Space & 5::Send ^#0
Space & 6::
Space & 7::
Space & 8::
Space & 9::
Space & =::Send {Volume_Up}
Space & F10::
Space & F11::toggleMaxWindow()
Space & F12::
Space & F1::
Space & F2::
Space & F3::
Space & F4::
Space & F5::Reload
Space & F6::
Space & F7::
Space & F8::
Space & F9::
Space & WheelDown::Volume_Up
Space & WheelUp::Volume_Down
Space & [::Send !{Left}
Space & \::
Space & ]::Send !{Right}
Space & `::
Space & `;::Send ^{BS}
Space & a::Send ^a
Space & b::
Space & c::Send ^c
Space & d::BS
Space & e::Send ^#3
Space & f::MButton
Space & g::RButton
Space & h::Send {Blind}{Left}
Space & i::Send {Blind}{Home}
Space & j::Send {Blind}{Down}
Space & k::Send {Blind}{Up}
Space & l::Send {Blind}{Right}
Space & m::Send {PgDn}
Space & n::movingWindowToOtherDisplay()
Space & o::Send {Blind}{End}
Space & p::Send ^{PgDn}
Space & q::Send ^#1
Space & r::Send ^#4
Space & s::Send, {Click 2}
Space & t::Send ^#5
Space & u::Send ^{PgUp}
Space & v::Send ^v
Space & w::Send ^#2
Space & x::Send {Del}
Space & y::Send !{F4}
Space & z::

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
