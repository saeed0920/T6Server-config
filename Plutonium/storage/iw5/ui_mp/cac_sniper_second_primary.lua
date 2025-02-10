function Init()

    -- Allocate menu
    menu = UI.MenuOverlay.new("cac_sniper_second_primary")
	
    -- Add menu buttons
	Menu_Seperator(menu, 6)
    CAC_Secondary_Sniper(menu, 6, "iw5_cheytac", "@WEAPON_CHEYTAC")

end
