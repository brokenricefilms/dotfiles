#keyhistory
#noenv
#singleinstance force
#installmousehook
#installkeybdhook
setbatchlines -1
listlines off
sendmode input
setworkingdir %a_scriptdir%
CoordMode, Mouse, Screen

;#Persistent
;#InstallKeybdHook
;KeyHistory

printscreen::f14
insert::f15
delete::f16
home::f17
end::f18
pgup::f19
pgdn::f20
left::f21
up::f22
down::f23
right::f24

^f14::
DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)
return
^f15::
Run, shutdown.exe /r /t 0 
Return
^f16::
Run, shutdown /s /t 0
Return

sc056::rcontrol

appskey::rcontrol

#wheeldown::volume_up
#wheelup::volume_down

numpadenter::f14

#include, %a_scriptdir%\lib\timelineclick.ahk
#include, %a_scriptdir%\lib\snippets.ahk

#ifwinactive, ahk_exe onecommander.exe
!s::send ^{tab}
!w::send ^+{tab}
#ifwinactive

#ifwinactive, ahk_exe resolve.exe
f13:: ;change hotkey to desired hotkey
   timelineclick(["\imagesearch\resolve\editpage.png", "\imagesearch\resolve\fairlight.png",  "\imagesearch\resolve\cutpage.png"], [75,63,45])
return
WheelUp::
Send , {Left}
Return
#ifwinactive

#ifwinactive ahk_exe zen.exe
f1::^+t
f2::^w
f3::
send ^c
sleep, 50
send ^t
sleep, 50
send ^v
send {enter}
return
f4::
send ^c
sleep, 50
send ^t
sleep, 50
send y{space}
send ^v
sleep, 50
send {enter}
return
^o::^+a
!w::send ^{pgup}
!s::send ^{pgdn}
f13::send ^t
f7::^+b
#ifwinactive

#ifwinactive ahk_exe windowsterminal.exe
f3::^+t
f2::^+w
!w::send ^{pgup}
!s::send ^{pgdn}

f13 & l::send !{right}
f13 & h::send !{left}
f13 & j::send !{down}
f13 & k::send !{up}

f13::^+t
#ifwinactive

#ifwinactive ahk_exe obsidian.exe
f1::+1
f13::p
#ifwinactive

movingwindowtootherdisplay() {
    send #+{left}
    sysget, monitors, monitorcount

        sysget, monitorcount, monitorcount
        sysget, monitorprimary, monitorprimary

        current := 0
        loop, %monitorcount%
        {
            sysget, monitor, monitor, %a_index%
                coordmode, mouse, screen
                mousegetpos, mousex, mousey
                if (  (mousex >= monitorleft) && (mousex < monitorright) && (mousey >= monitortop) && (mousey < monitorbottom) )
                {
current := a_index
             currentrx := (mousex - monitorleft) / (monitorright - monitorleft)
             currentry := (mousey - monitortop) / (monitorbottom - monitortop)
             break
                }
        }
next := current + 1

          if (next > monitorcount)
              next := 1
                  sysget, monitor, monitor, %next%

                  newx := monitorleft + currentrx*(monitorright - monitorleft)
                  newy := monitortop + currentry*(monitorbottom - monitortop)

                  dllcall("setcursorpos", "int", newx, "int", newy)
                  dllcall("setcursorpos", "int", newx, "int", newy)
}

JumpCursorBetweenMonitors() {
    MouseGetPos, MouseX, MouseY ; Get current mouse position
    SysGet, MonitorCount, MonitorCount ; Get number of monitors

    if (MonitorCount < 2) {
        MsgBox, You need at least two monitors for this script to work.
        return
    }

    ; Get dimensions of both monitors
    SysGet, M1, Monitor, 1
    SysGet, M2, Monitor, 2

    ; Determine which monitor the mouse is currently on
    if (MouseX >= M1Left && MouseX <= M1Right && MouseY >= M1Top && MouseY <= M1Bottom) {
        ; Move to monitor 2
        NewX := MouseX - M1Left + M2Left
        NewY := MouseY - M1Top + M2Top
        MouseMove, NewX, NewY
    } else {
        ; Move to monitor 1
        NewX := MouseX - M2Left + M1Left
        NewY := MouseY - M2Top + M1Top
        MouseMove, NewX, NewY
    }
}

togglemaxwindow()
{
    winget, winstate, minmax, a
        if (winstate = 1)
        {
            winrestore, a
        }
        else
        {
            winmaximize, a
        }
}

tab & e::run, "c:\users\master\editing\projects\"
tab & w::run, "c:\users\master\downloads\"
tab & r::run, "e:\render\"
tab & t::run, "C:\Users\master\Pictures"
tab & 2::run, "e:\obs\"
tab & 3::run, "E:\phone\Camera\Camera"

tab::tab

space & ,::pgup
space & -::volume_down
space & =::volume_up
space & [::send !{left}
space & ]::send !{right}
space & `::send ^{wheelup}
space & b::browser_back
space & c::#Tab
space & d::bs
space & e::down
space & esc::send !{f4}
space & h::left
space & i::home
space & j::down
space & k::up
space & l::right
space & m::pgdn
space & n::^t
space & o::end
space & p::send ^{pgdn}
space & q::left
space & r::right
space & tab::send ^{wheeldown}
space & u::send ^{pgup}
space & v::send #!+v
space & w::up
space & x::del
space & z::^z
space & a::#tab

space & f13::
movingwindowtootherdisplay()
JumpCursorBetweenMonitors()
return

space & 1::send ^#1
space & 2::send ^#2
space & 3::send ^#3
space & 4::send ^#4
space & 5::send ^#5

space & f1::send #^6
space & f2::send #^7
space & f3::send #^8
space & f4::send #^9
space & f5::send #^0
Space & f6::send #+s
space & f9::reload

space::send  {space}
+space::send +{space}
!space::send !{space}
#space::send #{space}
^space::send ^{space}

`; & d::
send +v
send {del}
return
`; & j::
send +v
send ^+,
return
`; & l::
send +v
send ^+.
return

`;::send  {;}
+`;::send +{;}
!`;::send !{;}
#`;::send #{;}
