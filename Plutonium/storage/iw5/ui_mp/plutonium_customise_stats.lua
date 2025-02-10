function Init()

    -- Define buttons
    buttonoptions = {}

    buttonoptions[1] = {
        function(menu) 
            Game.CloseMenu("plutonium_customise_stats")
            Game.OpenMenu("plutonium_customise_stats_prestige1")
        end,
        "PRESTIGE"
    }

    buttonoptions[2] = {
        function(menu) 
            Game.CloseMenu("plutonium_customise_stats")
            Game.OpenMenu("plutonium_customise_stats_prestigetokens")
        end,
        "PRESTIGE TOKENS"
    }

    buttonoptions[3] = {
        function(menu)
            Game.CloseMenu("plutonium_customise_stats")
            Game.OpenMenu("reset_stats1")
        end,
        "RESET STATS"
    }

    buttonoptions[4] = {
        function(menu) 
            Game.CloseMenu("plutonium_customise_stats")
        end,
        "CANCEL"
    }

    -- Allocate popup
	menu = Popup_Create_Advanced("plutonium_customise_stats", "What stat do you wish to modify?", 400, 180,
        function(menu)          -- onopen
            Game.PlaySound("tabs_slide")
        end,                    
        function(menu)          -- onclose
            Game.CloseMenu("plutonium_customise_stats")
        end,
        buttonoptions           -- buttonoptions
    )

    -- Text
    warning = UI.Item.new()
    warning:SetType(UI.ItemType.Text)
    warning:SetRect(-195, -45, 400, 150, 2, 2)
    warning:SetText("Customise your stats to your liking, other players will see your new\nstats in game.")
    warning:SetFont(UI.Fonts.BigFont)
    warning:SetTextScale(0.375)
    menu:AddItem(warning)

end