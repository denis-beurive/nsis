# Registry

## Backup

* Open the Registry Editor (`regedit`)
* Select the appropriate registry key, or My Computer (to export the entire registry)
* Select File, Export from the menu bar or right-click on the appropriate registry key and select Export
* Browse to the directory to save the file to and enter a File name
* Click OK to create the export file

Let's say that the backup file is "`all_registry.reg`".

## Searching

Find all lines of the file that contains a given string:

```powsershell
Select-String .\all_registry.reg -Pattern "Sublime Text" | Select-Object LineNumber,Line
```

```powsershell
Select-String .\all_registry.reg -Pattern "WinRAR" | Select-Object LineNumber,Line
```

* `HKEY_CURRENT_USER\Software\`: declare the software for all users on the machine.
* `HKEY_LOCAL_MACHINE\Software\`: declare the software for the current user on the machine.

```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\Software\MonLogiciel]
"Nom"="MonLogiciel"
"Chemin"="C:\\Chemin\\Vers\\MonLogiciel"
"Version"="1.0.0"
```

```
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\*\shell\NomDeMonLogiciel]
@="Ouvrir avec MonLogiciel"
"Icon"="C:\\Chemin\\Vers\\MonIcone.ico"

[HKEY_CLASSES_ROOT\*\shell\NomDeMonLogiciel\command]
@="\"C:\\Chemin\\Vers\\MonLogiciel.exe\" \"%1\""
```

