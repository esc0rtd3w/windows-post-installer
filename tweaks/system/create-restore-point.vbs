If WScript.Arguments.Count = 0 Then

Set objShell = CreateObject("Shell.Application")

objShell.ShellExecute "wscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " Run", , "runas", 1

Else

GetObject("winmgmts:\\.\root\default:Systemrestore").CreateRestorePoint "ManualRestorePoint", 0, 100

End If