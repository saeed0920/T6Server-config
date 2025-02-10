function Init()

    -- Allocate menu
    menu = UI.MenuOverlay.new("menu_online_barracks")
	
    -- Add menu buttons
	Menu_Seperator(menu, 8)
    Menu_AddButton(menu, 8, "UNLOCK ALL", function(menu,button) Game.OpenMenu("plutonium_unlockall_warning") Game.PlaySound("consider_prestige") end)
    Menu_AddButton(menu, 9, "CUSTOMISE STATS", function(menu,button) Game.OpenMenu("plutonium_customise_stats") end)

end
