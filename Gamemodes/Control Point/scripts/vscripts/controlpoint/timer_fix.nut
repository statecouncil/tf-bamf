// Negative Time Fix (version 1.0)
// by Sarexicus, for CP_Sulfur
// Published with permission as part of BAMF

// INFO: Adding negative time can bypass the win condition on a KoTH map.
// This should bypass that by reading the timer value directly.
// This also fixes BLU being able to contest their own control point victory.

::BluWon <- false;
::WinBlu <- function () { EntFire("blue_time_end", "roundwin", null, 0, null); }

::BluFinalCheck <- function ()
{
	local dOwner = Entities.FindByName(null, "cp_main").GetTeam();
	if(dOwner != Constants.ETFTeam.TF_TEAM_BLUE) return false;
	
	local dCapPercent = NetProps.GetPropFloatArray(Entities.FindByClassname(null, "tf_objective_resource"), "m_flCapPercentages", 3);
	return (dCapPercent <= 0.0);
}

::TimerCheck <- function()
{
	if(!BluFinalCheck()) return;
	
	local timer = Entities.FindByName(null, "zz_blue_koth_timer");
	local isPaused = NetProps.GetPropBool(timer, "m_bTimerPaused");
	
	if(!isPaused)
	{
		EntFireByHandle(timer, "Pause", "", 0, null, null)
	}
	
	EntFireByHandle(timer, "RunScriptCode", "TimerCheck2(" + isPaused.tostring() + ")", 0.05, null, null);
}

::TimerCheck2 <- function(isPaused)
{
	local timeLeft = NetProps.GetPropFloat(self, "m_flTimeRemaining");
	
	if(timeLeft <= 0.0) {
		WinBlu();
	}
	
	if(!isPaused) {
		EntFireByHandle(self, "Resume", "", 0, null, null);
	}
}

function Think() {
	local gamerules = Entities.FindByClassname(null, "tf_gamerules");
	
	if(!BluWon && NetProps.GetPropBool(gamerules, "m_bInOvertime") && BluFinalCheck()) {
		WinBlu();
		BluWon = true;
	}
	
	return 0.25;
}

local ent = null;
while(ent = Entities.FindByClassname(ent, "trigger_capture_area"))
{
	EntityOutputs.AddOutput(ent, "OnCapTeam1", "!self", "RunScriptCode", "TimerCheck()", 0.1, -1);
	EntityOutputs.AddOutput(ent, "OnCapTeam2", "!self", "RunScriptCode", "TimerCheck()", 0.1, -1);
}