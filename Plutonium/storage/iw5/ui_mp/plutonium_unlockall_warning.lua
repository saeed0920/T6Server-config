function Init()

    -- Allocate popup
	menu = Popup_Create("plutonium_unlockall_warning", "UNLOCK IT ALL?", 400, 200,
        function(menu)          -- onopen
            Game.PlaySound("tabs_slide")
        end,                    
        function(menu)          -- onclose
            Game.CloseMenu("plutonium_unlockall_warning")
            Game.PlaySound("exit_prestige")
        end,
        function(menu, item)    -- accept
            Game.CloseMenu("plutonium_unlockall_warning")
            Game.PlaySound("mp_level_up")
            Game.ExecuteCommand("unlockall")
        end,    
        function(menu, item)    -- cancel
            Game.CloseMenu("plutonium_unlockall_warning")
            Game.PlaySound("exit_prestige")
        end,
        false
    )

    -- Text
    warning = UI.Item.new()
    warning:SetType(UI.ItemType.Text)
    warning:SetRect(-195, -55, 400, 200, 2, 2)
    warning:SetText("Want to experience the fun without the grind?\nThen Unlock All is for you, all Titles, Emblems, and Challenges will be\nunlocked.\n\nIn addition you will have all weapon levels maxed, Prestige set to 20,\nyour level set to 80, and given 1337 Prestige Tokens.")
    warning:SetFont(UI.Fonts.BigFont)
    warning:SetTextScale(0.375)
    menu:AddItem(warning)

end
