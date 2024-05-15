; Not exactly stolen, but strongly inspired by Greenshot: https://github.com/greenshot/greenshot/blob/release/1.3/installer/innosetup/setup.iss

#define MyAppName "TF-BAMF Installer"
#define MyAppVersion "0.4"
#define MyAppPublisher "Brokk"
#define MyAppURL "https://bamf.tf/"
#define MyAppRepoURL "https://github.com/statecouncil/tf-bamf"

#define InstallerAssetsDir ".\Assets"

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
DefaultDirName={commonpf}\tf-bamf

EnableDirDoesntExistWarning=No
AppCopyright=BAMF is licensed under CC BY-SA 4.0. We are not affiliated with Valve.
SetupIconFile=D:\GitHub\tf-bamf\docs\favicon.ico
LicenseFile=D:\GitHub\tf-bamf\docs\license.txt
AllowRootDirectory=No
AllowUNCPath=No
OutputDir=D:\GitHub\tf-bamf\Installer\builds
SourceDir=D:\GitHub\tf-bamf
InfoBeforeFile=D:\GitHub\tf-bamf\Installer\assets\bamf-readme.txt

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


[Tasks]
; GroupDescription NEEDS to be identical for grouped tasks
Name: "fgd_settings_propper_yes"; Description: "Enable built-in Propper entities"; GroupDescription: "This FGD supports Propper by default. If you would rather use your own Propper FGD, disable it here and include it manually in Hammer."; Components: hammer\fgd; Flags: exclusive
Name: "fgd_settings_propper_no"; Description: "Disable built-in Propper entities"; GroupDescription: "This FGD supports Propper by default. If you would rather use your own Propper FGD, disable it here and include it manually in Hammer."; Components: hammer\fgd; Flags: exclusive

Name: "fgd_spawnmodel_abs"; Description: "Use A Boojum Snark's Engineer model"; GroupDescription: "Change the appearance of hammer's info_player_teamspawn entity."; Components: hammer\fgd; Flags: exclusive
Name: "fgd_spawnmodel_puddy"; Description: "Use Puddy's Engineer model"; GroupDescription: "Change the appearance of hammer's info_player_teamspawn entity."; Components: hammer\fgd; Flags: exclusive
Name: "fgd_spawnmodel_default"; Description: "Use default 'Cordon Freeman' model"; GroupDescription: "Change the appearance of hammer's info_player_teamspawn entity."; Components: hammer\fgd; Flags: exclusive


[Files]
; Set the following paths: #TF2Dir, #CompilePalDir, #VMFDir

Source: "D:\GitHub\tf-bamf\FGD\*"; Excludes: "D:\GitHub\tf-bamf\FGD\x64\*"; DestDir: "{app}\bin"; Components: hammer\fgd; Flags: recursesubdirs
Source: "D:\GitHub\tf-bamf\FGD\x64\hammerplusplus\hammerplusplus_sequences.cfg"; DestDir: "{app}\bin\x64\hammerplusplus"; Components: hammer\compilesequences_tools; Flags: recursesubdirs uninsneveruninstall
Source: "D:\GitHub\tf-bamf\Compile Configs\Compilepal\*"; Excludes: "D:\GitHub\tf-bamf\Compile Configs\Compilepal\Compiling"; DestDir: "{code:GetDir|0}\Compiling"; Components: hammer\compilesequences_compilepal; Flags: recursesubdirs uninsneveruninstall

; parser not finished
; Source: "D:\GitHub\tf-bamf\Compile Configs\Compilepal\Compiling\*"; DestDir: "{#CompilePalDir}\Compiling"; Components: hammer\errorparser; Flags: recursesubdirs

Source: "D:\GitHub\tf-bamf\Tools\Radshadowman\*"; DestDir: "{app}\bin"; Components: tools\radshadowman; Flags: recursesubdirs
Source: "D:\GitHub\tf-bamf\Tools\Propper\*"; DestDir: "{code:GetDir|0}\bin"; Components: tools\propper; Flags: recursesubdirs

Source: "D:\GitHub\tf-bamf\VPKs\BAMF FGD Assets.vpk"; DestDir: "{code:GetDir|0}\tf\custom"; Components: assets\fgd; Flags: recursesubdirs
Source: "D:\GitHub\tf-bamf\VPKs\BAMF Material Tag Overhaul.vpk"; DestDir: "{code:GetDir|0}\tf\custom"; Components: assets\materialtags; Flags: recursesubdirs
Source: "D:\GitHub\tf-bamf\VPKs\BAMF Extra Materials\*"; DestDir: "{code:GetDir|0}\tf\custom\BAMF Extra Materials"; Components: assets\extramaterials; Flags: recursesubdirs

Source: "D:\GitHub\tf-bamf\Prefabs\*"; DestDir: "{code:GetDir|1}\bin\Prefabs"; Components: prefabs; Flags: recursesubdirs uninsneveruninstall
Source: "D:\GitHub\tf-bamf\Gamemodes\*"; DestDir: "{code:GetDir|1}\Gamemodes"; Components: gamemodes; Flags: recursesubdirs

[Code]
var
  DirPage: TInputDirWizardPage;

function GetDir(Param: String): String;
begin
  Result := DirPage.Values[StrToInt(Param)];
end;

procedure InitializeWizard;
begin
  { create a directory input page }
  DirPage := CreateInputDirPage(
    wpSelectDir, ' file paths', 'If you decide to install th', 'SubCaption', False, '');
  { add directory input page items }
  DirPage.Add('Prompt 1');
  DirPage.Add('Prompt 2');
  { assign default directories for the items from the previously stored data; if }
  { there are no data stored from the previous installation, use default folders }
  { of your choice }
  DirPage.Values[0] := GetPreviousData('Directory1', ExpandConstant('{commonpf}\tf-bamf\directory1'));

  DirPage := CreateInputDirPage(
    wpSelectDir, 'Additional file paths', 'If you decide to install th', 'SubCaption', False, '');
  { add directory input page items }
  DirPage.Add('Prompt 1');
  DirPage.Add('Prompt 2');
  { assign default directories for the items from the previously stored data; if }
  { there are no data stored from the previous installation, use default folders }
  { of your choice }
  DirPage.Values[1] := GetPreviousData('Directory2', ExpandConstant('{commonpf}\tf-bamf\directory2'));
end;

procedure RegisterPreviousData(PreviousDataKey: Integer);
begin
  { store chosen directories for the next run of the setup }
  SetPreviousData(PreviousDataKey, 'Directory1', DirPage.Values[0]);
  SetPreviousData(PreviousDataKey, 'Directory2', DirPage.Values[1]);
end;