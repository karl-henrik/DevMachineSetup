#Requires AutoHotkey v2.0

SetCapsLockState "AlwaysOff"


CapsLock & w::Up
CapsLock & a::Left
CapsLock & s::Down
CapsLock & d::Right

CapsLock & i::Up
CapsLock & j::Left
CapsLock & k::Down
CapsLock & l::Right

CapsLock & BackSpace::Delete

CapsLock & 0:: Send("{U+00B0}")
CapsLock & å:: EnglishKeyBoardFix("{{}","[")
CapsLock & ¨:: EnglishKeyBoardFix("{}}","]")
CapsLock & [:: Send("{{}")
CapsLock & ]:: Send("{}}")
CapsLock & Down:: AppsKey 
CapsLock & z::Send("<")
CapsLock & x::Send(">")

Escape::
{
    if(A_PriorHotkey != "Escape" or A_TimeSincePriorHotkey > 400)
    {
        KeyWait "Escape"
        Hotkey("Escape", "Off") ; Temporarily disable the Escape hotkey
        Send("{Escape}")
        Hotkey("Escape", "On")  ; Re-enable the Escape hotkey
        return
    }
    WinClose("A")
}

GroupAdd "VSCodeGroup", "ahk_exe Code.exe"
CapsLock & c:: SwitchToOrStart("ahk_exe Code.exe","C:\Users\KarlHenrikNilsson\AppData\Local\Programs\Microsoft VS Code\Code.exe", "VSCodeGroup")

GroupAdd "MSTeamsGroup", "ahk_exe ms-teams.exe"
CapsLock & t:: GroupActivate "MSTeamsGroup"

GroupAdd "MSOutlookGroup", "ahk_exe olk.exe"
CapsLock & o:: SwitchToOrStart("ahk_exe olk.exe","C:\Users\KarlHenrikNilsson\AppData\Local\Microsoft\WindowsApps\Microsoft.OutlookForWindows_8wekyb3d8bbwe\olk.exe","MSOutlookGroup")

GroupAdd "WindosTerminalGroup", "ahk_exe WindowsTerminal.exe"
CapsLock & ö::
CapsLock & SC027:: SwitchToOrStart("ahk_exe WindowsTerminal.exe","C:\Users\KarlHenrikNilsson\AppData\Local\Microsoft\WindowsApps\wt.exe","WindosTerminalGroup")

GroupAdd "MsEdgeGroup", "ahk_exe msedge.exe"
CapsLock & b:: SwitchToOrStart("ahk_exe msedge.exe","C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe --profile-directory=Default","MsEdgeGroup")


EnglishKeyBoardFix(strFirstMappedCharacter, strSecondMappedCharacter)
{
    if (GetKeyState("Shift","P"))
        Send(strSecondMappedCharacter)
    else        
        Send(strFirstMappedCharacter)
}

SwitchToOrStart(strSearch, strRunCommand, strGroupName)
{
    terminalWindow := WinExist(strSearch)
    if (terminalWindow == 0)
    {
        Run strRunCommand
    }
    else
    {        
        GroupActivate strGroupName
    }
}