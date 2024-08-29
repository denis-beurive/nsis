# This example shows how to create a contextual menu with submenus
# Create the installer: makensis installer.nsi

# Use the Modern UI
!include MUI2.nsh

# -------------------------------------------------------------------------------------------------------
# General configuration
# -------------------------------------------------------------------------------------------------------

# Set the name of the installer
OutFile "installer.exe"

# Set the path to the installation directory
# See: the predefined constants
#      https://nsis.sourceforge.io/Docs/Chapter4.html#varconstant
# See: the installers' attribute "InstallDir"
#      https://nsis.sourceforge.io/Docs/Chapter4.html#instattribs
#      The variable that stores the value of this attribute is "$INSTDIR"
InstallDir "$PROGRAMFILES64\nsis-test3\"

# -------------------------------------------------------------------------------------------------------
# Configure the UI
# See: https://nsis.sourceforge.io/Docs/Modern%20UI%202/Readme.html
# See: https://stackoverflow.com/questions/33655279/nsis-installer-mui-icon-statement-ignored
# -------------------------------------------------------------------------------------------------------

!define MUI_COMPONENTSPAGE_SMALLDESC
!define MUI_UI "${NSISDIR}\Contrib\UIs\modern.exe"
!define MUI_INSTFILESPAGE_COLORS "FFFFFF 000000"
!define MUI_ICON "nsis_app.ico"
!define MUI_UNICON "nsis_app.ico"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_LANGUAGE English

# -------------------------------------------------------------------------------------------------------
# Default section
# -------------------------------------------------------------------------------------------------------

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

	# menu-name,submenu,icon
	WriteRegStr	HKCR "*\shell\nsis_app" MUIVerb" "nsis app"
	WriteRegStr	HKCR "*\shell\nsis_app" "ExtendedSubCommandsKey" "*\nsis_app_menu"
	WriteRegStr	HKCR "*\shell\nsis_app" "Icon" "$INSTDIR\nsis_app.ico" 

	WriteRegStr	HKCR "*\nsis_app_menu\shell\crypt" "MUIVerb" "Crypt this file"				
	WriteRegStr	HKCR "*\nsis_app_menu\shell\crypt\command" "" '"$INSTDIR\nsis_app.exe" "%1"'
	WriteRegStr	HKCR "*\nsis_app_menu\shell\crypt" "Icon" "$INSTDIR\nsis_app.ico" 

	WriteRegStr	HKCR "*\nsis_app_menu\shell\decrypt" "MUIVerb" "Decrypt the file"				
	WriteRegStr	HKCR "*\nsis_app_menu\shell\decrypt\command" "" '"$INSTDIR\nsis_app.exe" "%1"'
	WriteRegStr	HKCR "*\nsis_app_menu\shell\decrypt" "Icon" "$INSTDIR\nsis_app.ico" 
			
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

# -------------------------------------------------------------------------------------------------------
# Uninstaller section (the name is always "Uninstall")
# -------------------------------------------------------------------------------------------------------

Section "Uninstall"
	
	# TODO vérifier que toutes les clés sont bien supprimées
	DeleteRegKey HKCU "Software\nsis_app"
	DeleteRegKey HKCR "*\shell\nsis_app"
	DeleteRegKey HKCR "*\nsis_app_menu"
	DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\nsis_app"

	Delete "$SMPROGRAMS\nsis_app\Execute nsis_app.lnk"
  	RMDir  "$SMPROGRAMS\nsis_app"

	Delete "$INSTDIR\nsis_app.exe"
	Delete "$INSTDIR\nsis_app.ico"
  	Delete "$INSTDIR\uninstaller.exe"

	RMDir $INSTDIR
	
SectionEnd
