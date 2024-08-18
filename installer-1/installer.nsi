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
	WriteUninstaller $INSTDIR\uninstaller.exe

	MessageBox MB_OK "The application has been successfully installed!"

SectionEnd

# ----------------------------------------------------------------
# Uninstaller section (the name is always "Uninstall")
# ----------------------------------------------------------------

Section "Uninstall"

	Delete $INSTDIR\nsis_app.exe
	Delete $INSTDIR\uninstaller.exe
	RMDir $INSTDIR

SectionEnd
