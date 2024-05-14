; Not exactly stolen, but strongly inspired by Greenshot: https://github.com/greenshot/greenshot/blob/release/1.3/installer/innosetup/setup.iss

#define MyAppName "TF-BAMF Installer"
#define MyAppVersion "0.4"
#define MyAppPublisher "Brokk"
#define MyAppURL "https://bamf.tf/"
#define MyAppRepoURL "https://github.com/statecouncil/tf-bamf"

#define InstallerAssetsDir ".\Assets"
#define BAMFDir "..\"

; change these
#define TF2Dir "..\"
#define CompilePalDir "..\"
#define VMFDir "..\"


[Setup]
AppId={{E8912FEF-28D2-42C1-8C65-FE8D62199FF5}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppRepoURL}
Compression=lzma
SolidCompression=yes
DisableStartupPrompt=no
WizardImageFile=compiler:{#InstallerAssetsDir}\welcome_raw.bmp
WizardSmallImageFile=compiler:{#InstallerAssetsDir}\icon.bmp
WizardStyle=modern
ShowLanguageDialog=no

DefaultDirName="..\"

DirExistsWarning=no
EnableDirDoesntExistWarning=yes
AppCopyright=BAMF is licensed under CC BY-SA 4.0. We are not affiliated with Valve.
SetupIconFile=compiler:{#InstallerAssetsDir}\favicon.ico
LicenseFile=compiler:{#InstallerAssetsDir}\LICENSE.txt


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

Source: "{#BAMFDir}\FGD\*"; Excludes: "{#BAMFDir}\FGD\x64\*"; DestDir: "{#TF2Dir}\bin"; Components: hammer\fgd; Flags: recursesubdirs
Source: "{#BAMFDir}\FGD\x64\hammerplusplus\hammerplusplus_sequences.cfg"; DestDir: "{#TF2Dir}\bin\x64\hammerplusplus"; Components: hammer\compilesequences_tools; Flags: recursesubdirs uninsneveruninstall
Source: "{#BAMFDir}\Compile Configs\Compilepal\*"; Excludes: "{#BAMFDir}\Compile Configs\Compilepal\Compiling"; DestDir: "{#CompilePalDir}"; Components: hammer\compilesequences_compilepal; Flags: recursesubdirs uninsneveruninstall

; parser not finished
; Source: "{#BAMFDir}\Compile Configs\Compilepal\Compiling\*"; DestDir: "{#CompilePalDir}\Compiling"; Components: hammer\errorparser; Flags: recursesubdirs

Source: "{#BAMFDir}\Tools\Radshadowman\*"; DestDir: "{#TF2Dir}\bin"; Components: tools\radshadowman; Flags: recursesubdirs
Source: "{#BAMFDir}\Tools\Propper\*"; DestDir: "{#TF2Dir}\bin"; Components: tools\propper; Flags: recursesubdirs

Source: "{#BAMFDir}\VPKs\BAMF FGD Assets.vpk"; DestDir: "{#TF2Dir}\tf\custom"; Components: assets\fgd; Flags: recursesubdirs
Source: "{#BAMFDir}\VPKs\BAMF Material Tag Overhaul.vpk"; DestDir: "{#TF2Dir}\tf\custom"; Components: assets\materialtags; Flags: recursesubdirs
Source: "{#BAMFDir}\BAMF Extra Materials\*"; DestDir: "{#TF2Dir}\tf\custom\BAMF Extra Materials"; Components: assets\extramaterials; Flags: recursesubdirs

Source: "{#BAMFDir}\Prefabs\*"; DestDir: "{#TF2Dir}\bin\Prefabs"; Components: prefabs; Flags: recursesubdirs uninsneveruninstall
Source: "{#BAMFDir}\Gamemodes\*"; DestDir: "{#VMFDir}\Gamemodes"; Components: gamemodes; Flags: recursesubdirs

Source: "{#BAMFDir}\VMFs\Decompiled Valve Maps\*"; DestDir: "{#VMFDir}\Decompiled Valve Maps"; Components: vmfs\valve_decompiled; Flags: recursesubdirs
Source: "{#BAMFDir}\VMFs\Source SDK 2013\*"; DestDir: "{#VMFDir}\Valve Releases"; Components: vmfs\valve_released; Flags: recursesubdirs
Source: "{#BAMFDir}\VMFs\artpass_valvebase\*"; DestDir: "{#VMFDir}\Valve Releases\artpass_valvebase"; Components: vmfs\valve_released; Flags: recursesubdirs
Source: "{#BAMFDir}\VMFs\Community Maps\*"; DestDir: "{#VMFDir}\Community Maps"; Components: vmfs\community; Flags: recursesubdirs




; add code for verifying TF2 Location
[Code]
function FullInstall(Param : String) : String;
begin
	result := SetupMessage(msgFullInstallation);
end;

function CustomInstall(Param : String) : String;
begin
	result := SetupMessage(msgCustomInstallation);
end;

function CompactInstall(Param : String) : String;
begin
	result := SetupMessage(msgCompactInstallation);
end;
