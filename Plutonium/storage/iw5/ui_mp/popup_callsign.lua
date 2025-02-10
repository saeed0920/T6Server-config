function Init()

    -- Allocate menu
    menu = UI.MenuOverlay.new("popup_callsign")
	
    -- Add menu buttons
	Menu_Seperator(menu, 4)
    Menu_AddButton(menu, 4, "USE FORUM AVATAR", 
    function(menu,button) 
        Game.SetPlayerData("cardIcon 0") 
        Game.ExecuteCommand("upload_playercard")
        Game.ExecuteCommand("updateGamerProfile")
        Game.ExecuteCommand("uploadStats")
    end)


end
