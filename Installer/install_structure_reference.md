Follow instructions on https://bamf.tf/pack/install.html or compare with contents of docs/installation.html

Do NOT include "installer" and "docs" directories and dotfiles!

All other directories (*entire* directories, not just content!) to be placed at a user-decided location. Default: Team Fortress 2/tf_bamf/...



# INSTALL PAGES

##########################################################################

**Page 1** - INTRODUCTION

## Brokk's Assorted Mapping Fixes
### A TF2 Mapping Starter Pack of the modern era

[picture of Merasmus here]

Merasmus will guide you through the installation process.
For a full list of modules and their purpose, click here. [https://bamf.tf/pack/features.html]

Attention: Some features of this mapping pack will require Hammer++ (https://bamf.tf/tools/hammer++.html) and CompilePal (https://bamf.tf/tools/compilepal.html) to be installed BEFORE running this installer. Installing them after this pack has been installed will overwrite certain files and may cause errors.

**FEATURES**

More dev materials!
More entities in hammer!
All entities have icons and detailed documentation in the entity window!
Better water material previews!
Better and more complete FGD!
Prefabs of all gamemodes!
Logic prefabs!
Gameplay prefabs!
Asset prefabs!
All publicly available Valve VMFs and decompiles!
Improved CompilePal error parser (WIP)!
Propper included and set up!
RadShadowMan included and set up!

**CREDITS**

[shortlist of _all_ creators here: https://bamf.tf/pack/credits.html]

Welcome, information, warnings, credits, license, etc.


<NEXT> <CANCEL>

##########################################################################

**Page 2** - LICENSE

blablabla license.txt


<BACK> <I HAVE READ AND UNDERSTOOD THE LICENSE> <CANCEL>

##########################################################################

**Page 3** - FEATURE SELECTION (checkboxes)

1 [x] - **Hammer Stuff**  
	a [x] - FGD
			desc: The most complete and thorough FGD currently available for TF2.
			files: Everything in FGD/ >>>except<<< FGD/x64/
			target: Team Fortress 2/bin/

	b [ ] - "Expert Compile" sequences for Propper and Radshadowman in Hammer++
			desc: Adds compile pre-sets into Hammer++' "Expert Compile" window that run Propper or Radshadowman. Warning: Overwrites any other custom compile sequences you may have set up in Hammer++!
			files: Only the file FGD/x64/hammerplusplus/hammerplusplus_sequences.cfg
			target: Team Fortress 2/bin/x64/hammerplusplus/

	c [ ] - Advanced CompilePal sequences
			desc: Adds several useful compile pre-sets to your CompilePal installation.
			files: Everything in Compile Configs/Compilepal/
			target: Compile Pal XXX.X/

	d [ ] - Improved CompilePal error parser
			desc: Replaces Interlopers.net's default compile error checker with a hand-made custom parser. Better error explanations, designed for TF2.
			files:
			target:

2 [ ] - **Tools**
	a [ ] - Radshadowman
			desc: Automatically creates a .rad file to force texture shadows on props. Works as a precompiler, so run as a step before your normal compile
			files: Everything in Tools/Radshadowman/
			target: Team Fortress 2/bin/

	b [ ] - Propper
			desc: The community's solution to TF2's outrageously low brush limits. Allows you to turn brushwork into models.
			files: Everything in Tools/Propper
			target: Team Fortress 2/bin/

3 [ ] - **Assets**  
	a [x] - FGD Assets (VPK)
			desc: Entity icons, better player spawn models.
			files: Only the file VPKs/BAMF FGD Assets.vpk
			target: Team Fortress 2/tf/custom/

	b [x] - Material Tag and Preview Overhaul (VPK)
			desc: Vast overhaul of stock material tags, material blend previews, water previews.
			files: Only the file VPKs/BAMF Material Tag Overhaul.vpk
			target: Team Fortress 2/tf/custom/

	c [ ] - Extra Materials (Loose Files)
			desc: Contains various additional dev materials for use in blocking out a new project.
			files: Everything in VPKs/BAMF Extra Materials/
			target: Team Fortress 2/tf/custom/BAMF Extra Materials/

4 [x] - **Prefabs**
			desc: Large amount of ready-made prefabs to be used during alpha development of your map. Soundscapes, pickups, common gameplay and map elements, logic, lighting, and more.
			files: Everything in Prefabs/
			target: Team Fortress 2/bin/Prefabs/

5 [x] - **Gamemode Prefabs**
			desc: (Almost) complete pack of prefabs used in official TF2 maps.
			files: Everything in Gamemodes/
			target: (see 5-3: mapsrc/Gamemodes/)

6 [ ] - **Example VMFs**
	a [x] - Decompiled Valve Maps
			desc: Decompiled versions of all Valve-made and Valve-owned maps shipped in TF2, decompiled with the latest version of bspsrc.
			files: Everything in VMFs/Decompiled Valve Maps/
			target: (see 5-3: mapsrc/Decompiled Valve Maps/)

	b [x] - Source SDK 2013 VMFs and artpass_valvebase
			desc: Valve-published VMFs of certain TF2 maps, as found in the Source SDK 2013 Multiplayer.
			files: Everything in VMFs/Source SDK 2013/ >>>AND<<< VMFs/artpass_valvebase
			target: (see 5-3: mapsrc/Valve Releases/)

	c [ ] - Community Map VMFs
			desc: Select VMFs of community-owned maps shipped in TF2 whose creators volunteered to contribute to this pack.
			files: Everything in VMFs/Community Maps/
			target: (see 5-3: mapsrc/Community Maps/)


##########################################################################

ONLY if 1a was selected: **Page 4** - CONFIGURE FGD

The FGD fit for a LORD features some customization options. You may change these manually by opening Team Fortress 2/bin/tf-bamf.fgd in a text editor or by running this installer again. The default settings are intended to be as close to A Boojum Snark's FGD as possible.

LINE DIVIDERS (radio buttons)
1 (x) - **No Dividers in Entity Window
2 ( ) - **Line Dividers in Entity Window**
3 ( ) - **Blank Dividers in Entity Window**

INFO_PLAYER_TEAMSPAWN APPEARANCE (radio buttons)
Radio buttons:
1 ( ) - **Default "Cordon Freeman" spawn point model
1 (x) - **A Boojum Snark's Dev Engineer spawn point model
1 ( ) - **Puddy's Dev Engineer spawn point model

##########################################################################

**Page 5** - DIRECTORY SELECTION

1- Always:
Find/select location of "Team Fortress 2/tf/gameinfo.txt"
Or find some other method of setting TF2 installation path

2- If 1c or 1d was selected:
Find location of "CompilePal via registry entry or ask for manual path

3 - If any of 5 or 6 were selected:
Select location where VMFs should be saved ("mapsrc") -> ask for manual path, default should be set as Team Fortress 2/mapsrc/

##########################################################################

**Page 6** - FINISHED

Installation successful! Merasmus will now return to his castle. [picture of racoon here]

##########################################################################