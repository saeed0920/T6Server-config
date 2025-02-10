function Init()

    -- Define buttons
    buttonoptions = {}
    height = 0

    for i=1,10 do 
        buttonoptions[i] = {
            function(menu) 
                Game.SetPlayerData("prestige " .. (i+10))
                Game.PlaySound("enter_prestige")
                Game.CloseMenu("plutonium_customise_stats_prestige2")
                Game.OpenMenu("plutonium_customise_stats")
            end,
            ("PRESTIGE " .. (i+10))
        }
        height = height + 28
    end

    buttonoptions[11] = {
        nil,
        nil
    }

    buttonoptions[12] = {
        nil,
        nil
    }

    buttonoptions[13] = {
        function(menu) 
            Game.CloseMenu("plutonium_customise_stats_prestige2")
            Game.OpenMenu("plutonium_customise_stats_prestige1")
        end,
        "BACK"
    }
    height = height + 84

    -- Allocate popup
	menu = Popup_Create_Advanced("plutonium_customise_stats_prestige2", "Choose your prestige", 400, height,
        function(menu)          -- onopen
            Game.PlaySound("tabs_slide")
        end,                    
        function(menu)          -- onclose
            Game.CloseMenu("plutonium_customise_stats_prestige2")
            Game.OpenMenu("plutonium_customise_stats_prestige1")
        end,
        buttonoptions           -- buttonoptions
    )

    -- Text
    warning = UI.Item.new()
    warning:SetType(UI.ItemType.Text)
    warning:SetRect(-195, -135, 400, height, 2, 2)
    warning:SetText("Select the prestige you want 0-20.")
    warning:SetFont(UI.Fonts.BigFont)
    warning:SetTextScale(0.375)
    menu:AddItem(warning)

end