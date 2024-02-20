#This file is a prototype for the extended UI of the installer.
#It does not actually deploy any content

# THIS HAS TO BE CUSTOMIZED FOR A FUNCTIONING BUILD:
#!define REPO_LOCATION "D:\GitHub\tf-bamf" # Should be global, i.e. "C:\i_store_my_code_projects_here\tf-bamf"

# THIS CAN BE CUSTOMIZED TO PREFERENCE
#!define COMPILE_OUTPUT "${REPO_LOCATION}\Installer" # Where the compiled installer.exe is to be written, REPO_LOCATION by default


!define APP_NAME "TF Bamf UI Experiment"
!define VERSION "0.0.1.0"
!define INSTALLER_NAME "ui_experiment_${VERSION}.exe"
!define INSTALL_TYPE "SetShellVarContext current"
!define UNINSTALL_PATH "Software\Microsoft\Windows\CurrentVersion"

VIProductVersion  "${VERSION}"
VIAddVersionKey "ProductName"  "${APP_NAME}"
VIAddVersionKey "CompanyName"  "${COMP_NAME}"
VIAddVersionKey "LegalCopyright"  "${COPYRIGHT}"
VIAddVersionKey "FileDescription"  "${DESCRIPTION}"
VIAddVersionKey "FileVersion"  "${VERSION}"

Name "${APP_NAME}"
Caption "${APP_NAME}"
OutFile "${INSTALLER_NAME}"
BrandingText "${APP_NAME}"
XPStyle on
InstallDir "$PROGRAMFILES/"

#!include "MUI.nsh"


Section
MessageBox MB_OK "Okay, let's start this from the beginning."
SectionEnd
