The NSIS script: [installer.nsi](installer.nsi)

Compile the script: 

```
makensis installer.nsi
```

This command will create the file `installer.exe`.

Test the installer: just double-click on the executable `installer.exe`.

As expected, the directory `C:\Program Files\nsis-test1` contains 3 files:
* `nsis_app.exe`
* `nsis_app.ico`
* `uinstaller.exe`
