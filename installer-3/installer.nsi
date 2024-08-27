# Create the installer: makensis installer.nsi

# Set the name of the installer
OutFile "installer.exe"

# Set the path to the installation directory
# See: the predefined constants
#      https://nsis.sourceforge.io/Docs/Chapter4.html#varconstant
# See: the installers' attribute "InstallDir"
#      https://nsis.sourceforge.io/Docs/Chapter4.html#instattribs
#      The variable that stores the value of this attribute is "$INSTDIR"
InstallDir "$PROGRAMFILES64\nsis-test1\"

# ----------------------------------------------------------------
# Default section
# ----------------------------------------------------------------

Section

	# Copy files into the installation directory.
	#
	# Please note: (1) all instructions for copying file into the installation directory must
	#                  appear *AFTER* the call to the instruction "SetOutPath".
	#              (2) the file "uninstaller.exe" is created by the compiler from the next section.

	SetOutPath $INSTDIR
	File nsis_app.exe
	File nsis_app.ico
	WriteUninstaller $INSTDIR\uninstaller.exe

	# Add entries in the registry
	# See: https://www.malekal.com/hkey-current-user-hkcu/
  	WriteRegStr HKCU "Software\nsis_app" "Name" "nsis_app"
  	WriteRegStr HKCU "Software\nsis_app" "Path" "$INSTDIR\nsis_app.exe" 
  	WriteRegStr HKCU "Software\nsis_app" "Version" "1.0.0"

	InstallDirRegKey HKCU Software\NSIS ""

  	WriteRegStr HKCR "*\shell\nsis_app" "" "Open with nsis_app"
  	WriteRegStr HKCR "*\shell\nsis_app" "Icon" "$INSTDIR\nsis_app.ico"
  	WriteRegStr HKCR "*\shell\nsis_app\SubCommands" "" "aaAction1;aaAction2"

	# Action 1
  	WriteRegStr HKCR "Software\Classes\nsis_app.aaAction1" "" "Action 1"
  	WriteRegStr HKCR "Software\Classes\nsis_app.aaAction1\command" "" '"$INSTDIR\nsis_app.exe" "%1"'

  	# Action 2
  	WriteRegStr HKCR "Software\Classes\nsis_app.aaAction2" "" "Action 2"
  	WriteRegStr HKCR "Software\Classes\nsis_app.aaAction2\command" "" '"$INSTDIR\nsis_app.exe" "%1"'

	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "DisplayName" "nsis_app"
  	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "UninstallString" "$INSTDIR\uninstaller.exe"
  	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "InstallLocation" "$INSTDIR"
  	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "DisplayIcon" "$INSTDIR\nsis_app.exe"
  	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "Publisher" "Moi"
  	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "DisplayVersion" "1.0.0"
  	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "NoModify" 1
  	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "NoRepair" 1
  	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "EstimatedSize" 20480

	# $SMPROGRAMS = %AppData%\Microsoft\Windows\Start Menu\Programs
	# Create folder: C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\nsis_app
	# Create shortcut: C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\nsis_app\nsis_app.lnk
	# Create shortcut: C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\nsis_app\Uninstall nsis_app.lnk

 	CreateDirectory "$SMPROGRAMS\nsis_app"
 	CreateShortCut "$SMPROGRAMS\nsis_app\nsis_app.lnk" "$INSTDIR\nsis_app.exe"
 	CreateShortCut "$SMPROGRAMS\nsis_app\Uninstall nsis_app.lnk" "$INSTDIR\uninstaller.exe"

	MessageBox MB_OK "The application has been successfully installed!"

SectionEnd

# ----------------------------------------------------------------
# Uninstaller section (the name is always "Uninstall")
# ----------------------------------------------------------------

Section "Uninstall"
	
	DeleteRegKey HKCU "Software\nsis_app"
	DeleteRegKey HKCR "*\shell\nsis_app"
	DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app"
	DeleteRegKey HKCR "Software\Classes\nsis_app.Action1"
	DeleteRegKey HKCR "Software\Classes\nsis_app.Action2"

	Delete "$SMPROGRAMS\nsis_app\nsis_app.lnk"
  	Delete "$SMPROGRAMS\nsis_app\Uninstall nsis_app.lnk"
	Delete "$INSTDIR\nsis_app.exe"
	Delete "$INSTDIR\nsis_app.ico"

  	Delete "$INSTDIR\uninstaller.exe"

	RMDir $INSTDIR
	RMDir "$SMPROGRAMS\nsis_app"

SectionEnd
