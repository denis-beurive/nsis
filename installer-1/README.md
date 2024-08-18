The NSIS script: [installer.nsi](installer.nsi)

Compile the script: 

```
makensis installer.nsi
```

This command will create the file `installer.exe`.

Test the installer: just double-click on the executable `installer.exe`.

As expected, the directory `C:\Program Files\nsis-test1` contains 2 files:
* `nsis_app.exe`
* `uinstaller.exe`
