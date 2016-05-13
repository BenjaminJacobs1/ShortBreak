local Plugin = Plugin

function Plugin:Initialise()
	Shine.VoteMenu:EditPage( "Main", function( self )
	self:AddSideButton( "Short Break", function()
		Plugin:SendNetworkMessage( "ITakeAShortBreak", { }, true )
		self:SetIsVisible( false )
		end )
	end )
    return true
end

