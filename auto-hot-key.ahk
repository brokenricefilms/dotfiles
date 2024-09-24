#keyhistory
#noenv
#singleinstance force
#installmousehook
#installkeybdhook
setbatchlines -1
listlines off
sendmode input
setworkingdir %a_scriptdir%

#Persistent
#InstallKeybdHook
KeyHistory

sc056::rcontrol
appskey::rcontrol
!^f1::send #^0
#wheeldown::volume_up
#wheelup::volume_down

#include, %a_scriptdir%\lib\timelineclick.ahk
#include, %a_scriptdir%\lib\snippets.ahk

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
f5::
send ^c
sleep, 50
send ^t
sleep, 50
send i{space}
send ^v
sleep, 50
send {enter}
return
^o::^+a
f6::
send {rbutton}
sleep 50
send l
sleep 50
send #4
sleep 50
send ^+t
sleep 50
send yyq
sleep 50
send {enter}
sleep 50
send #^1
return
!w::send ^{pgup}
!s::send ^{pgdn}
f13::send ^t
#ifwinactive

#ifwinactive ahk_exe windowsterminal.exe
f3::^+t
f2::^+w

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
tab & t::run, "e:\youtube\"
tab & 2::run, "e:\obs\"

tab::tab

space & ,::pgup
space & -::volume_down
space & 1::send ^#1
space & 2::send ^#2
space & 3::send ^#3
space & 4::send ^#4
space & 5::send ^#5
space & =::volume_up
space & f11::togglemaxwindow()
space & f1::send #^6
space & f2::send #^7
space & v::send #!+v
space & f3::send #^8
space & f4::send #^9
space & f5::send #^0
space & f9::reload
space & [::send !{left}
space & ]::send !{right}
space & c::^c
space & d::bs
space & e::up
space & f::mbutton
space & g::rbutton
space & h::left
space & i::home
space & j::down
space & k::up
space & l::right
space & m::pgdn
;space & n::movingwindowtootherdisplay()
space & n::^t
space & o::end
space & p::send ^{pgdn}
space & a::
while getkeystate("a", "p") {
    send {wheeldown}
    sleep, 1
}
return
space & q::
while getkeystate("q", "p") {
    send {wheelup}
    sleep, 1
}
return
space & r::down
space & s::send {click 2}
space & t::right
space & u::send ^{pgup}
space & w::left
space & x::del
space & z::^z
space & tab::send ^{wheeldown}
space & `::send ^{wheelup}
space & esc::send !{f4}
space & b::browser_back
space & f13::#tab

space::send  {space}
+space::send +{space}
!space::send !{space}
#space::send #{space}
^space::send ^{space}

`; & d::
send +v
sleep 50
send {del}
return
`; & j::send ^+,
`; & l::send ^+.

`;::send  {;}
+`;::send +{;}
!`;::send !{;}
#`;::send #{;}
