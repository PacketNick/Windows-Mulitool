@echo off 
Title PacketNicks restore point
color F
:Create Restore Point 
C:\Windows\System32\cmd.exe /k "wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Prior to Nick auto tweaker", 100, 7"
exit