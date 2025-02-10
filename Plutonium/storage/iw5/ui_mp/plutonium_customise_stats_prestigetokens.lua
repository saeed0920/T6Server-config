function Init()

    -- Define buttons
    buttonoptions = {}

    buttonoptions[1] = {
        function(menu) 
            Game.SetPlayerData("prestigeShopTokens " .. 1000)
            Game.PlaySound("mp_ingame_summary")
            Game.CloseMenu("plutonium_customise_stats_prestigetokens")
            Game.OpenMenu("plutonium_customise_stats")
        end,
        "1,000 Tokens"
    }

    buttonoptions[2] = {
        function(menu) 
            Game.SetPlayerData("prestigeShopTokens " .. 100)
            Game.PlaySound("mp_ingame_summary")
            Game.CloseMenu("plutonium_customise_stats_prestigetokens")
            Game.OpenMenu("plutonium_customise_stats")
        end,
        "100 Tokens"
    }

    buttonoptions[3] = {
        function(menu) 
            Game.SetPlayerData("prestigeShopTokens " .. 10)
            Game.PlaySound("mp_ingame_summary")
            Game.CloseMenu("plutonium_customise_stats_prestigetokens")
            Game.OpenMenu("plutonium_customise_stats")
        end,
        "10 Tokens"
    }

    buttonoptions[4] = {
        function(menu) 
            Game.CloseMenu("plutonium_customise_stats_prestigetokens")
            Game.OpenMenu("plutonium_customise_stats")
        end,
        "BACK"
    }


    -- Allocate popup
	menu = Popup_Create_Advanced("plutonium_customise_stats_prestigetokens", "Choose your tokens", 400, 200,
        function(menu)          -- onopen
            Game.PlaySound("tabs_slide")
        end,                    
        function(menu)          -- onclose
            Game.CloseMenu("plutonium_customise_stats_prestigetokens")
            Game.OpenMenu("plutonium_customise_stats")
        end,
        buttonoptions           -- buttonoptions
    )

    -- Text
    warning = UI.Item.new()
    warning:SetType(UI.ItemType.Text)
    warning:SetRect(-195, -55, 400, 150, 2, 2)
    warning:SetText("Select the amount of Prestige Tokens you want. Please be aware that\nsetting a value that is less than your current token count will result in\nthe UI count not updating until you spend a token.")
    warning:SetFont(UI.Fonts.BigFont)
    warning:SetTextScale(0.375)
    menu:AddItem(warning)

end