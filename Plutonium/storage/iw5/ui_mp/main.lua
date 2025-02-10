function SignIn()
    Game.ExecuteCommand("xrequirelivesignin")
    Game.ExecuteCommand("startentitlements")
    Game.ExecuteCommand("upload_playercard")
end

function Init()

    -- Allocate menu
    menu = UI.Menu.new("main")
	menu:OnOpen(
		function(menu)
            Game.SetLocalVarString("ui_customClassLoc", "customClasses")
		end
	)
    menu:OnEsc(
        function(menu)
            Game.OpenMenu("quit_popmenu")
        end
    )
    menu:SetSoundLoop("music_mainmenu_mp")

    -- Create background item
    background = UI.Item.new()
    background:SetRect(0, 0, 640, 480, 4, 4)
    background:SetType(UI.ItemType.Image)
    background:SetMaterial("background_image")
    menu:AddItem(background)

	-- Sidebar background
	sidebar = UI.Item.new()
	sidebar:SetRect(-64, 0, 300, 480, 1, 0)
	sidebar:SetType(UI.ItemType.Rectangle)
	sidebar:SetBackColor(0, 0, 0, 0.3)
	menu:AddItem(sidebar)
	
    -- Create plutonium logo
    logo = UI.Item.new()
	logo:SetRect(35, 0, 206, 37, 1, 1)
    logo:SetType(UI.ItemType.Image)
    logo:SetMaterial("plutonium_logo")
    menu:AddItem(logo)

    -- Create vertical seperator
    vsep = UI.Item.new()
    vsep:SetRect(236, 0, 10, 480, 1, 0)
    vsep:SetType(UI.ItemType.Image)
    vsep:SetMaterial("navbar_edge")
    menu:AddItem(vsep)
	
    -- Add menu buttons
	Menu_Seperator(menu, 0)
    -- Menu_AddButton_Advanced(menu, 0, "@PLATFORM_FIND_GAME_CAPS", function(menu,button) Game.OpenMenu("popup_findgame") end, nil, nil, function(menu, button) return false end)
    Menu_AddButton(menu, 0, "@MENU_SERVER_BROWSER_CAPS", function(menu,button) SignIn() Game.OpenMenu("serverbrowser") end)
    Menu_AddButton(menu, 1, "@MENU_PRIVATE_MATCH_CAPS", 
        function(menu,button)
            SignIn()
            Game.SetDvar("ui_opensummary", "0")
            Game.SetDvar("systemlink", "0")
            Game.SetDvar("splitscreen", "0")
            Game.SetDvar("onlinegame", "1")
            Game.ExecuteCommand("exec default_xboxlive.cfg")
            Game.ExecuteCommand("xstartprivateparty")
			Game.ExecuteCommand("startentitlements")
			Game.ExecuteCommand("xstartprivatematch")
            Game.SetDvar("xblive_privatematch", "1")
            Game.OpenMenu("menu_xboxlive_privatelobby") 
        end
    )
    Menu_Seperator(menu, 2)
    Menu_AddButton(menu, 2, "@MENU_CREATE_A_CLASS_CAPS", 
        function(menu,button) 
            Game.SetLocalVarString("ui_customClassLoc", "customClasses")
            Game.OpenMenu("cac_popup")
        end
    )
    Menu_AddButton(menu, 3, "@MENU_PLAYERCARD_CAPS", function(menu,button) SignIn() Game.OpenMenu("popup_callsign") end)
    Menu_AddButton(menu, 4, "@MENU_BARRACKS_CAPS", function(menu,button) SignIn() Game.OpenMenu("menu_online_barracks") end)
    Menu_Seperator(menu, 5)
    Menu_AddButton_Advanced(menu, 5, "@MENU_VAULT_CAPS", 
        function(menu,button) 
            SignIn()
			Game.OpenMenu("popup_vault") 
		end,
		nil, 
		nil, 
		function(menu, button) 
			return Game.GetDvarInt("theater_active") == 1
		end
	)
    Menu_AddButton(menu, 6, "@MENU_OPTIONS_CAPS", function(menu,button) Game.OpenMenu("pc_options_video") end)
    Menu_AddButton(menu, 7, "FRIENDS", function(menu,button) Game.OpenMenu("plutonium_friends") end)
    Menu_Seperator(menu, 8)
    Menu_AddButton(menu, 8, "@MENU_QUIT_CAPS", function(menu,button) Game.OpenMenu("quit_popmenu") end)

end
