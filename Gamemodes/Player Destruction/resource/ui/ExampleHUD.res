#base "HudObjectivePlayerDestruction.res"

"Resource/UI/ExampleHUD.res"
{
	"CarriedContainer"
	{
		"CarriedImage"
		{
			"image"				"../hud/hud_icon_item"
		}
		"TeamLeaderImage"
		{
			//"image"			"<your image name>"
		}
	}
	"CountdownContainer"
	{
		"Background"
		{
			"image"				"../hud/hud_greenbg"
			"teambg_2"			"../hud/hud_greenbg"
			"teambg_3"			"../hud/hud_greenbg"
		}
		"CountdownImage"
		{
			"xpos"				"117"
			"ypos"				"15"
		}
	}
	"ScoreContainer"
	{
		"ProgressBarContainer"
		{
			"FlagImageBlue"
			{
					"image"		"../hud/hud_icon_item"
					"zpos"		"100"
			}
			"FlagImageRed"
			{
					"image"		"../hud/hud_icon_item"
					"zpos"		"100"
			}
		}
	}
}