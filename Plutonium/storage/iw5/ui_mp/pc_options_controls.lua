function Init()

    -- Allocate menu
    menu = UI.MenuOverlay.new("pc_options_controls")
    
    Menu_AddButton_RightPanel(menu, 5, "CONTROLLER", function(menu,button) Game.OpenMenu("plutonium_controller_controls") Game.CloseMenu("pc_options_controls_ingame") end, nil, nil, nil)

end
