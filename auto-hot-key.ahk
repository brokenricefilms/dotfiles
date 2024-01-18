;#InstallKeybdHook
;KeyHistory

#HotkeyModifierTimeout 100 ; prevents sticking of layer key

CapsLock::Esc
SC056::RControl ; MSI |\ key
SC152::Send #^c ; MSI Insert

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
Space & .::Send #v
Space & F5::Reload
Space & u::Send ^{PgUp}
Space & p::Send ^{PgDn}
Space & ,::Send {PgUp}
Space & m::Send {PgDn}
Space & n::Send #+{Left}
Space & F11::toggleMaxWindow()
Space & a::Send ^#1
Space & s::Send ^#2
Space & d::Send ^#3
Space & f::Send ^#4
Space & g::Send ^#5
Space & q::Send ^#6
Space & w::Send ^#7
Space & e::Send ^#8
Space & r::Send ^#9
Space & t::Send ^#0
Space & `;::Send ^{BS}
Space & x::Send !{F4}
Space & -::Send {Volume_Down}
space & =::Send {Volume_Up}

 Space::Send  {Space}
+Space::Send +{Space}
!Space::Send !{Space}
#Space::Send #{Space}
^Space::Send ^{Space}

`; & t::Send ^+t
`; & d::Send {Del}
`; & s::
MouseMove 752, 758, 0 
Click
Return

 `;::Send  {;}
+`;::Send +{;}
!`;::Send !{;}
#`;::Send #{;}
^`;::Send ^{;}
