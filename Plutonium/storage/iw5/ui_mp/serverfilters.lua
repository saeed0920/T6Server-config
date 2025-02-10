function Init()

    -- Allocate menu
    menu = UI.MenuOverlay.new("serverfilters")

    button = UI.Item.new()
    button:SetRect(((205 * 2) + 11), ((24 * 15) + 11), 205, 20, 0, 0)
    button:SetTextScale(0.375)
    button:SetTextOffset(103, 18)
    button:SetTextInvertX(true)
    button:SetType(UI.ItemType.Button)
    button:SetFont(UI.Fonts.NormalFont)
    -- Getter sets text
    getNoTrickshot(nil, button)

    button:OnFocus(
        function(menu,button)
            button:SetMaterial("navbar_selection_bar_centered")
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
            setNoTrickshot(nil, button)
            if onclickcb ~= nil then
                onclickcb(menu, button)
            end
		end
    )

    -- Add button to menu
    menu:AddItem(button)

end

function getNoTrickshot(value, uiItem)

    if value == nil then
        value = Game.GetDvarBool("sl_noTrickshot")         
    end

    if value == true then
        uiItem:SetTextOffset(103, 18)
        uiItem:SetText("Trickshot:  No")
    else
        uiItem:SetTextOffset(108, 18)
        uiItem:SetText("Trickshot:  Yes")
    end

end

function setNoTrickshot(value, uiItem)

    if value == nil then
        value = Game.GetDvarBool("sl_noTrickshot")
    end

    if value == true then
        Game.SetDvar("sl_noTrickshot", 0)
        getNoTrickshot(false, uiItem)
    else
        Game.SetDvar("sl_noTrickshot", 1)
        getNoTrickshot(true, uiItem)
    end

end