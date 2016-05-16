local Plugin = Plugin

local Shine = Shine
local GetOwner = Server.GetOwner
local timersShortbreak={}

function Plugin:ReceiveITakeAShortBreak( Client, Data )
		local uniqueID=string.format("shortBreak_reset_count%d",Client:GetUserId())
		--Print("checking timer %s, ",uniqueID)
		if not Shine.Timer.Exists( uniqueID ) then

			local Data = Plugin.Users[ Client ]
			if not Data then return end
			Data.IsShortBreak=true
			
			local Gamerules = GetGamerules()
			if not Gamerules then return end
			local Player = Client:GetControllingPlayer()
			if Player then
				Gamerules:JoinTeam( Player, kSpectatorIndex, nil, true )
			end
			
			Shine:NotifyColour( Client, 0, 255, 0, "you can now take a break of maximum 5 mins")
			timersShortbreak[uniqueID]=290
			Shine.Timer.Create( uniqueID, 10, 30, function( Timer )
				Shine:NotifyColour( Client, 0, 255, 0, string.format("Remaining short break time: %d seconds", timersShortbreak[uniqueID]))
				timersShortbreak[uniqueID]=timersShortbreak[uniqueID]-10
				self:ResetAFKTime( Client )
				if(timersShortbreak[uniqueID] == 0) then
					Data.IsShortBreak=false
				end
			end )
		end
end


function Plugin:PostJoinTeam( Gamerules, Player, OldTeam, NewTeam, Force, ShineForce )
	--kSpectatorIndex
	--if(NewTeam == kTeam1Index or NewTeam == kTeam2Index or NewTeam == kTeamReadyRoom) then
	local Client = Player:GetClient()
		local uniqueID=string.format("shortBreak_reset_count%d",Client:GetUserId())
		if(Shine.Timer.Exists( uniqueID )) then
			Shine.Timer.Destroy( uniqueID )
			Shine:NotifyColour( Client, 0, 255, 0, "Short Break end")
			local Data = Plugin.Users[ Client ]
			if not Data then return end
			Data.IsShortBreak=false
		end
	--end
end

do
	local OldFunc

	local function GetName( self )
		return "AFK - "..OldFunc( self )
	end
	
	local function GetNameBreak( self )
		return "ShortBreak- "..OldFunc( self )
	end

	function Plugin:PrePlayerInfoUpdate( PlayerInfo, Player )
		OldFunc = Player.GetName

		local Client = GetOwner( Player )
		local Data = self.Users[ Client ]
		if not Data then return end

		if Data.IsAFK then
			Player.GetName = GetName
			return
		end
		
		if Data.IsShortBreak then
			Player.GetName = GetNameBreak
		end
		
		end

	--[[No need to override that one?!
	function Plugin:PostPlayerInfoUpdate( PlayerInfo, Player )
		Player.GetName = OldFunc

		OldFunc = nil
		end
	--]]
	
end

