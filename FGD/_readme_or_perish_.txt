----- AN FGD FIT FOR A LORD -----//
		VERSION 7
		Last updated xxth xxxxx 20xx

	// INTRODUCTION //
	
THIS IS A WORK IN PROGRESS, USE AT YOUR OWN PERIL. It is your responsibility as a mapper to back up your maps regularly. To the best of my ability I've ruled out any issues with this FGD and pre-existing VMFs, but you know how it is.

This is a further updated version of Da Spud Lord's FGD, which in my opinion is the best publicly available custom TF2 FGD right now. It has last been updated in 2021 though, which means it is missing some of the changes that have since been done to live TF2, like the fixed CP Timer entity or the new func_monitor. I've also cleaned up some things here and there and tried to further improve the quality of this FGD, as it is definitely not a finished product (but the stock one isn't, either, ha). Also I'm leaving most of Spud Lord's and ficool's comments in here because they're frankly pretty amusing. (My own comments are signed with "-Brokk", the rest are Spud's)

If you have further improvement suggestions, feedback, praise, or want to scream at me for breaking your map, please contact me via Discord (@.kas), TF2Maps (tf2maps.net/members/brokkhouse.36841/), or Steam (steamcommunity.com/id/brokkhouse/) Happy mapping!
 -Brokk


	// CREDITS //
	
This version of this FGD is by Brokk, based on work done by Da Spud Lord, based on work done by ficool2
Engineer spawnpoint model and some icons created by A Boojum Snark (not included; see installation instructions)
Engineer spawnpoint model by Puddy (also not included)


	// INSTALLATION //

PLEASE FULLY READ THE FOLLOWING STEPS AND FOLLOW THEM PRIOR TO USING THIS FGD.

0. (OPTIONAL) Download Hammer++ from here:

https://ficool2.github.io/HammerPlusPlus-Website. This is not technically required to use this FGD, but will make your life easier. It /is/ required for editor_text and some other entities to be displayed correctly.

1. Download and install A Boojum Snark's Ultimate Mapping Resource Pack from here:

tf2maps.net/downloads/ultimate-mapping-resource-pack.510/. This FGD references a number of resources from ABS' pack, and in general the pack will greatly improve your TF2 mapping experience by adding missing tags to materials and giving you a better overview of blend textures. If you already have that pack installed, skip this step. Do NOT use ABS' FGD (tf-abs.fgd).

2. Copy the content of the "Team Fortress 2-bin" folder to your "Team Fortress 2/bin" folder.

The "Team Fortress 2" folder can be located by right-clicking on Team Fortress 2 in your Steam Library and selecting Properties > Local Files > Browse Local Files. If you are not using the Team Fortress 2 Hammer, best copy this FGD file to whichever folder the version of Hammer you are using is located. By default, the file paths should be "Team Fortress 2/bin/tf-brokk.fgd" and "Team Fortress 2/bin/spudlord-settings".

3. Copy the included VPK file (brokktools.vpk) to your /Team Fortress 2/tf/custom folder (or into the custom folder of the game/mod you are mapping for).

This contains various entity icons used by this FGD to help you see what your map logic is doing.

4. Launch/restart Hammer. Go to Tools > Options > Configurations. Under Game Data files, remove ALL OTHER files. Then use the Add button and the file browser popup to find and select this FGD file. (The other files do not need to be selected and will be included automatically.) Select "Ok" before exiting your Hammer options, and restart Hammer. The FGD is now fully installed.

5. (OPTIONAL) Navigate to your Team Fortress 2 installation and to the /bin/ folder and open tf-brokk.fgd. Follow the instructions at the top to fine-tune your experience in using this FGD.


	// CHANGELOG //

V7:
-made FGD independent of ABS
-set prop_dynamic "Disable Bone Followers" flag to TRUE by default, as this is a common cause for performance issues
-added warning to not parent things to each other in the Parent KV (thanks Pdan)
-added delay warning for logic_timer (thanks Pdan)
--removed delay warning for logic_timer again because Pdan was talking shit (thanks Mr. Burguers)

V6:
-updated logic_script entity icon
-info_particle_system now starts enabled (start_active = 1)
-fixed default teamspawn model settings
-added SetModel, SetCycle, and SetPlayBackRate inputs for all dynamic model entities that support them (spell pickups, teamflags, prop_dynamics, etc.) These only work in TF2.
-added clarification to func_nav_avoid regarding the use of tags. Thanks to Elizabeth!
-Added target keyvalue (entity to point at) to all light entities with angles, so you can aim them that way. Let me know if this breaks anything.
-added placement helpers to path_track, similar to cubemaps

V5:
-new setting: pick your favorite spawnpoint model (also changes wherever else playermodels are required, like teleporter destinations)
-changed some default settings to make the FGD more unotrusive
-changed func_illusionary rendermode back to normal (sorry, dumb idea)
-added vscript support to all entities that support Targetnames
-changed func_respawnroomvisualizer rendermode to Color by default to fix render order issues
-minor wording changes throughout

	
V4:
-added func_monitor, point_camera, skybox_swapper, tf_ammo_pack entities
-fixed tf_logic_cp_timer
-added missing func_nobuild keyvalues
-added option for certain point entities to not use a helper model but only their helper sprite (useful for organizing info_targets)
-added option to use the Dev Engineer of your choice, only works if you have the specific pack installed
-fixed many, many typos and minor errors
-probably some more minor QOL stuff
-added a note to Preserved entities warning mappers about what that means
-added propper support by default and fixed the default filepaths to be less annoying
-catalogued base entities and re-sorted some things
-removed the _hardfalloff and _distance keyvalues from all Light entities, as they simply do not work. Use Half Falloff and Complete Falloff instead (or set your lights via brightness and falloff type like a sane person).
-removed func_gameplay

TODO-BROKK: The new func_croc and trigger_hurt keyvalues, as soon as I know what the hell they are
TODO-BROKK: Sort the myriad of TODOs that are all over this document and see if I actually want to address any of them (Last count: 156 open questions to investigate, fuck me)
TODO-BROKK: Consider TeamSpen's HammerAddons support (that's a lot of work)