; Not exactly stolen, but strongly inspired by Greenshot: https://github.com/greenshot/greenshot/blob/release/1.3/installer/innosetup/setup.iss

#define MyAppName "BAMF Installer"
#define MyAppVersion "0.4"
#define MyAppPublisher "Brokk"
#define MyAppURL "https://bamf.tf/"
#define MyAppRepoURL "https://github.com/statecouncil/tf-bamf"
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

[Types]
Name: "default"; Description: "{cm:default}"
Name: "full"; Description: "{code:FullInstall}"
Name: "basic"; Description: "{code:BasicInstall}"
Name: "custom"; Description: "{code:CustomInstall}"; Flags: iscustom

[Components]
Name: "greenshot"; Description: "TF-BAMF"; Types: default full bamf-only custom; Flags: fixed
Name: "components\FGDs"; Description: "FGDs"; Types: full custom; Flags: disablenouninstallwarning
Name: "components\Prefabs"; Description: "Prefabs"; Types: full custom; Flags: disablenouninstallwarning
Name: "components\VPKs"; Description: "VPKs"; Types: full custom; Flags: disablenouninstallwarning
Name: "components\VMFs"; Description: "VMFs"; Types: full custom; Flags: disablenouninstallwarning
Name: "components\Gamemodes"; Description: "Gamemodes"; Types: full custom; Flags: disablenouninstallwarning

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



[Code]
function FullInstall(Param : String) : String;
begin
	result := SetupMessage(msgFullInstallation);
end;

function CustomInstall(Param : String) : String;
begin
	result := SetupMessage(msgCustomInstallation);
end;

function BasicInstall(Param : String) : String;
begin
	result := SetupMessage(msgBasicInstallation);
end;
