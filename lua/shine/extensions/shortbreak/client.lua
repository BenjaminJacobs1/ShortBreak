local Plugin = Plugin

function Plugin:Initialise()

	Shine.VoteMenu:AddPage( "ShortBreakPage", function( self )
		Shine.VoteMenu:AddTopButton( "confirm&join readyroom", nil )
		
		self:AddSideButton( "Yes, I take a break", function()
		Plugin:SendNetworkMessage( "ITakeAShortBreak", { }, true )
		self:SetIsVisible( false )
		end )
		
		self:AddSideButton( "No", function()
		self:SetPage( "Main" )
		end )
	end )

	Shine.VoteMenu:EditPage( "Main", function( self )
			self:AddSideButton( "Short Break", function()
			self:SetPage( "ShortBreakPage" )
			end )
		end )
    return true
end

