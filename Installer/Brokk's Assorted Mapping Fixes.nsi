# THIS HAS TO BE CUSTOMIZED FOR A FUNCTIONING BUILD:
!define REPO_LOCATION "D:\Code\tf-bamf" # Should be global, i.e. "C:\i_store_my_code_projects_here\tf-bamf"

# THIS CAN BE CUSTOMIZED TO PREFERENCE
!define COMPILE_OUTPUT "${REPO_LOCATION}\Installer" # Where the compiled installer.exe is to be written, REPO_LOCATION by default


!define APP_NAME "Brokk's Assorted Mapping Fixes"
!define COMP_NAME "Brokk"
!define WEB_SITE "https://github.com/statecouncil/tf-bamf"
!define VERSION "0.4.0.0"
!define COPYRIGHT "lco-sp © 2024"
!define DESCRIPTION "Asset Pack"
!define LICENSE_TXT "${REPO_LOCATION}\LICENSE.txt"
!define INSTALLER_NAME "${COMPILE_OUTPUT}\tf_bamf_installer_${VERSION}.exe"
!define MAIN_APP_EXE "README.MD"
!define INSTALL_TYPE "SetShellVarContext current"
!define UNINSTALL_PATH "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"

VIProductVersion  "${VERSION}"
VIAddVersionKey "ProductName"  "${APP_NAME}"
VIAddVersionKey "CompanyName"  "${COMP_NAME}"
VIAddVersionKey "LegalCopyright"  "${COPYRIGHT}"
VIAddVersionKey "FileDescription"  "${DESCRIPTION}"
VIAddVersionKey "FileVersion"  "${VERSION}"

SetCompressor ZLIB #Use this for development compilation
#SetCompressor LZMA #Use this for release compilation
Name "${APP_NAME}"
Caption "${APP_NAME}"
OutFile "${INSTALLER_NAME}"
BrandingText "${APP_NAME}"
XPStyle on
InstallDir "$PROGRAMFILES/"

!include "MUI.nsh"

!define MUI_ABORTWARNING
!define MUI_UNABORTWARNING

!insertmacro MUI_PAGE_WELCOME

!ifdef LICENSE_TXT
!insertmacro MUI_PAGE_LICENSE "${LICENSE_TXT}"
!endif

!insertmacro MUI_PAGE_DIRECTORY

#!ifdef REG_START_MENU
#!define MUI_STARTMENUPAGE_DEFAULTFOLDER "Brokk's Assorted Mapping Fixes"
#!insertmacro MUI_PAGE_STARTMENU Application $SM_Folder
#!endif

!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM

!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_UNPAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

Section -MainProgram
${INSTALL_TYPE}
SetOverwrite ifnewer
SetOutPath "$INSTDIR\tf_bamf"
File "${REPO_LOCATION}\README.md"
SetOutPath "$INSTDIR\tf\custom"
File /nonfatal /r "${REPO_LOCATION}\VPKs\*"
SetOutPath "$INSTDIR\tf_bamf\VMFs"
File /nonfatal /r "${REPO_LOCATION}\VMFs\*"
SetOutPath "$INSTDIR\bin\Radshadowman"
File "${REPO_LOCATION}\Tools\Radshadowman\Program.cs"
File "${REPO_LOCATION}\Tools\Radshadowman\RadShadowMan.exe"
File "${REPO_LOCATION}\Tools\Radshadowman\readme.txt"
SetOutPath "$INSTDIR\bin\Prefabs"
File /nonfatal /r "${REPO_LOCATION}\Prefabs\*"
SetOutPath "$INSTDIR\tf_bamf\Gamemodes"
File /nonfatal /r "${REPO_LOCATION}\Gamemodes\*"
SetOutPath "$INSTDIR\bin"
File "${REPO_LOCATION}\FGD\tf-brokk-notes.txt"
File "${REPO_LOCATION}\FGD\tf-brokk.fgd"
SetOutPath "$INSTDIR\bin\spudlord-settings"
File "${REPO_LOCATION}\FGD\spudlord-settings\default.fgd"
File "${REPO_LOCATION}\FGD\spudlord-settings\linediv-blank.fgd"
File "${REPO_LOCATION}\FGD\spudlord-settings\linediv.fgd"
File "${REPO_LOCATION}\FGD\spudlord-settings\propper.fgd"
SetOutPath "$INSTDIR\bin\hammerplusplus"
File "${REPO_LOCATION}\FGD\hammerplusplus\hammerplusplus_sequences.cfg"
SectionEnd

Section -Icons_Reg
SetOutPath "$INSTDIR"
WriteUninstaller "$INSTDIR\tf_bamf\uninstall_tf_bamf.exe"
SectionEnd

Section Uninstall
${INSTALL_TYPE}
Delete "$INSTDIR\..\tf\custom\_readme-extra-materials.txt"
Delete "$INSTDIR\..\tf\custom\_readme-fgd-assets.txt"
Delete "$INSTDIR\..\tf\custom\_readme-surfaceprops.txt"
Delete "$INSTDIR\..\tf\custom\_readme-tag-overhaul.txt"
Delete "$INSTDIR\..\tf\custom\BAMF*"
RmDir /r "$INSTDIR\..\tf\custom\BAMF Extra Materials"
RmDir /r "$INSTDIR\..\tf\custom\BAMF FGD Assets"
RmDir /r "$INSTDIR\..\tf\custom\BAMF Material Tag Overhaul"
RmDir /r "$INSTDIR\..\tf\custom\BAMF Surfaceprops"
Delete "$INSTDIR\..\bin\tf-brokk*"
RmDir /r "$INSTDIR\..\bin\spudlord-settings"
RmDir "$INSTDIR\..\bin\Prefabs"
RmDir /r "$INSTDIR\..\bin\Radshadowman"
Delete "$INSTDIR\..\tf_bamf\uninstall_tf_bamf.exe"
RmDir /r "$INSTDIR\..\tf_bamf"
SectionEnd
