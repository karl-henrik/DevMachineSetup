#Requires AutoHotkey v2.0

SetCapsLockState "AlwaysOff"

CapsLock & i::Up
CapsLock & j::Left
CapsLock & k::Down
CapsLock & l::Right

CapsLock & BackSpace::Delete

CapsLock & 0:: Send("{U+00B0}")
CapsLock & SC01A:: EnglishKeyBoardFix("{{}","[")
CapsLock & SC01B:: EnglishKeyBoardFix("{}}","]")
CapsLock & [:: Send("{{}")
CapsLock & ]:: Send("{}}")
CapsLock & Down:: AppsKey 
CapsLock & z::Send("<")
CapsLock & x::Send(">")
CapsLock & F12::CloseOfficeApps()
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
CapsLock & c:: SwitchToOrStart("ahk_exe Code.exe","C:\Users\%username%\AppData\Local\Programs\Microsoft VS Code\Code.exe", "VSCodeGroup")

GroupAdd "MSTeamsGroup", "ahk_exe ms-teams.exe"
CapsLock & t:: GroupActivate "MSTeamsGroup"

GroupAdd "MSOutlookGroup", "ahk_exe olk.exe"
CapsLock & o:: SwitchToOrStart("ahk_exe olk.exe","C:\Users\%username%\AppData\Local\Microsoft\WindowsApps\Microsoft.OutlookForWindows_8wekyb3d8bbwe\olk.exe","MSOutlookGroup")

GroupAdd "WindowsTerminalGroup", "ahk_exe WindowsTerminal.exe"

CapsLock & SC027:: SwitchToOrStart("ahk_exe WindowsTerminal.exe","C:\Users\%username%\AppData\Local\Microsoft\WindowsApps\wt.exe","WindowsTerminalGroup")

GroupAdd "MsEdgeGroup", "ahk_exe msedge.exe"
CapsLock & b:: SwitchToOrStart("ahk_exe msedge.exe","C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe --profile-directory=Default","MsEdgeGroup")

GroupAdd "VisualStudioGroup", "ahk_exe devenv.exe"
CapsLock & v:: SwitchToOrStart("ahk_exe devenv.exe","C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\IDE\devenv.exe", "VisualStudioGroup")

EnglishKeyBoardFix(strFirstMappedCharacter, strSecondMappedCharacter)
{
    if (GetKeyState("Shift","P"))
        Send(strSecondMappedCharacter)
    else        
        Send(strFirstMappedCharacter)
}

SwitchToOrStart(process, exePath, groupName) {
    static lastActivated := Map()

    exePath := StrReplace(exePath, "%username%", EnvGet("USERNAME"))
    hwndList := []

    try {
        hwndListAll := WinGetList("ahk_group " groupName)
            for hwnd in hwndListAll {
            if !WinExist("ahk_id " hwnd)
                continue
            if WinGetTitle("ahk_id " hwnd) = ""
                continue
            if WinGetMinMax("ahk_id " hwnd) == -1  ; Minimized
                WinRestore("ahk_id " hwnd)
            hwndList.Push(hwnd)
        }
    } catch {
        hwndList := []
    }

    if hwndList.Length > 0 {
        currentIndex := 1

        if lastActivated.Has(groupName) {
            lastHwnd := lastActivated[groupName]
            for i, hwnd in hwndList {
                if hwnd == lastHwnd {
                    currentIndex := i + 1
                    break
                }
            }
            if currentIndex > hwndList.Length
                currentIndex := 1
        }

        targetHwnd := hwndList[currentIndex]
        if WinExist("ahk_id " targetHwnd) {
            WinActivate("ahk_id " targetHwnd)
            lastActivated[groupName] := targetHwnd
            return
        }
    }

    try {
        Run exePath
    } catch Error as e {
        MsgBox "Failed to run: " exePath "`nError: " e.Message
    }
}

CloseOfficeApps() {
    apps := ["POWERPNT", "WINWORD", "EXCEL"]
    for app in apps {
        RunWait(A_ComSpec ' /c taskkill /IM ' app '.EXE /F',, "Hide")
    }
}