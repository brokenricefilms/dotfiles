#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

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

!z::toggleMaxWindow()
!q::Send !{F4}
