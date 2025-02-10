function Init()

    -- Allocate menu
    menu = Popup_Create("plutonium_friends", "FRIENDS", 534, 340,
        nil,                    -- onopen
        nil,                    -- onclose
        function(menu, item)    -- accept
            Game.CloseMenu("plutonium_friends")
        end, 
        nil                     -- cancel
    )

    -- Create friendslist
    friends = UI.Item.new()
    friends:SetRect(-267, -135, 534, 280, 2, 2)
    friends:SetTextScale(0.3)
    friends:SetFont(UI.Fonts.BigFont)
    friends:SetType(UI.ItemType.ListBox)
    friends:SetBorder(false)
    friends:SetBorderSize(0.5)
    friends:SetBorderColor(1, 1, 1, 0)
    friends:SetItemSize(14)
    friends:OnClick(
        function (menu, mods)
            
        end
    )
    friends:OnDoubleClick(
        function (menu, mods)
            Game.JoinFriend(
                mods:GetSelectedItemIndex()
            )
        end
    )
    friends:GetColumnText(
        function (row, col)
            if col == 0 then
                return Game.GetFriendName(row)
            end
            if col == 1 then
                return Game.GetFriendStatus(row)
            end
        end
    )
    friends:GetColumnOffset(
        function (column)
            if column == 0 then
                return 0
            end
            if column == 1 then
                return 200
            end
        end
    )
    friends:GetColumnCount(
        function ()
            return 2
        end
    )
    friends:GetRowCount(
        function ()
            return Game.GetNumFriends()
        end
    )
    menu:AddItem(friends)

end
