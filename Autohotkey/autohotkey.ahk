#Include desktop.ahk
#Include WindowHandler.ahk

windowHandler := new WindowHandler

SetCapsLockState, AlwaysOff
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

Suspend On

w::Up
a::Left
s::Down
d::Right
q::Home
e::End
l::right
j::left
i::up
k::down
ö::windowHandler.FocusOnWindow("ahk_exe WindowsTerminal.exe","wt.exe")
o::windowHandler.CycleWindows("ahk_exe OUTLOOK.EXE","OUTLOOK")
c::windowHandler.FocusOnWindow("ahk_exe Code.exe", "Code.exe")
b::windowHandler.CycleWindows("ahk_exe msedge.exe","MSED")
t::windowHandler.CycleWindows("ahk_exe Teams.exe","TEAMS")
å::{
SC01B::}
^å::[
^SC01B::]
,::<
.::>
'::|
2::switchDesktopByNumber(2)
1::switchDesktopByNumber(1)
3::switchDesktopByNumber(3)
4::switchDesktopByNumber(4)

; Uncomment to activate ctrl + capslock + c and ctrl + capslock + d to create and delete virtual desktops, I find I don't use this feature. 
; ^c::createVirtualDesktop() 
; ^d::deleteVirtualDesktop()

; Toggle allways on top. 
SPACE::  Winset, Alwaysontop, , A

; Toggle window header off (I use this to get rid of the window header in OBS Windowed Projector mode)
LWIN & Z::
WinSet, Style, -0xCC0000, A
return
;

; Toggle window header on
LWIN & X::
WinSet, Style, +0xC00000, A
return
;

n::windowHandler.CloseWindow("Microsoft Teams Notification")

*CapsLock::Suspend Off
*CapsLock Up::Suspend On

