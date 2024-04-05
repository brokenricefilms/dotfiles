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

CapsLock & 1::Space
CapsLock & 2::Space
CapsLock & 3::Space
CapsLock & 4::Space
CapsLock & 5::Space
CapsLock & a::Space
CapsLock & b::Space
CapsLock & c::Space
CapsLock & d::WheelDown
CapsLock & e::WheelUp
CapsLock & f::Space
CapsLock & g::Space
CapsLock & h::Space
CapsLock & i::Space
CapsLock & j::Space
CapsLock & k::Space
CapsLock & l::Space
CapsLock & m::Space
CapsLock & n::Space
CapsLock & o::Space
CapsLock & p::Space
CapsLock & q::Space
CapsLock & r::!Left
CapsLock & s::Space
CapsLock & t::!Right
CapsLock & u::Space
CapsLock & v::Space
CapsLock & w::^w
CapsLock & x::Space
CapsLock & y::Space
CapsLock & z::Space

 CapsLock::Send  {Esc}
+CapsLock::Send +{Esc}
!CapsLock::Send !{Esc}
#CapsLock::Send #{Esc}
^CapsLock::Send ^{Esc}

Space & ,::Send {PgUp}
Space & -::Send {Volume_Down}
Space & 1::Send ^#6
Space & 2::Send ^#7
Space & 3::Send ^#8
Space & 4::Send ^#9
Space & 5::Send ^#0
Space & =::Send {Volume_Up}
Space & F11::toggleMaxWindow()
Space & F5::Reload
Space & WheelDown::Volume_Up
Space & WheelUp::Volume_Down
Space & [::Send !{Left}
Space & ]::Send !{Right}
Space & `;::Send ^{BS}
Space & a::Send ^a
Space & b::Send ^w
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
Space & z::Send ^+t

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
