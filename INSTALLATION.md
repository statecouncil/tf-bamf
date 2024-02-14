> This is a temporary installation and usage guide until the automated installer is a thing.

# Installation

Click **Releases** on the right to download the whole pack, unzip it, then follow the steps below, depending on which parts you want to install.

Each module can be installed individually, unless otherwise noted.

## VMFs

1. Drag the VMFs anywhere you want. Hammer can read them from anywhere.

Note that the maps in the `Community Maps` directory will feature ERROR models and textures. If you don't want to see those, you will need to download the asset packs separately from the respective authors. Assets and VMFs are owned by their creators.

## Prefabs

1. Drag the content of the `Prefabs` directory into `Team Fortress 2/bin/Prefabs`.
2. In Hammer, select the **Entity Tool**.
3. Select the category of prefab you want to place in the **Categories** dropdown menu in the bottom right.
4. Select the prefab you want to place in the **Objects** dropdown menu just below.
5. Place the prefab by clicking into the 3D Viewport, just like you would when placing a point entity. Move and rotate as usual.

All prefabs are grouped to make placement easier. Stay in Group Select mode to move the whole thing at once and press **CTRL+B** to align to the grid.

## VPKs

There are currently both VPKs and loose folders in the `VPKs` directory. **You only need to install one of each**. Both are included as Compilepal currently cannot automatically pack VPKs. This can be used to stop it from packing things you may not want in your map, like your HUD or Hammer-only replacement materials.

The VPKs or Folders should be pasted into `Team Fortress 2/tf/custom`.

See `README.md` as well as their respective readme files for information on what they contain.

**I recommend that you use the VPK version of each pack EXCEPT the Extra Assets pack, which is intended to be packed into the map.**

## FGD, Radshadowman and Propper support

*Requires `VPKs/BAMF FGD Assets`.*

1. Paste the content of the `FGD` directory into `Team Fortress 2/bin`. Do NOT paste it into `Team Fortress 2/tf/bin`.
2. In Hammer, open *Tools -> Options...*, remove the existing Game Configurations, then add `tf-brokk.fgd` as the only new one.
3. *(Optional)* Open `Team Fortress 2/tf/bin/tf-bamf.fgd` in the text editor of your choice and adjust the options at the start of the document. This should not be necessary for most users.

See `FGD/radshadowman/RadShadowMan_readme.txt` for more information on how to enable textureshadows on all static props.

## Coming soon: Compilepal presets
