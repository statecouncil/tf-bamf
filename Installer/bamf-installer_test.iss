; Not exactly stolen, but strongly inspired by Greenshot: https://github.com/greenshot/greenshot/blob/release/1.3/installer/innosetup/setup.iss

#define MyAppName "TF-BAMF Installer"
#define MyAppVersion "0.4"
#define MyAppPublisher "Brokk"
#define MyAppURL "https://bamf.tf/"
#define MyAppRepoURL "https://github.com/statecouncil/tf-bamf"

#define InstallerAssetsDir "{#SourcePath}\Assets"
#define BamfDir "{#SourcePath}\.."

; change these
#define TF2Dir "..\"
#define CompilePalDir "..\"
#define VMFDir "..\"


[Setup]
AppId={{E8912FEF-28D2-42C1-8C65-FE8D62199FF5}
AppName=Brokk's Assorted Mapping Fixes
AppPublisher=Brokk
AppPublisherURL=https://bamf.tf
AppSupportURL=https://bamf.tf
AppUpdatesURL=https://bamf.tf
Compression=lzma
SolidCompression=yes
DisableStartupPrompt=True
DisableWelcomePage=False
WizardImageFile=D:\GitHub\tf-bamf\Installer\assets\welcome_raw.bmp
WizardSmallImageFile=D:\GitHub\tf-bamf\Installer\assets\icon.bmp
WizardStyle=modern
ShowLanguageDialog=no
AppVersion=0.4                          
DefaultDirName=C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2

EnableDirDoesntExistWarning=No
AppCopyright=BAMF is licensed under CC BY-SA 4.0. We are not affiliated with Valve.
SetupIconFile=D:\GitHub\tf-bamf\docs\favicon.ico
LicenseFile=D:\GitHub\tf-bamf\license.txt
AllowRootDirectory=No
AllowUNCPath=No
OutputDir=D:\GitHub\tf-bamf\Installer\builds
OutputBaseFilename=tf-bamf-setup-{#SetupSetting("AppVersion")}
SourceDir=D:\GitHub\tf-bamf
InfoBeforeFile=D:\GitHub\tf-bamf\Installer\assets\bamf-readme.txt
UninstallDisplayName=Brokk's Assorted Mapping Fixes {#SetupSetting("AppVersion")}
UninstallFilesDir={app}\bin\spudlord-settings


[Messages]
SelectDirDesc=(Default: C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2)
WizardSelectDir=Select your TF2 installation
SelectDirLabel3=IMPORTANT: TF-BAMF will NOT work if it is not installed into the Team Fortress 2 folder!%nYou can find your TF2 installation by opening Steam, right-clicking onto Team Fortress 2, and selecting Manage -> Browse Local Files.
WelcomeLabel1=Brokk's Assorted Mapping Fixes {#SetupSetting("AppVersion")}
WelcomeLabel2=Merasmus will guide you through the installation process.
FinishedHeadingLabel=Brokk's Assorted Mapping Fixes has finished installing
FinishedLabelNoIcons=Merasmus will now return to his castle.
ClickFinish=IMPORTANT: You need to manually change the FGD (game data) file in Hammer in order to access improved entity information and icons.
RunEntryShellExec=Open detailed instructions for changing your FGD file
ConfirmUninstall=Are you sure you want to remove %1? Your Prefabs folder and CompilePal installation will remain unaffected.


[Types]
; everything we have to offer
Name: "full"; Description: "Full installation"

; equal to https://bamf.tf/pack/install.html#Basic%20Manual%20Installation
Name: "compact"; Description: "Basic installation"

Name: "custom"; Description: "Custom Installation"; Flags: iscustom


[Components]
; Name: ""; Description: ""; Types: full custom; Flags: disablenouninstallwarning

Name: "hammer"; Description: "Hammer Stuff"; Types: full custom; Flags: disablenouninstallwarning
Name: "hammer\fgd"; Description: "FGD"; Types: full custom compact; Flags: disablenouninstallwarning
Name: "hammer\compilesequences_tools"; Description: "Hammer++ compile sequences for Propper and Radshadowman"; Types: full custom; Flags: disablenouninstallwarning
Name: "hammer\compilesequences_compilepal"; Description: "Advanced CompilePal sequences"; Types: full custom; Flags: disablenouninstallwarning

; Parser not finished yet
; Name: "hammer\errorparser"; Description: "Improved CompilePal Error Parser"; Types: full custom; Flags: disablenouninstallwarning

Name: "tools"; Description: "Tools"; Types: full custom; Flags: disablenouninstallwarning
Name: "tools\radshadowman"; Description: "RadShadowMan"; Types: full custom; Flags: disablenouninstallwarning
Name: "tools\propper"; Description: "Propper"; Types: full custom; Flags: disablenouninstallwarning

Name: "assets"; Description: "Mapping Assets"; Types: full custom; Flags: disablenouninstallwarning
Name: "assets\fgd"; Description: "FGD Assets"; Types: full custom compact; Flags: disablenouninstallwarning
Name: "assets\materialtags"; Description: "Material Tag and Preview Overhaul"; Types: full custom compact; Flags: disablenouninstallwarning
Name: "assets\extramaterials"; Description: "Extra Materials"; Types: full custom; Flags: disablenouninstallwarning

Name: "prefabs"; Description: "Hammer Prefabs"; Types: full custom compact; Flags: disablenouninstallwarning
Name: "gamemodes"; Description: "Gamemode Prefabs"; Types: full custom compact; Flags: disablenouninstallwarning

Name: "vmfs"; Description: "Example VMFs"; Types: full custom; Flags: disablenouninstallwarning
Name: "vmfs\valve_decompiled"; Description: "Decompiled Valve Maps"; Types: full custom compact; Flags: disablenouninstallwarning
Name: "vmfs\valve_released"; Description: "Source SDK 2013 VMFs and artpass_valvebase"; Types: full custom compact; Flags: disablenouninstallwarning
Name: "vmfs\community"; Description: "Community-Contributed Map VMFs"; Types: full custom; Flags: disablenouninstallwarning


;[Tasks]
; GroupDescription NEEDS to be identical for grouped tasks
;Name: "fgd_settings_propper_yes"; Description: "Enable built-in Propper entities"; GroupDescription: "This FGD supports Propper by default. If you would rather use your own Propper FGD, disable it here and include it manually in Hammer."; Components: hammer\fgd; Flags: exclusive
;Name: "fgd_settings_propper_no"; Description: "Disable built-in Propper entities"; GroupDescription: "This FGD supports Propper by default. If you would rather use your own Propper FGD, disable it here and include it manually in Hammer."; Components: hammer\fgd; Flags: exclusive

;Name: "fgd_spawnmodel_abs"; Description: "Use A Boojum Snark's Engineer model"; GroupDescription: "Change the appearance of hammer's info_player_teamspawn entity."; Components: hammer\fgd; Flags: exclusive
;Name: "fgd_spawnmodel_puddy"; Description: "Use Puddy's Engineer model"; GroupDescription: "Change the appearance of hammer's info_player_teamspawn entity."; Components: hammer\fgd; Flags: exclusive
;Name: "fgd_spawnmodel_default"; Description: "Use default 'Cordon Freeman' model"; GroupDescription: "Change the appearance of hammer's info_player_teamspawn entity."; Components: hammer\fgd; Flags: exclusive


[Files]
; Set the following paths: #TF2Dir, #CompilePalDir, #VMFDir

Source: "D:\GitHub\tf-bamf\FGD\*"; Excludes: "D:\GitHub\tf-bamf\FGD\x64\*"; DestDir: "{app}\bin"; Components: hammer\fgd; Flags: recursesubdirs
Source: "{#InstallerAssetsDir}\how_to_change_fgd.txt"; DestDir: "{app}"; Components: hammer\fgd; Flags: ignoreversion replacesameversion isreadme
Source: "D:\GitHub\tf-bamf\FGD\x64\hammerplusplus\hammerplusplus_sequences.cfg"; DestDir: "{app}\bin\x64\hammerplusplus"; Components: hammer\compilesequences_tools; Flags: recursesubdirs uninsneveruninstall
Source: "D:\GitHub\tf-bamf\Compile Configs\Compilepal\*"; Excludes: "D:\GitHub\tf-bamf\Compile Configs\Compilepal\Compiling"; DestDir: "{code:GetCompilepalDir|0}\Compiling"; Components: hammer\compilesequences_compilepal; Flags: recursesubdirs uninsneveruninstall

; parser not finished
; Source: "D:\GitHub\tf-bamf\Compile Configs\Compilepal\Compiling\*"; DestDir: "{#CompilePalDir}\Compiling"; Components: hammer\errorparser; Flags: recursesubdirs

Source: "D:\GitHub\tf-bamf\Tools\Radshadowman\*"; DestDir: "{app}\bin"; Components: tools\radshadowman; Flags: recursesubdirs
Source: "D:\GitHub\tf-bamf\Tools\Propper\*"; DestDir: "{code:GetCompilepalDir|0}\bin"; Components: tools\propper; Flags: recursesubdirs

Source: "D:\GitHub\tf-bamf\VPKs\BAMF FGD Assets.vpk"; DestDir: "{code:GetVMFDir|0}\tf\custom"; Components: assets\fgd; Flags: recursesubdirs
Source: "D:\GitHub\tf-bamf\VPKs\BAMF Material Tag Overhaul.vpk"; DestDir: "{code:GetVMFDir|0}\tf\custom"; Components: assets\materialtags; Flags: recursesubdirs
Source: "D:\GitHub\tf-bamf\VPKs\BAMF Extra Materials\*"; DestDir: "{code:GetVMFDir|0}\tf\custom\BAMF Extra Materials"; Components: assets\extramaterials; Flags: recursesubdirs

Source: "D:\GitHub\tf-bamf\Prefabs\*"; Excludes: "D:\GitHub\tf-bamf\Prefabs\_todo_prefabs.txt"; DestDir: "{code:GetVMFDir|0}\bin\Prefabs"; Components: prefabs; Flags: recursesubdirs uninsneveruninstall
Source: "D:\GitHub\tf-bamf\Gamemodes\*"; DestDir: "{code:GetVMFDir|0}\Gamemodes"; Components: gamemodes; Flags: recursesubdirs

[Code]
var
  DirPageCompilepal: TInputDirWizardPage;
  DirPageVMF: TInputDirWizardPage;

function GetCompilepalDir(Param: String): String;
begin
  Result := DirPageCompilepal.Values[StrToInt(Param)];
end;

function GetVMFDir(Param: String): String;
begin
  Result := DirPageVMF.Values[StrToInt(Param)];
end;

procedure InitializeWizard;
begin
  { create a directory input page }
  DirPageCompilepal := CreateInputDirPage(
    wpSelectDir, ' Select the location of your CompilePal installation', '', 'WARNING: TF-BAMFs CompilePal components will not work if this folder is not set correctly!', False, '');
  { add directory input page items }
  DirPageCompilepal.Add('Path:');
  { assign default directories for the items from the previously stored data; if }
  { there are no data stored from the previous installation, use default folders }
  { of your choice }
  DirPageCompilepal.Values[0] := GetPreviousData('Directory1', ExpandConstant('{commonpf}'));

  DirPageVMF := CreateInputDirPage(
    wpSelectDir, 'Select the location in which you want to install map files', 'This can be any folder. Mapfiles can be accessed via Hammer.', '(Default: C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\mapsrc)', False, '');
  { add directory input page items }
  DirPageVMF.Add('Path:');
  { assign default directories for the items from the previously stored data; if }
  { there are no data stored from the previous installation, use default folders }
  { of your choice }
  DirPageVMF.Values[0] := GetPreviousData('Directory2', ExpandConstant('C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\mapsrc'));
end;