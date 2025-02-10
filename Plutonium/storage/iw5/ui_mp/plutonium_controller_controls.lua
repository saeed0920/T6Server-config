function Init()

    -- Allocate main controller menu
    controlsmenu = UI.Menu.new("plutonium_controller_controls")
    controlsmenu:OnOpen(
        function()
            -- Toggle background material based on game state
            if (Game.GetDvarBool("cl_ingame") == true) then
                controlsbackground:SetMaterial("")
                buttonsbackground:SetMaterial("")
                sticksbackground:SetMaterial("")
                controlsbackgroundfill:SetBackColor(0, 0, 0, 0.2)
                buttonsbackgroundfill:SetBackColor(0, 0, 0, 0.2)
                sticksbackgroundfill:SetBackColor(0, 0, 0, 0.2)
            else
                controlsbackground:SetMaterial("background_image_blur_less")
                buttonsbackground:SetMaterial("background_image_blur_less")
                sticksbackground:SetMaterial("background_image_blur_less")
                controlsbackgroundfill:SetBackColor(0, 0, 0, 0)
                buttonsbackgroundfill:SetBackColor(0, 0, 0, 0)
                sticksbackgroundfill:SetBackColor(0, 0, 0, 0)
            end

            SetEnableAimAssist(enableaimassist, nil, true)
        end
    )
    controlsmenu:OnEsc(
        function(menu)
            Game.OpenMenu("pc_options_controls_ingame")
            Game.CloseMenu("plutonium_controller_controls")
        end
    )

    -- Create background item
    controlsbackground = UI.Item.new()
    controlsbackground:SetRect(0, 0, 640, 480, 4, 4)
    controlsbackground:SetType(UI.ItemType.Image)
    controlsbackground:SetMaterial("background_image_blur_less")
    controlsmenu:AddItem(controlsbackground)

    -- Alt background for ingame
    controlsbackgroundfill = UI.Item.new()
    controlsbackgroundfill:SetRect(0, 0, 640, 480, 4, 4)
    controlsbackgroundfill:SetType(UI.ItemType.Rectangle)
    controlsbackgroundfill:SetBackColor(0, 0, 0, 0)
    controlsmenu:AddItem(controlsbackgroundfill)

	-- Sidebar background
	controlssidebar = UI.Item.new()
	controlssidebar:SetRect(-64, 0, 300, 480, 1, 0)
	controlssidebar:SetType(UI.ItemType.Rectangle)
	controlssidebar:SetBackColor(0, 0, 0, 0.3)
	controlsmenu:AddItem(controlssidebar)
	
    -- Create Header Text
    controlsheader = UI.Item.new()
	controlsheader:SetRect(30, 30, 206, 37, 1, 1)
    controlsheader:SetType(UI.ItemType.Text)

    controlsheader:SetFont(UI.Fonts.HudBigFont)
    controlsheader:SetTextScale(0.4)

    controlsheader:SetText("CONTROLLER OPTIONS")
    controlsmenu:AddItem(controlsheader)

    -- Create vertical seperator
    controlsvsep = UI.Item.new()
    controlsvsep:SetRect(237, 0, 10, 480, 1, 0)
    controlsvsep:SetType(UI.ItemType.Image)
    controlsvsep:SetMaterial("navbar_edge")
    controlsmenu:AddItem(controlsvsep)
	
    -- Add menu buttons
    Menu_Seperator(controlsmenu, 0)
    Menu_AddButton(controlsmenu, 0, "ENABLED GAMEPAD", 
        function(menu,button) 
            SetEnableGamepad(enablegamepad)
        end
    )   

    Menu_AddButton(controlsmenu, 1, "BUTTON LAYOUT", 
        function(menu,button) 
            Game.OpenMenu("plutonium_controller_controls_buttons")
            Game.CloseMenu("plutonium_controller_controls")
        end
    )
    
    Menu_AddButton(controlsmenu, 2, "STICK LAYOUT", 
        function(menu,button)
            Game.OpenMenu("plutonium_controller_controls_sticks")
            Game.CloseMenu("plutonium_controller_controls")
        end
    )

    Menu_AddButton(controlsmenu, 3, "SENSITIVITY", 
        function(menu,button) 
            SetSensitivity(sensitivity)
        end
    )

    Menu_AddButton(controlsmenu, 4, "BUTTON STYLE", 
        function(menu,button) 
            setControllerIconStyle(buttonstyle)
        end
    )

    Menu_AddButton(controlsmenu, 5, "LOOK INVERSION",
        function(menu,button) 
            SetLookInvert(lookinvert)
        end
    )

    Menu_AddButton(controlsmenu, 6, "ENABLE AIM ASSIST", 
        function(menu,button) 
            SetEnableAimAssist(enableaimassist)
        end
    )   

    Menu_Seperator(controlsmenu, 7)

    Menu_AddButton(controlsmenu, 7, "RESET CONTROLS", 
        function(menu,button) 
            Game.SetDvar("gpad_buttonsConfig", "gamepad_default")
            Game.SetDvar("gpad_sticksConfig", "thumbstick_default")
            Game.SetDvar("input_viewSensitivity", 1)
            Game.SetDvar("ui_controllericons", 0)
            Game.SetDvar("input_invertPitch", 0)
            Game.SetDvar("gpad_enabled", 1)
            Game.SetDvar("cg_aimAssistEnabled", 1)
            Game.ExecuteCommand("bindgpbuttonsconfigs;bindgpsticksconfigs;");

            -- Redraw text
            enablegamepad:SetText(GetEnableGamepad(true))
            buttonlayout:SetText(GetButtonLayout("gamepad_default"))
            sticklayout:SetText(GetStickLayout("thumbstick_default"))
            sensitivity:SetText(GetSensitivity(1))
            buttonstyle:SetText(GetControllerIconStyle(0))
            lookinvert:SetText(GetLookInvert(false))
            enableaimassist:SetText(GetEnableAimAssist(true))
        end
    )

    -- Populate right panel with setting values on load.
    enablegamepad = DrawRightPanelText(0, GetEnableGamepad())
    buttonlayout = DrawRightPanelText(1, GetButtonLayout())
    sticklayout = DrawRightPanelText(2, GetStickLayout())
    sensitivity = DrawRightPanelText(3, GetSensitivity())
    buttonstyle = DrawRightPanelText(4, GetControllerIconStyle())
    lookinvert = DrawRightPanelText(5, GetLookInvert())
    enableaimassist = DrawRightPanelText(6, GetEnableAimAssist())
    -- main controller menu END

    -- Allocate buttons menu
    buttonsmenu = UI.Menu.new("plutonium_controller_controls_buttons")
    buttonsmenu:OnEsc(
        function()
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_buttons")
        end
    )

    -- Create background item
    buttonsbackground = UI.Item.new()
    buttonsbackground:SetRect(0, 0, 640, 480, 4, 4)
    buttonsbackground:SetType(UI.ItemType.Image)
    buttonsbackground:SetMaterial("background_image_blur_less")
    buttonsmenu:AddItem(buttonsbackground)

    -- Alt background for ingame
    buttonsbackgroundfill = UI.Item.new()
    buttonsbackgroundfill:SetRect(0, 0, 640, 480, 4, 4)
    buttonsbackgroundfill:SetType(UI.ItemType.Rectangle)
    buttonsbackgroundfill:SetBackColor(0, 0, 0, 0)
    buttonsmenu:AddItem(buttonsbackgroundfill)

    -- Sidebar background
    buttonssidebar = UI.Item.new()
    buttonssidebar:SetRect(-64, 0, 300, 480, 1, 0)
    buttonssidebar:SetType(UI.ItemType.Rectangle)
    buttonssidebar:SetBackColor(0, 0, 0, 0.3)
    buttonsmenu:AddItem(buttonssidebar)
    
    -- Create Header Text
    buttonsheader = UI.Item.new()
    buttonsheader:SetRect(80, 30, 206, 37, 1, 1)
    buttonsheader:SetType(UI.ItemType.Text)

    buttonsheader:SetFont(UI.Fonts.HudBigFont)
    buttonsheader:SetTextScale(0.4)

    buttonsheader:SetText("BUTTON LAYOUT")
    buttonsmenu:AddItem(buttonsheader)

    -- Create vertical seperator
    buttonsvsep = UI.Item.new()
    buttonsvsep:SetRect(237, 0, 10, 480, 1, 0)
    buttonsvsep:SetType(UI.ItemType.Image)
    buttonsvsep:SetMaterial("navbar_edge")
    buttonsmenu:AddItem(buttonsvsep)
    
    -- Add menu buttons
    Menu_Seperator(buttonsmenu, 0)
    Menu_AddButton(buttonsmenu, 0, "DEFAULT", 
        function(menu,button) 
            Game.SetDvar("gpad_buttonsConfig", "gamepad_default")
            Game.ExecuteCommand("bindgpbuttonsconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_buttons")
            buttonlayout:SetText(GetButtonLayout("gamepad_default"))
        end
    )
    
    Menu_AddButton(buttonsmenu, 1, "DEFAULT ALT", 
        function(menu,button)
            Game.SetDvar("gpad_buttonsConfig", "gamepad_default_alt")
            Game.ExecuteCommand("bindgpbuttonsconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_buttons")
            buttonlayout:SetText(GetButtonLayout("gamepad_default_alt"))

        end
    )

    Menu_AddButton(buttonsmenu, 2, "TACTICAL", 
        function(menu,button) 
            Game.SetDvar("gpad_buttonsConfig", "gamepad_tactical")
            Game.ExecuteCommand("bindgpbuttonsconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_buttons")
            buttonlayout:SetText(GetButtonLayout("gamepad_tactical"))
        end
    )

    Menu_AddButton(buttonsmenu, 3, "TACTICAL ALT", 
        function(menu,button) 
            Game.SetDvar("gpad_buttonsConfig", "gamepad_tactical_alt")
            Game.ExecuteCommand("bindgpbuttonsconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_buttons")
            buttonlayout:SetText(GetButtonLayout("gamepad_tactical_alt"))
        end
    )

    Menu_AddButton(buttonsmenu, 4, "LEFTY", 
        function(menu,button) 
            Game.SetDvar("gpad_buttonsConfig", "gamepad_lefty")
            Game.ExecuteCommand("bindgpbuttonsconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_buttons")
            buttonlayout:SetText(GetButtonLayout("gamepad_lefty"))
        end
    )

    Menu_AddButton(buttonsmenu, 5, "LEFTY ALT", 
        function(menu,button) 
            Game.SetDvar("gpad_buttonsConfig", "gamepad_lefty_alt")
            Game.ExecuteCommand("bindgpbuttonsconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_buttons")
            buttonlayout:SetText(GetButtonLayout("gamepad_lefty_alt"))
        end
    )

    Menu_AddButton(buttonsmenu, 6, "NOM4D",
        function(menu,button) 
            Game.SetDvar("gpad_buttonsConfig", "gamepad_nomad")
            Game.ExecuteCommand("bindgpbuttonsconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_buttons")
            buttonlayout:SetText(GetButtonLayout("gamepad_nomad"))
        end
    )

    Menu_AddButton(buttonsmenu, 7, "NOM4D ALT",
        function(menu,button) 
            Game.SetDvar("gpad_buttonsConfig", "gamepad_nomad_alt")
            Game.ExecuteCommand("bindgpbuttonsconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_buttons")
            buttonlayout:SetText(GetButtonLayout("gamepad_nomad_alt"))
        end
    )

    Menu_AddButton(buttonsmenu, 8, "NOM4D TACTICAL",
        function(menu,button) 
            Game.SetDvar("gpad_buttonsConfig", "gamepad_nomad_tactical")
            Game.ExecuteCommand("bindgpbuttonsconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_buttons")
            buttonlayout:SetText(GetButtonLayout("gamepad_nomad_tactical"))
        end
    )

    Menu_AddButton(buttonsmenu, 9, "NOM4D TACTICAL ALT",
        function(menu,button) 
            Game.SetDvar("gpad_buttonsConfig", "gamepad_nomad_tactical_alt")
            Game.ExecuteCommand("bindgpbuttonsconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_buttons")
            buttonlayout:SetText(GetButtonLayout("gamepad_nomad_tactical_alt"))
        end
    )
    -- buttons menu END

    -- Allocate sticks menu
    sticksmenu = UI.Menu.new("plutonium_controller_controls_sticks")
    sticksmenu:OnEsc(
        function()
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_sticks")
        end
    )

    -- Create background item
    sticksbackground = UI.Item.new()
    sticksbackground:SetRect(0, 0, 640, 480, 4, 4)
    sticksbackground:SetType(UI.ItemType.Image)
    sticksbackground:SetMaterial("background_image_blur_less")
    sticksmenu:AddItem(sticksbackground)

    -- Alt background for ingame
    sticksbackgroundfill = UI.Item.new()
    sticksbackgroundfill:SetRect(0, 0, 640, 480, 4, 4)
    sticksbackgroundfill:SetType(UI.ItemType.Rectangle)
    sticksbackgroundfill:SetBackColor(0, 0, 0, 0)
    sticksmenu:AddItem(sticksbackgroundfill)

	-- Sidebar background
	stickssidebar = UI.Item.new()
	stickssidebar:SetRect(-64, 0, 300, 480, 1, 0)
	stickssidebar:SetType(UI.ItemType.Rectangle)
	stickssidebar:SetBackColor(0, 0, 0, 0.3)
	sticksmenu:AddItem(stickssidebar)
	
    -- Create Header Text
    sticksheader = UI.Item.new()
	sticksheader:SetRect(100, 30, 206, 37, 1, 1)
    sticksheader:SetType(UI.ItemType.Text)

    sticksheader:SetFont(UI.Fonts.HudBigFont)
    sticksheader:SetTextScale(0.4)

    sticksheader:SetText("STICK LAYOUT")
    sticksmenu:AddItem(sticksheader)

    -- Create vertical seperator
    sticksvsep = UI.Item.new()
    sticksvsep:SetRect(237, 0, 10, 480, 1, 0)
    sticksvsep:SetType(UI.ItemType.Image)
    sticksvsep:SetMaterial("navbar_edge")
    sticksmenu:AddItem(sticksvsep)

    -- Add menu buttons
	Menu_Seperator(sticksmenu, 0)
    Menu_AddButton(sticksmenu, 0, "DEFAULT", 
        function() 
            Game.SetDvar("gpad_sticksConfig", "thumbstick_default")
            Game.ExecuteCommand("bindgpsticksconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_sticks")
            sticklayout:SetText(GetStickLayout("thumbstick_default"))
        end
    )
    
    Menu_AddButton(sticksmenu, 1, "SOUTHPAW", 
        function()
            Game.SetDvar("gpad_sticksConfig", "thumbstick_southpaw")
            Game.ExecuteCommand("bindgpsticksconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_sticks")
            sticklayout:SetText(GetStickLayout("thumbstick_southpaw"))
        end
    )

    Menu_AddButton(sticksmenu, 2, "LEGACY", 
        function() 
            Game.SetDvar("gpad_sticksConfig", "thumbstick_legacy")
            Game.ExecuteCommand("bindgpsticksconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_sticks")
            sticklayout:SetText(GetStickLayout("thumbstick_legacy"))
        end
    )

    Menu_AddButton(sticksmenu, 3, "LEGACY SOUTHPAW", 
        function() 
            Game.SetDvar("gpad_sticksConfig", "thumbstick_legacysouthpaw")
            Game.ExecuteCommand("bindgpsticksconfigs;");
            Game.OpenMenu("plutonium_controller_controls")
            Game.CloseMenu("plutonium_controller_controls_sticks")
            sticklayout:SetText(GetStickLayout("thumbstick_legacysouthpaw"))
        end
    )
    -- sticks menu END

end

-- Draw Values
function DrawRightPanelText(index, text)
    panneltext = UI.Item.new()
    panneltext:SetRect(-64 + 318, 35 + (20 * index), 350, 19, 1, 1)
    panneltext:SetTextScale(0.375)
    panneltext:SetTextOffset(0, 18)
    panneltext:SetTextInvertX(false)

    panneltext:SetType(UI.ItemType.Text)
    panneltext:SetFont(UI.Fonts.NormalFont)
    panneltext:SetText(text)
    controlsmenu:AddItem(panneltext)
    return panneltext
end

-- GET SET Functions
function GetSensitivity(sensitivityval)

    -- RANGE: 0.6 - 4
    -- DATATYPE: Float
    if sensitivityval == nil then
        sensitivityval = Game.GetDvarFloat("input_viewSensitivity")
    end

    if sensitivityval >= 4 then
        return "(INSANE) 10"
    elseif sensitivityval >= 3.5 then
        return "9"
    elseif sensitivityval >= 3 then
        return "8"
    elseif sensitivityval >= 2.599999904632 then
        return "(VERY HIGH) 7"
    elseif sensitivityval >= 2.200000047683 then
        return "6"
    elseif sensitivityval >= 2 then
        return "5"
    elseif sensitivityval >= 1.799999952316 then
        return "(HIGH) 4"
    elseif sensitivityval >= 1.399999976158 then
        return "3"
    elseif sensitivityval >= 1 then
        return "(MEDIUM) 2"
    elseif sensitivityval >= 0.6000000238418 then
        return "(LOW) 1"
    end

    return sensitivityval

end

function SetSensitivity(menuItem)

    -- RANGE: 0.6 - 4
    -- DATATYPE: Float
    -- Passonvalue is to account for differences in LUA floats

    sensitivityval = Game.GetDvarFloat("input_viewSensitivity")
    newsensitivityval = 0
    passonvalue = 0

    if sensitivityval >= 4.0 then                   -- 10 -> 1
        newsensitivityval = 0.6
        passonvalue = 0.6000000238418
    elseif sensitivityval >= 3.5 then               -- 9 -> 10
        newsensitivityval = 4.0
        passonvalue = 4.0
    elseif sensitivityval >= 3.0 then               -- 8 -> 9
        newsensitivityval = 3.5
        passonvalue = 3.5
    elseif sensitivityval >= 2.599999904632 then    -- 7 -> 8
        newsensitivityval = 3.0
        passonvalue = 3.0
    elseif sensitivityval >= 2.200000047683 then    -- 6 -> 7
        newsensitivityval = 2.6
        passonvalue = 2.599999904632
    elseif sensitivityval >= 2.0 then               -- 5 -> 6
        newsensitivityval = 2.2
        passonvalue = 2.200000047683
    elseif sensitivityval >= 1.799999952316 then    -- 4 -> 5
        newsensitivityval = 2.0
        passonvalue = 2.0
    elseif sensitivityval >= 1.399999976158  then   -- 3 -> 4
        newsensitivityval = 1.8
        passonvalue = 1.799999952316
    elseif sensitivityval >= 1.0 then               -- 2 -> 3
        newsensitivityval = 1.4
        passonvalue = 1.399999976158
    elseif sensitivityval >= 0.6000000238418 then   -- 1 -> 2
        newsensitivityval = 1.0
        passonvalue = 1.0
    end

    -- Set new sensitivity
    Game.SetDvar("input_viewSensitivity", newsensitivityval)

    -- Update menu
    menuItem:SetText(GetSensitivity(passonvalue))

end

function GetStickLayout(sticklayoutvalue)

    if sticklayoutvalue == nil then
        sticklayoutvalue = Game.GetDvarString("gpad_sticksConfig")
    end

    if sticklayoutvalue == "thumbstick_default" then
        return "DEFAULT"
    elseif sticklayoutvalue == "thumbstick_southpaw" then
        return "SOUTHPAW"
    elseif sticklayoutvalue == "thumbstick_legacy" then
        return "LEGACY"
    elseif sticklayoutvalue == "thumbstick_legacysouthpaw" then
        return "LEGACY SOUTHPAW"
    else
        return "UNKNOWN"
    end

end

function GetButtonLayout(buttonlayoutvalue)

    if buttonlayoutvalue == nil then
        buttonlayoutvalue = Game.GetDvarString("gpad_buttonsConfig")
    end

    if buttonlayoutvalue == "gamepad_default" then
        return "DEFAULT"
    elseif buttonlayoutvalue == "gamepad_default_alt" then
        return "DEFAULT ALT"
    elseif buttonlayoutvalue == "gamepad_lefty" then
        return "LEFTY"
    elseif buttonlayoutvalue == "gamepad_lefty_alt" then
        return "LEFTY ALT"
    elseif buttonlayoutvalue == "gamepad_nomad" then
        return "NOM4D"
    elseif buttonlayoutvalue == "gamepad_nomad_alt" then
        return "NOM4D ALT"
	elseif buttonlayoutvalue == "gamepad_nomad_tactical" then
		return "NOM4D TACTICAL"
	elseif buttonlayoutvalue == "gamepad_nomad_tactical_alt" then
		return "NOM4D TACTICAL ALT"	
    elseif buttonlayoutvalue == "gamepad_tactical" then
        return "TACTICAL"
    elseif buttonlayoutvalue == "gamepad_tactical_alt" then
        return "TACTICAL ALT"
    else
        return "UNKNOWN"
    end

end

function GetControllerIconStyle(style)

    if style == nil then
        style = Game.GetDvarInt("ui_controllericons")
    end

    if style == 0 then
        return "XBOX"
    else
        return "PLAYSTATION"
    end

end

function setControllerIconStyle(menuItem, style)

    if style == nil then
        style = Game.GetDvarInt("ui_controllericons")
    end

    if style == 0 then
        Game.SetDvar("ui_controllericons", 1)
        menuItem:SetText(GetControllerIconStyle(1))
    else
        Game.SetDvar("ui_controllericons", 0)
        menuItem:SetText(GetControllerIconStyle(0))
    end

end

function GetLookInvert(value)
    if value == nil then
        value = Game.GetDvarBool("input_invertPitch")         
    end

    if value == true then
        return "ENABLE"
    else
        return "DISABLE"
    end

end

function SetLookInvert(menuItem, value)

    if value == nil then
        value = Game.GetDvarBool("input_invertPitch")
    end

    if value == true then
        Game.SetDvar("input_invertPitch", 0)
        menuItem:SetText(GetLookInvert(false))
    else
        Game.SetDvar("input_invertPitch", 1)
        menuItem:SetText(GetLookInvert(true))
    end

end

function SetEnableAimAssist(menuItem, value, only_update)

    if value == nil then
        value = Game.GetDvarBool("cg_aimAssistEnabled")
    end

    if (Game.GetDvarBool("cl_ingame") == true) then
        if (Game.GetDvarBool("sv_allowAimAssist") == false) then
            menuItem:SetText(GetEnableAimAssist(false))
            menuItem:SetTextColor(0.1, 0.1, 0.1, 1)
            return
        end
    end

    menuItem:SetTextColor(1, 1, 1, 1)

    if only_update ~= nil then
        menuItem:SetText(GetEnableAimAssist())
        return
    end

    if value == true then
        Game.SetDvar("cg_aimAssistEnabled", 0)
        menuItem:SetText(GetEnableAimAssist(false))
    else
        Game.SetDvar("cg_aimAssistEnabled", 1)
        menuItem:SetText(GetEnableAimAssist(true))
    end

end

function GetEnableAimAssist(value)

    if value == nil then
        value = Game.GetDvarBool("cg_aimAssistEnabled")         
    end

    if (Game.GetDvarBool("cl_ingame") == true) then
        if (Game.GetDvarBool("sv_allowAimAssist") == false) then
            return "DISABLED BY SERVER"
        end
    end

    if value == true then
        return "ENABLE"
    else
        return "DISABLE"
    end

end

function GetEnableGamepad(value)

    if value == nil then
        value = Game.GetDvarBool("gpad_enabled")         
    end

    if value == true then
        return "ENABLE"
    else
        return "DISABLE"
    end

end

function SetEnableGamepad(menuItem, value)

    if value == nil then
        value = Game.GetDvarBool("gpad_enabled")
        if (value == true) then 
            Game.Log("1")
        else
            Game.Log("0")
        end
    end

    if value == true then
        Game.SetDvar("gpad_enabled", 0)
        menuItem:SetText(GetEnableGamepad(false))
    else
        Game.SetDvar("gpad_enabled", 1)
        menuItem:SetText(GetEnableGamepad(true))
    end

end