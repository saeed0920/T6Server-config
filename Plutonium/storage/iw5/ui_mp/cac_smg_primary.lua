function Init()

    -- Allocate menu
    menu = UI.MenuOverlay.new("cac_smg_primary")
	
    -- Add menu buttons
	Menu_Seperator(menu, 6)
    CAC_Primary_SMG(menu, 6, "iw5_ak74u", "@WEAPON_AK74U")

end
