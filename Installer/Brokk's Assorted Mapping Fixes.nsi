############################################################################################
#      NSIS Installation Script created by NSIS Quick Setup Script Generator v1.09.18
#               Entirely Edited with NullSoft Scriptable Installation System                
#              by Vlasis K. Barkas aka Red Wine red_wine@freemail.gr Sep 2006               
############################################################################################

# THIS HAS TO BE CUSTOMIZED FOR A FUNCTIONING BUILD:
!define REPO_LOCATION "" # Should be global, i.e. "C:\i_store_my_code_projects_here\tf-bamf"

# THIS CAN BE CUSTOMIZED TO PREFERENCE
!define COMPILE_OUTPUT "${REPO_LOCATION}" # Where the compiled installer.exe is to be written, REPO_LOCATION by default


!define APP_NAME "Brokk's Assorted Mapping Fixes"
!define COMP_NAME "Brokk"
!define WEB_SITE "https://github.com/statecouncil/tf-bamf"
!define VERSION "0.3.2.0"
!define COPYRIGHT "lco-sp � 2024"
!define DESCRIPTION "Asset Pack"
!define LICENSE_TXT "${REPO_LOCATION}\LICENSE.txt"
!define INSTALLER_NAME "${COMPILE_OUTPUT}\tf_bamf_installer_${VERSION}.exe"
!define MAIN_APP_EXE "README.MD"
!define INSTALL_TYPE "SetShellVarContext current"
#!define REG_ROOT "HKCU"
#!define REG_APP_PATH "Software\Microsoft\Windows\CurrentVersion\App Paths\${MAIN_APP_EXE}"
!define UNINSTALL_PATH "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"

#!define REG_START_MENU "Start Menu Folder"

#var SM_Folder

######################################################################

VIProductVersion  "${VERSION}"
VIAddVersionKey "ProductName"  "${APP_NAME}"
VIAddVersionKey "CompanyName"  "${COMP_NAME}"
VIAddVersionKey "LegalCopyright"  "${COPYRIGHT}"
VIAddVersionKey "FileDescription"  "${DESCRIPTION}"
VIAddVersionKey "FileVersion"  "${VERSION}"

######################################################################

SetCompressor ZLIB #Use this for development compilation
#SetCompressor LZMA #Use this for release compilation
Name "${APP_NAME}"
Caption "${APP_NAME}"
OutFile "${INSTALLER_NAME}"
BrandingText "${APP_NAME}"
XPStyle on
#InstallDirRegKey "${REG_ROOT}" "${REG_APP_PATH}" ""
InstallDir "$PROGRAMFILES/"

######################################################################

!include "MUI.nsh"

!define MUI_ABORTWARNING
!define MUI_UNABORTWARNING

!insertmacro MUI_PAGE_WELCOME

!ifdef LICENSE_TXT
!insertmacro MUI_PAGE_LICENSE "${LICENSE_TXT}"
!endif

!insertmacro MUI_PAGE_DIRECTORY

!ifdef REG_START_MENU
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "Brokk's Assorted Mapping Fixes"
#!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${REG_ROOT}"
#!define MUI_STARTMENUPAGE_REGISTRY_KEY "${UNINSTALL_PATH}"
#!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${REG_START_MENU}"
!insertmacro MUI_PAGE_STARTMENU Application $SM_Folder
!endif

!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM

!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_UNPAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

######################################################################

Section -MainProgram
${INSTALL_TYPE}
SetOverwrite ifnewer
SetOutPath "$INSTDIR\tf_bamf"
File "${REPO_LOCATION}\README.md"
SetOutPath "$INSTDIR\tf\custom"
File /nonfatal /r "${REPO_LOCATION}\VPKs\*"
#SetOutPath "$INSTDIR\VMFs"
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

######################################################################

Section -Icons_Reg
SetOutPath "$INSTDIR"
WriteUninstaller "$INSTDIR\uninstall_tf_bamf.exe"
SectionEnd

/* 

!ifdef REG_START_MENU
!insertmacro MUI_STARTMENU_WRITE_BEGIN Application
CreateDirectory "$SMPROGRAMS\$SM_Folder"
CreateShortCut "$SMPROGRAMS\$SM_Folder\${APP_NAME}.lnk" "$INSTDIR\${MAIN_APP_EXE}"
CreateShortCut "$SMPROGRAMS\$SM_Folder\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"

!ifdef WEB_SITE
WriteIniStr "$INSTDIR\${APP_NAME} website.url" "InternetShortcut" "URL" "${WEB_SITE}"
CreateShortCut "$SMPROGRAMS\$SM_Folder\${APP_NAME} Website.lnk" "$INSTDIR\${APP_NAME} website.url"
!endif
!insertmacro MUI_STARTMENU_WRITE_END
!endif

!ifndef REG_START_MENU
CreateDirectory "$SMPROGRAMS\Brokk's Assorted Mapping Fixes"
CreateShortCut "$SMPROGRAMS\Brokk's Assorted Mapping Fixes\${APP_NAME}.lnk" "$INSTDIR\${MAIN_APP_EXE}"
CreateShortCut "$SMPROGRAMS\Brokk's Assorted Mapping Fixes\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"

!ifdef WEB_SITE
WriteIniStr "$INSTDIR\${APP_NAME} website.url" "InternetShortcut" "URL" "${WEB_SITE}"
CreateShortCut "$SMPROGRAMS\Brokk's Assorted Mapping Fixes\${APP_NAME} Website.lnk" "$INSTDIR\${APP_NAME} website.url"
!endif
!endif

WriteRegStr ${REG_ROOT} "${REG_APP_PATH}" "" "$INSTDIR\${MAIN_APP_EXE}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "DisplayName" "${APP_NAME}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "UninstallString" "$INSTDIR\uninstall.exe"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "DisplayIcon" "$INSTDIR\${MAIN_APP_EXE}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "DisplayVersion" "${VERSION}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "Publisher" "${COMP_NAME}"

!ifdef WEB_SITE
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "URLInfoAbout" "${WEB_SITE}"
!endif
SectionEnd
 */
######################################################################

Section Uninstall
${INSTALL_TYPE}
Delete "$INSTDIR\tf\custom\_readme*"
Delete "$INSTDIR\tf\custom\BAMF*"
Delete "$INSTDIR\bin\Prefabs\readme.txt"
Delete "$INSTDIR\bin\tf-brokk*"
Delete "$INSTDIR\bin\hammerplusplus\hammerplusplus_sequences.cfg"
RmDir /r "$INSTDIR\bin\spudlord-settings"
RmDir /r "$INSTDIR\tf_bamf"
RmDir /r "$INSTDIR\bin\Prefabs\BAMF - Doors"
RmDir /r "$INSTDIR\bin\Prefabs\BAMF - Gameplay Elements"
RmDir /r "$INSTDIR\bin\Prefabs\BAMF - Lights"
RmDir /r "$INSTDIR\bin\Prefabs\BAMF - Map Elements"
RmDir /r "$INSTDIR\bin\Prefabs\BAMF - Payload Tracks"
RmDir /r "$INSTDIR\bin\Prefabs\BAMF - Pickups"
RmDir /r "$INSTDIR\bin\Prefabs\BAMF - Soundscapes"
RmDir "$INSTDIR\bin\Prefabs"
RmDir /r "$INSTDIR\bin\Radshadowman"
#RmDir /r "$INSTDIR\VMFs\artpass_valvebase"
#RmDir /r "$INSTDIR\VMFs\Community Maps\MegapiemanPHD"
RmDir /r "$INSTDIR\tf\custom\BAMF Extra Materials"
RmDir /r "$INSTDIR\tf\custom\BAMF FGD Assets"
RmDir /r "$INSTDIR\tf\custom\BAMF Material Tag Overhaul"
RmDir /r "$INSTDIR\tf\custom\BAMF Surfaceprops"
 
Delete "$INSTDIR\uninstall_tf_bamf.exe"
#!ifdef WEB_SITE
#Delete "$INSTDIR\${APP_NAME} website.url"
#!endif

#!ifdef REG_START_MENU
#!insertmacro MUI_STARTMENU_GETFOLDER "Application" $SM_Folder
#Delete "$SMPROGRAMS\$SM_Folder\${APP_NAME}.lnk"
#Delete "$SMPROGRAMS\$SM_Folder\Uninstall ${APP_NAME}.lnk"
#!ifdef WEB_SITE
#Delete "$SMPROGRAMS\$SM_Folder\${APP_NAME} Website.lnk"
#!endif
#RmDir "$SMPROGRAMS\$SM_Folder"
#!endif

#!ifndef REG_START_MENU
#Delete "$SMPROGRAMS\Brokk's Assorted Mapping Fixes\${APP_NAME}.lnk"
#Delete "$SMPROGRAMS\Brokk's Assorted Mapping Fixes\Uninstall ${APP_NAME}.lnk"
#!ifdef WEB_SITE
#Delete "$SMPROGRAMS\Brokk's Assorted Mapping Fixes\${APP_NAME} Website.lnk"
#!endif
#RmDir "$SMPROGRAMS\Brokk's Assorted Mapping Fixes"
#!endif

#DeleteRegKey ${REG_ROOT} "${REG_APP_PATH}"
#DeleteRegKey ${REG_ROOT} "${UNINSTALL_PATH}"
SectionEnd

######################################################################

