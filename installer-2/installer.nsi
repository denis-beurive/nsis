# This example shows how to integrate the uninstaller into the Add/Remove software UI
#
# Create the installer: makensis installer.nsi

# Set the name of the installer
OutFile "installer.exe"

# Set the path to the installation directory
# See: the predefined constants
#      https://nsis.sourceforge.io/Docs/Chapter4.html#varconstant
# See: the installers' attribute "InstallDir"
#      https://nsis.sourceforge.io/Docs/Chapter4.html#instattribs
#      The variable that stores the value of this attribute is "$INSTDIR"
InstallDir "$PROGRAMFILES64\nsis-test2\"

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

	# Context menu when you right click on a file
  	WriteRegStr HKCR "*\shell\nsis_app" "" "Open with nsis_app"
  	WriteRegStr HKCR "*\shell\nsis_app" "Icon" "$INSTDIR\nsis_app.ico"
  	WriteRegStr HKCR "*\shell\nsis_app\command" "" '"$INSTDIR\nsis_app.exe" "%1"'

  	# Make the uninstaller appear in the add/remove sofware UI
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "DisplayName" "nsis_app"
  	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "UninstallString" "$INSTDIR\uninstaller.exe"
  	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "InstallLocation" "$INSTDIR"
  	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "DisplayIcon" "$INSTDIR\nsis_app.ico"
  	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "Publisher" "Moi"
  	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "DisplayVersion" "1.0.0"
  	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "NoModify" 1
  	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "NoRepair" 1
  	WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app" "EstimatedSize" 20480

	# $SMPROGRAMS = %AppData%\Microsoft\Windows\Start Menu\Programs
	# Create folder: C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\nsis_app
	# Create shortcut: C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\nsis_app\Execute nsis_app.lnk

 	CreateDirectory "$SMPROGRAMS\nsis_app"
 	CreateShortCut "$SMPROGRAMS\nsis_app\Execute nsis_app.lnk" "$INSTDIR\nsis_app.exe" "" "$INSTDIR\nsis_app.ico" 0

	MessageBox MB_OK "The application has been successfully installed!"

SectionEnd

# ----------------------------------------------------------------
# Uninstaller section (the name is always "Uninstall")
# ----------------------------------------------------------------

Section "Uninstall"
	
	DeleteRegKey HKCU "Software\nsis_app"
	DeleteRegKey HKCR "*\shell\nsis_app"
	DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app"

	Delete "$SMPROGRAMS\nsis_app\nsis_app.lnk"
  	Delete "$SMPROGRAMS\nsis_app\Uninstall nsis_app.lnk"
	Delete "$INSTDIR\nsis_app.exe"
	Delete "$INSTDIR\nsis_app.ico"

  	Delete "$INSTDIR\uninstaller.exe"

	RMDir $INSTDIR

SectionEnd
