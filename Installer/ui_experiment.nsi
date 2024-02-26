#!define REPO_LOCATION "D:\GitHub\tf-bamf" # Should be global, i.e. "C:\i_store_my_code_projects_here\tf-bamf"
#
## THIS CAN BE CUSTOMIZED TO PREFERENCE
#!define COMPILE_OUTPUT "${REPO_LOCATION}\Installer" # Where the compiled installer.exe is to be written, REPO_LOCATION by default
#
#
#!define APP_NAME "Brokk's Assorted Mapping Fixes"
#!define COMP_NAME "Brokk"
#!define WEB_SITE "https://github.com/statecouncil/tf-bamf"
#!define VERSION "0.3.2.0"
#!define COPYRIGHT "lco-sp � 2024"
#!define DESCRIPTION "Asset Pack"
#!define LICENSE_TXT "${REPO_LOCATION}\LICENSE.txt"
#!define INSTALLER_NAME "${COMPILE_OUTPUT}\tf_bamf_installer_${VERSION}.exe"
#!define MAIN_APP_EXE "README.MD"
#!define INSTALL_TYPE "SetShellVarContext current"
#!define UNINSTALL_PATH "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"
#
#VIProductVersion  "${VERSION}"
#VIAddVersionKey "ProductName"  "${APP_NAME}"
#VIAddVersionKey "CompanyName"  "${COMP_NAME}"
#VIAddVersionKey "LegalCopyright"  "${COPYRIGHT}"
#VIAddVersionKey "FileDescription"  "${DESCRIPTION}"
#VIAddVersionKey "FileVersion"  "${VERSION}"
#
#SetCompressor ZLIB #Use this for development compilation
##SetCompressor LZMA #Use this for release compilation
#Name "${APP_NAME}"
#Caption "${APP_NAME}"
#OutFile "${INSTALLER_NAME}"
#BrandingText "${APP_NAME}"
#XPStyle on
#InstallDir "$PROGRAMFILES/"
#!define MUI_ABORTWARNING
#!define MUI_UNABORTWARNING

#This file is a prototype for the extended UI of the installer.
#It does not actually deploy any content

# THIS HAS TO BE CUSTOMIZED FOR A FUNCTIONING BUILD:
#!define REPO_LOCATION "D:\GitHub\tf-bamf" # Should be global, i.e. "C:\i_store_my_code_projects_here\tf-bamf"

# THIS CAN BE CUSTOMIZED TO PREFERENCE
#!define COMPILE_OUTPUT "${REPO_LOCATION}\Installer" # Where the compiled installer.exe is to be written, REPO_LOCATION by default


!define APP_NAME "TF Bamf UI Experiment"
!define VERSION "0.0.2.0"
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
#XPStyle on
InstallDir "$PROGRAMFILES/"

!include "MUI.nsh"
#!define MUI_ICON "D:\GitHub\tf-bamf\Installer\icon.ico"
#!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH


Section -MainProgram
MessageBox MB_OK "Okay, let's start this from the beginning."
SectionEnd


Section "Option 1" Option1
MessageBox MB_OK "Thank you for picking Option 1!"
SectionEnd

Section "Option 2" Option2
MessageBox MB_OK "Option 2, yeah!"
SectionEnd

LangString DESC_Option1 ${LANG_ENGLISH} "Description of option 1."
LangString DESC_Option2 ${LANG_ENGLISH} "Description of option 2."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${Option1} $(DESC_Option1)
  !insertmacro MUI_DESCRIPTION_TEXT ${Option2} $(DESC_Option2)
!insertmacro MUI_FUNCTION_DESCRIPTION_END




Section -Icons_Reg
SetOutPath "D:\GitHub\tf-bamf\Installer"
WriteUninstaller "D:\GitHub\tf-bamf\Installer\uninstall_tf_bamf.exe"
SectionEnd

Section Uninstall
MessageBox MB_OK "Bye!"
SectionEnd


!insertmacro MUI_LANGUAGE "English"