
$startupFolder = "C:\Users\"+ $env:USERNAME +"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
echo $startupFolder;

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$startupFolder\autohotkey.lnk")
$Shortcut.TargetPath = "$pwd\karl-henrik.ahk"
$Shortcut.WorkingDirectory = $pwd.Path
$Shortcut.Save()