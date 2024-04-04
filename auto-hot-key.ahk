;#InstallKeybdHook
;KeyHistory
#SingleInstance Force

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

SetCapsLockState, off

CapsLock & d::WheelDown
CapsLock & e::WheelUp
CapsLock & w::^w
CapsLock & r::!Left
CapsLock & t::!Right

 CapsLock::Send  {Esc}
+CapsLock::Send +{Esc}
!CapsLock::Send !{Esc}
#CapsLock::Send #{Esc}
^CapsLock::Send ^{Esc}

Space & s::Send, {Click 2}
Space & g::RButton
Space & f::MButton
Space & d::BS
Space & k::Send {Blind}{Up}
Space & h::Send {Blind}{Left}
Space & j::Send {Blind}{Down}
Space & l::Send {Blind}{Right}
Space & i::Send {Blind}{Home}
Space & o::Send {Blind}{End}
Space & F5::Reload
Space & u::Send ^{PgUp}
Space & p::Send ^{PgDn}
Space & z::Send ^+t
Space & ,::Send {PgUp}
Space & m::Send {PgDn}
Space & n::movingWindowToOtherDisplay()
Space & F11::toggleMaxWindow()
Space & q::Send ^#1
Space & w::Send ^#2
Space & e::Send ^#3
Space & r::Send ^#4
Space & t::Send ^#5
Space & 1::Send ^#6
Space & 2::Send ^#7
Space & 3::Send ^#8
Space & 4::Send ^#9
Space & 5::Send ^#0
Space & a::Send ^a
Space & x::Send {Del}
Space & y::Send !{F4}
Space & c::Send ^c
Space & v::Send ^v
Space & -::Send {Volume_Down}
Space & =::Send {Volume_Up}
Space & [::Send !{Left}
Space & ]::Send !{Right}
Space & WheelDown::Volume_Up
Space & WheelUp::Volume_Down
Space & b::Send ^w
Space & `;::Send ^{BS}

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
