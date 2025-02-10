function Menu_AddButton_Advanced(menu, index, text, onclickcb, onfocuscb, isvisiblecb, isenabledcb)

    -- Create button
    button = UI.Item.new()
    button:SetRect(-64, 35 + (20 * index), 300, 17, 1, 1)
    button:SetTextScale(0.375)
    button:SetTextOffset(277, 18)
    button:SetTextInvertX(true)
    button:SetType(UI.ItemType.Button)
    button:SetFont(UI.Fonts.NormalFont)
    button:SetText(text)
    button:OnFocus(
        function(menu,button)
            button:SetMaterial("navbar_selection_bar")
			Game.PlaySound("mouse_over")
			
			if onfocuscb ~= nil then
                onfocuscb(menu, button)
            end
        end
    )
    button:OnLeaveFocus(
        function(menu,button)
            button:SetMaterial("")
        end
    )
	button:IsVisible(
		isvisiblecb
	)
	button:IsEnabled(
		isenabledcb
	)
    button:OnClick(
		function(menu,button)
			Game.PlaySound("mouse_click")
			
			if onclickcb ~= nil then
                onclickcb(menu, button)
            end
		end
    )

    -- Add button to menu
    menu:AddItem(button)

end

function Menu_AddButton_RightPanel(menu, index, text, onclickcb, onfocuscb, isvisiblecb, isenabledcb)

    -- Create button
    button = UI.Item.new()
    button:SetRect(-64 + 318, 35 + (20 * index), 350, 19, 1, 1)
    button:SetTextScale(0.375)
    button:SetTextOffset(0, 18)
    button:SetTextInvertX(false)
    button:SetType(UI.ItemType.Button)
    button:SetFont(UI.Fonts.NormalFont)
    button:SetText(text)
    button:OnFocus(
        function(menu,button)
            button:SetMaterial("navbar_selection_bar_flipped")
            shadow:SetMaterial("navbar_selection_bar_shadow")
			Game.PlaySound("mouse_over")
			
			if onfocuscb ~= nil then
                onfocuscb(menu, button)
            end
        end
    )
    button:OnLeaveFocus(
        function(menu,button)
            button:SetMaterial("")
            shadow:SetMaterial("")
        end
    )
	button:IsVisible(
		isvisiblecb
	)
	button:IsEnabled(
		isenabledcb
	)
    button:OnClick(
		function(menu,button)
			Game.PlaySound("mouse_click")
			
			if onclickcb ~= nil then
                onclickcb(menu, button)
            end
		end
    )

    -- Button Shadow
    shadow = UI.Item.new()
    shadow:SetRect(-64 + 318, 52 + (20 * index), 345, 10, 1, 1)
    shadow:SetType(UI.ItemType.Image)

    -- Add button to menu
    menu:AddItem(button)
    menu:AddItem(shadow)

end

function Menu_AddButton(menu, index, text, onclickcb)
	Menu_AddButton_Advanced(menu, index, text, onclickcb, nil, nil, nil)
end

function CAC_AddWeapon(menu, index, weapon, text, is_primary, weapon_type)

	Menu_AddButton_Advanced(menu, index, text, 
		function(menu,button) 	-- OnClick
            
            if weapon == nil then
                return
            end

            local classIndex = Game.GetLocalVarString("classIndex")
            local weaponSetupIndex = "0"

            if is_primary == false then
                weaponSetupIndex = "1"
            end

            -- Set modified data
            Game.SetPlayerData("customClasses " .. classIndex .. " weaponSetups " .. weaponSetupIndex .. " weapon " .. weapon)
            Game.SetPlayerData("customClasses " .. classIndex .. " weaponSetups " .. weaponSetupIndex .. " attachment 0 none")
            Game.SetPlayerData("customClasses " .. classIndex .. " weaponSetups " .. weaponSetupIndex .. " attachment 1 none")
            Game.SetPlayerData("customClasses " .. classIndex .. " weaponSetups " .. weaponSetupIndex .. " camo none")
            Game.SetPlayerData("customClasses " .. classIndex .. " weaponSetups " .. weaponSetupIndex .. " buff specialty_null")
            Game.SetPlayerData("customClasses " .. classIndex .. " weaponSetups " .. weaponSetupIndex .. " reticle none")

            -- Fix menu visible data
            if is_primary == true then
                Game.SetLocalVarString("loadoutPrimary", weapon)
                Game.SetLocalVarString("loadoutPrimaryAttachment", "none")
                Game.SetLocalVarString("loadoutPrimaryAttachment2", "none")
                Game.SetLocalVarString("loadoutPrimaryCamo", "none")
                Game.SetLocalVarString("loadoutPrimaryBuff", "specialty_null")
                Game.SetLocalVarString("loadoutPrimaryReticle", "none")
            else
                Game.SetLocalVarString("loadoutSecondary", weapon)
                Game.SetLocalVarString("loadoutSecondaryAttachment", "none")
                Game.SetLocalVarString("loadoutSecondaryAttachment2", "none")
                Game.SetLocalVarString("loadoutSecondaryCamo", "none")
                Game.SetLocalVarString("loadoutSecondaryBuff", "specialty_null")
                Game.SetLocalVarString("loadoutSecondaryReticle", "none")
            end

            -- Open next menu
            if is_primary == true then
                Game.OpenMenu("cac_weapon_proficiency_primary_" .. weapon_type)
            else
                Game.OpenMenu("cac_weapon_proficiency_secondary_" .. weapon_type)
            end
		end,
		function(menu, button) 	-- OnFocus
        
            if weapon == nil then
                return
            end

            -- Set selected weapon
			Game.SetLocalVarString("ui_selected_ref", weapon)
            
            -- Set new to false
			Game.SetPlayerData("weaponNew " .. weapon .. " false")
			
		end,
		nil,					-- IsVisible
		nil						-- IsEnabled
	)

end

function CAC_Primary_SMG(menu, index, weapon, text)
    CAC_AddWeapon(menu, index, weapon, text, true, "smg")
end

function CAC_Secondary_SMG(menu, index, weapon, text)
    CAC_AddWeapon(menu, index, weapon, text, false, "smg")
end

function CAC_Primary_Sniper(menu, index, weapon, text)
    CAC_AddWeapon(menu, index, weapon, text, true, "sniper")
end

function CAC_Secondary_Sniper(menu, index, weapon, text)
    CAC_AddWeapon(menu, index, weapon, text, false, "sniper")
end


function Menu_Seperator(menu, index)

    -- Create seperator
    sep = UI.Item.new()
    sep:SetRect(0, 33 + (20 * index), 236, 1, 1, 1)
    sep:SetType(UI.ItemType.Image)
    sep:SetMaterial("gradient_fadein")
    menu:AddItem(sep)

end

function Popup_AddButton_Advanced(menu, text, xpos, ypos, width, onclickcb, onfocuscb, isvisiblecb, isenabledcb, alignmentIndent)
    -- Create button
    button = UI.Item.new()
    button:SetRect(xpos, ypos, width, 20, 2, 2)
    button:SetTextScale(0.365)
    button:SetTextInvertX(false)
    button:SetTextOffset(10, 18)
    button:SetType(UI.ItemType.Button)
    button:SetFont(UI.Fonts.NormalFont)
    button:SetText(text)
    button:OnFocus(
        function(menu,button)
            button:SetBackColor(0.51, 0.53, 0.51, 1)
			Game.PlaySound("mouse_over")
			
			if onfocuscb ~= nil then
                onfocuscb(menu, button)
            end
        end
    )
    button:OnLeaveFocus(
        function(menu,button)
            button:SetBackColor(0, 0, 0, 0)
        end
    )
	button:IsVisible(
		isvisiblecb
	)
	button:IsEnabled(
		isenabledcb
	)
    button:OnClick(
		function(menu,button)
			Game.PlaySound("mouse_click")
			
			if onclickcb ~= nil then
                onclickcb(menu, button)
            end
		end
    )

    -- Add button to menu
    menu:AddItem(button)

end

function Popup_AddButton(menu, text, xpos, ypos, width, onclickcb)
    Popup_AddButton_Advanced(menu, text, xpos, ypos, width, onclickcb, nil, nil, nil)
end

function Popup_Create_Advanced(name, title, width, height, onopencb, onclosecb, buttonOptions)
    
    if buttonOptions == nil then
        return
    end

    -- Allocate menu
    menu = UI.Menu.new(name)
    menu:OnOpen(
        function(menu)
            if onopencb ~= nil then
                onopencb(menu)
            end
        end
    )
    menu:OnEsc(
        function(menu)
            if onclosecb ~= nil then
                onclosecb(menu)
            else
                Game.CloseMenu(name)
            end
        end
    )
    menu:SetPopup(true)
    menu:SetRect(-(width / 2), -(height / 2), width, height, 2, 2)

    -- Background item
    bg = UI.Item.new()
    bg:SetType(UI.ItemType.Rectangle)
    bg:SetBackColor(0.317, 0.349, 0.286, 1)
    bg:SetRect(-(width / 2), -(height / 2), width, height, 2, 2)
    menu:AddItem(bg)

    -- Header bar
    header = UI.Item.new()
    header:SetType(UI.ItemType.Rectangle)
    header:SetBackColor(45 / 255, 48 / 255, 46 / 255, 1)
    header:SetRect(-(width / 2), -(height / 2), width, 25, 2, 2)
    menu:AddItem(header)

    -- Header shadow
    hsh = UI.Item.new()
    hsh:SetType(UI.ItemType.Image)
    hsh:SetMaterial("navbar_selection_bar_shadow")
    hsh:SetRect(-(width / 2), -((height / 2) - 25), width, 10, 2, 2)
    menu:AddItem(hsh)

    -- Header text
    menu_name = UI.Item.new()
    menu_name:SetType(UI.ItemType.Text)
    menu_name:SetRect(-((width / 2) - 5), -((height / 2) - 22), width, 30, 2, 2)
    menu_name:SetText(title)
    menu_name:SetFont(UI.Fonts.HudBigFont)
    menu_name:SetTextScale(0.4)
    menu:AddItem(menu_name)

    -- determine what the box size should be based on callbacks
    numItems = 0

    -- Iterate over button options
    if buttonOptions ~= nil then
        for i=1, #buttonOptions do
            if buttonOptions[i] ~= nil and buttonOptions[i][1] ~= nil then
                numItems = numItems + 1
            end
        end
    end

    -- Button box at the bottom of the menu
    buttonbox = UI.Item.new()
    buttonbox:SetType(UI.ItemType.Rectangle)
    buttonbox:SetRect(-(width / 2), ( (height / 2) - ((numItems * 20) + 5) ), width, numItems * 20, 2, 2)
    buttonbox:SetBackColor(57 / 255, 62 / 255, 59 / 255, 1)
    menu:AddItem(buttonbox)

    -- Draw buttons
    numDrawnItems = 0

    -- Iterate over button options and generate buttons
    -- [1] = callback func, [2] = Button name
    if buttonOptions ~= nil then
        for i=1, #buttonOptions do
            if buttonOptions[i] ~= nil and buttonOptions[i][1] ~= nil then
                Popup_AddButton(menu, (buttonOptions[i][2]), -(width / 2), ( (height / 2) - ((numItems * 20) + 5) + (numDrawnItems * 20) ), width, buttonOptions[i][1])
                numDrawnItems = numDrawnItems + 1
            end
        end
    end

    return menu

end

function Popup_Create(name, title, width, height, onopencb, onclosecb, acceptyescb, cancelnocb, buttonStyle)

    -- Default Button Style to Accept/Cancel
    if buttonStyle == nil then
        buttonStyle = true
    end

    -- Init array to store default button options
    buttonOptions = {}

    -- Define buttons based off style
    if buttonStyle == true then
        buttonOptions[1] = {acceptyescb, "OK"}
        buttonOptions[2] = {cancelnocb, "CANCEL"}
    else
        buttonOptions[1] = {acceptyescb, "YES"}
        buttonOptions[2] = {cancelnocb, "NO"}
    end

    -- Pass default buttons options onto advanced function -> will handle popup generation
    return Popup_Create_Advanced(name, title, width, height, onopencb, onclosecb, buttonOptions)

end