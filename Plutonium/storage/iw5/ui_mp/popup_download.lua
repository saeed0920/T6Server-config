function Init()

    buttonOptions = {
        {
            function(menu, item)
                Game.CloseMenu("popup_download")
                Game.CancelDownload()
            end,
            "CANCEL"
        }
    }

    -- Popup Menu
	menu = Popup_Create_Advanced("popup_download", "MOD DOWNLOAD", 500, 100,
        function(menu)          -- onopen
            Game.PlaySound("tabs_slide")
        end,                    
        function(menu)          -- onclose
            Game.CloseMenu("popup_download")
        end,
        buttonOptions
    )

    -- Prevent menu close on click outside
    menu:SetPopup(false)

    -- Mod Info
    modname = UI.Item.new()
    modname:SetType(UI.ItemType.Text)
    modname:SetRect(0, 0, 0, 0, 2, 2)
    modname:SetText(
        function(menu, item)
            return "Downloading mod \"" .. Game.DLGetModName() .. "\" [file " .. Game.DLGetCurrentFile() ..  "/" .. Game.DLGetNumFiles() .. "]" .. Game.GetDots()
        end)
    modname:SetFont(UI.Fonts.BigFont)
    modname:SetTextScale(0.4)
    modname:SetTextCentered(true)
    menu:AddItem(modname)

    -- file name
    file_info = UI.Item.new()
    file_info:SetType(UI.ItemType.Text)
    file_info:SetRect(-245, 20, 0, 0, 2, 2)
    file_info:SetText(
        function(menu, item)
            return Game.DLGetCurrentFileName()
        end
    )
    file_info:SetFont(UI.Fonts.BigFont)
    file_info:SetTextScale(0.4)
    menu:AddItem(file_info)

    -- file speed
    file_speed = UI.Item.new()
    file_speed:SetType(UI.ItemType.Text)
    file_speed:SetRect(200, 20, 0, 0, 2, 2)
    file_speed:SetText(
        function(menu, item)
            return Game.DLGetSpeed()
        end
    )
    file_speed:SetFont(UI.Fonts.BigFont)
    file_speed:SetTextScale(0.4)
    file_speed:SetTextInvertX(true)
    menu:AddItem(file_speed)

    -- file progress
    file_progress = UI.Item.new()
    file_progress:SetType(UI.ItemType.Text)
    file_progress:SetRect(245, 20, 0, 0, 2, 2)
    file_progress:SetText(
        function(menu, item)
            return Game.DLGetFileProgress() .. "%"
        end
    )
    file_progress:SetFont(UI.Fonts.BigFont)
    file_progress:SetTextScale(0.4)
    file_progress:SetTextInvertX(true)
    menu:AddItem(file_progress)

end
