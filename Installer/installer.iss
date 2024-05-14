; Not exactly stolen, but strongly inspired by Greenshot: https://github.com/greenshot/greenshot/blob/release/1.3/installer/innosetup/setup.iss

#define MyAppName "TF-BAMF Installer"
#define MyAppVersion "0.4"
#define MyAppPublisher "Brokk"
#define MyAppURL "https://bamf.tf/"
#define MyAppRepoURL "https://github.com/statecouncil/tf-bamf"
#define BuildDir ".\"
#define BAMFDir "..\"
#define FGDDir "..\FGD"
#define PrefabsDir "..\Prefabs"
#define VPKsDir "..\VPKs"
#define VMFsDir "..\VMFs"
#define GamemodesDir "..\Gamemodes"


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
DisableStartupPrompt=False
DisableWelcomePage=False
WizardImageFile=compiler:{#BuildDir}\assets\welcome_raw.bmp
WizardSmallImageFile=compiler:{#BuildDir}\assets\icon.bmp
DisableWelcomePage=False
WizardStyle=modern
ShowLanguageDialog=no

[Types]                   
Name: "full"; Description: "Full installation"
Name: "compact"; Description: "Compact installation"
Name: "custom"; Description: "Custom Installation"; Flags: iscustom

[Components]
Name: "bamf"; Description: "TF-BAMF"; Types: full compact custom; Flags: fixed
Name: "hammer"; Description: "Hammer"; Types: custom; Flags: disablenouninstallwarning
Name: "hammer\fgd"; Description: "FGD"; Types: full compact custom; Flags: disablenouninstallwarning
Name: "hammer\expert_sequences"; Description: "Expert Compile sequences for Propper and Radshadowman"; Types: full custom; Flags: disablenouninstallwarning
Name: "hammer\advanced_sequences"; Description: "Advanced CompilePal sequences"; Types: full custom; Flags: disablenouninstallwarning
Name: "tools"; Description: "Tools"; Types: full custom; Flags: disablenouninstallwarning
Name: "tools\radshadowman"; Description: "Radshadowman"; Types: full custom; Flags: disablenouninstallwarning
Name: "tools\Propper"; Description: "Propper"; Types: full custom; Flags: disablenouninstallwarning
Name: "assets"; Description: "Assets"; Types: full custom; Flags: disablenouninstallwarning
Name: "assets\fdg_vpk"; Description: "FGD Assets (VPK)"; Types: full compact custom; Flags: disablenouninstallwarning
Name: "assets\material_vpk"; Description: "Material Tag Overhaul (VPK)"; Types: full compact custom; Flags: disablenouninstallwarning
Name: "assets\material_extra"; Description: "Extra Materials (Loose Files)"; Types: full custom; Flags: disablenouninstallwarning
Name: "assets\surfaceprop"; Description: "Surfaceprop Overhaul (Loose Files)  "; Types: full custom; Flags: disablenouninstallwarning
Name: "prefabs"; Description: "Prefabs"; Types: full compact custom; Flags: disablenouninstallwarning
Name: "gamemodes"; Description: "Gamemode Prefabs"; Types: full compact custom; Flags: disablenouninstallwarning     
Name: "examples"; Description: "Examples"; Types: full custom; Flags: disablenouninstallwarning
Name: "examples\valve"; Description: "Valve-owned Maps (VMF)"; Types: full custom; Flags: disablenouninstallwarning
Name: "examples\community"; Description: "Community-owned Maps (VMF)"; Types: full custom; Flags: disablenouninstallwarning

[Tasks]
; possibly redundant, remove if functionality is achieved without


[Files]
Source: {#FGDDir}\*; DestDir: {app}; Components: fgds; Flags: recursesubdirs createallsubdirs 
Source: {#PrefabsDir}\*; DestDir: {app}; Components: prefabs; Flags: recursesubdirs createallsubdirs
Source: {#VPKsDir}\*; DestDir: {app}; Components: vpks; Flags: recursesubdirs createallsubdirs ignoreversion
Source: {#VMFsDir}\*; DestDir: {app}; Components: vmfs; Flags: recursesubdirs createallsubdirs ignoreversion
Source: {#GamemodesDir}\*; DestDir: {app}; Components: gamemodes; Flags: recursesubdirs createallsubdirs ignoreversion
Source: {#BAMFDir}\LICENSE.txt; DestDir: {app}\BAMF_LICENSE.txt; Flags: ignoreversion replacesameversion 
; change this to a readme.txt file. .md has no default application in windows, so this will not work
Source: {#BAMFDir}\README.md; DestDir: {app}\BAMF_README.md; Flags: ignoreversion replacesameversion isreadme 


[Icons]

[Messages]


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
