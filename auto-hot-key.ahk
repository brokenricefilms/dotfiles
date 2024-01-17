Space & k::Send {Blind}{Up}
Space & h::Send {Blind}{Left}
Space & j::Send {Blind}{Down}
Space & l::Send {Blind}{Right}
Space & i::Send {Blind}{Home}
Space & o::Send {Blind}{End}
Space & a::Send ^a
Space & q::Send !{F4}
Space & t::Send ^t
Space & w::Send ^w
Space & c::Send ^c
Space & v::Send ^v
Space & .::Send #v
Space & r::Send ^+t
Space & e::Send ^+a
Space & `;::Send ^{BS} ;BS: Backspace
Space & F5::Reload
Space & u::Send ^{PgUp}
Space & p::Send ^{PgDn}
Space & ,::Send {PgUp}
Space & m::Send {PgDn}
Space & 0::Send ^#0
Space & 1::Send ^#1
Space & 2::Send ^#2
Space & 3::Send ^#3
Space & 4::Send ^#4
Space & 5::Send ^#5
Space & 6::Send ^#6
Space & 7::Send ^#7
Space & 8::Send ^#8
Space & 9::Send ^#9
Space::Send {Space}

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
