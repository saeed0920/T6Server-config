function Init()

    -- Allocate menu
    menu = UI.MenuOverlay.new("class")
	
    -- Add menu buttons
    Menu_AddButton(menu, 4, "FRIENDS", function(menu,button) Game.OpenMenu("plutonium_friends") end)

end
