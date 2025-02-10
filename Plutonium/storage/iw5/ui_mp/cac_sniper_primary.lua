function Init()

    -- Allocate menu
    menu = UI.MenuOverlay.new("cac_sniper_primary")
	
    -- Add menu buttons
	Menu_Seperator(menu, 6)
    CAC_Primary_Sniper(menu, 6, "iw5_cheytac", "@WEAPON_CHEYTAC")

end
