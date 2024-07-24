@echo off
SET ShortcutName=Active Directory Users and Computers.lnk
SET ProgramPath=%SystemRoot%\system32\dsa.msc

echo RSAT araclarini yukluyor...
PowerShell -Command "Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online"

echo RSAT araclari yukleniyor, bu biraz zaman alabilir. Lutfen sabirli olun...

echo Masaustune kisayol olusturuluyor...
PowerShell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut([System.Environment]::GetFolderPath('Desktop') + '\%ShortcutName%'); $Shortcut.TargetPath = '%ProgramPath%'; $Shortcut.Save()"

echo İslem tamamlandi.
pause
