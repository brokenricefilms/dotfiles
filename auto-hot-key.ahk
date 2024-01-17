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
Space::Send {Space}

a & s::Send {Blind}{Left}
a & d::Send {Blind}{Down}
a & f::Send {Blind}{Right}
a & e::Send {Blind}{Up}
a & w::Send {Blind}{Home}
a & r::Send {Blind}{End}
a & `;::Send ^{BS} ;BS: Backspace
a & Space::Send !{F4}
a::Send {a}
+a::Send {A}

j & t::Send ^t
j & w::Send ^w
j & c::Send ^c
j & v::Send ^v
j & x::Send ^x
j & a::Send ^a
j::Send {j}
+j::Send {J}

