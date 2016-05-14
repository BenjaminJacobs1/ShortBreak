local Plugin = {}

if Server then
	Plugin.Conflicts = {
		DisableThem = { },
		DisableUs = { "afkkick" }
	}


    Shine:RegisterExtension( "shortbreak", Plugin, 
	{ 
	Base = "afkkick",
	BlacklistKeys = {
        PrePlayerInfoUpdate = true,
		--PostPlayerInfoUpdate = true
    }
	} )
	
else
    Shine:RegisterExtension( "shortbreak", Plugin )
end

function Plugin:SetupDataTable()
	self:AddNetworkMessage( "ITakeAShortBreak", {}, "Server" )
end
