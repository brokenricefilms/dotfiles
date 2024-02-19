;#InstallKeybdHook
;KeyHistory

SC056::RControl ; MSI |\ key
SC152::#^c ; MSI Insert
Esc::!Tab
CapsLock::Esc

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

Space & k::Send {Blind}{Up}
Space & h::Send {Blind}{Left}
Space & j::Send {Blind}{Down}
Space & l::Send {Blind}{Right}
Space & i::Send {Blind}{Home}
Space & o::Send {Blind}{End}
Space & v::Send #v
Space & F5::Reload
Space & u::Send ^{PgUp}
Space & p::Send ^{PgDn}
Space & ,::Send {PgUp}
Space & m::Send {PgDn}
Space & n::Send #+{Left}
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
Space & `;::Send ^{BS}
Space & d::Send {BS}
Space & g::Send {Del}
Space & x::Send !{F4}
Space & c::Send ^c
Space & -::Send {Volume_Down}
Space & =::Send {Volume_Up}
Space & [::Send !{Left}
Space & ]::Send !{Left}
Space & WheelDown::Volume_Up
Space & WheelUp::Volume_Down

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
