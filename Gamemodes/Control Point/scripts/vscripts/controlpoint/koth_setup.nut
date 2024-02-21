// KotH Setup Time (version 1.2)
// by Sarexicus, for CP_Sulfur

local gamerules = Entities.FindByClassname(null, "tf_gamerules");

function Precache()
{
	NetProps.SetPropBool(gamerules, "m_bPlayingKoth", false);
	NetProps.SetPropBool(gamerules, "m_bInSetup", true);
}

function SetupEnd()
{
	NetProps.SetPropBool(gamerules, "m_bInSetup", false);
	NetProps.SetPropBool(gamerules, "m_bPlayingKoth", true);
}