
function MenuScreen(selectedTab as integer)
	SetViewOffset(0, 0)
	thisScreen as integer : thisScreen = constMenuScreen
	
	if (selectedTab = 0) then selectedTab = 1
	tabSelected[thisScreen] = selectedTab
	
	select tabSelected[thisScreen]
		case 1
			MenuScreenPreviewTab()
		endcase
		case 2
			MenuScreenCodeTab()
		endcase
	endselect
endfunction

function MenuScreenPreviewTab()
	thisScreen as integer : thisScreen = constMenuScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]
	
	// Initiate Screen
	contentHeight# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIMenu;navigationIcon:menu;navigationName:Menu;depth:10")
	OryUISetTopBarActionCount(topBar, 1)
	OryUIUpdateTopBarAction(topBar, 1, "name:MoreVert;icon:more_vert")
	topBarMenu as integer : topBarMenu = OryUICreateMenu("showLeftIcon:true;width:60;depth:5")
	OryUISetMenuItemCount(topBarMenu, 4)
	OryUIUpdateMenuItem(topBarMenu, 1, "name:AddAccount;text:Add Account;leftIcon:add;leftIconColor:100,100,100")
	OryUIUpdateMenuItem(topBarMenu, 2, "name:EditAccounts;text:Edit Accounts;leftIcon:edit;leftIconColor:100,100,100")
	OryUIUpdateMenuItem(topBarMenu, 3, "name:Settings;text:Settings;leftIcon:settings;leftIconColor:100,100,100")
	OryUIUpdateMenuItem(topBarMenu, 4, "name:Help;text:Help;leftIcon:help;leftIconColor:100,100,100")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	txtCard as integer : textCard = OryUICreateTextCard("width:94;headerText:;supportingText:Menus can be placed anywhere on the screen, but often they are placed near the widget that called the menu. OryUI will automatically adjust the position so that the menu appears inside the screen. Press any of the buttons and the 3 dots on the top bar to show their menus.;position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard) + 2
	
	button as integer[20]
	menu as integer[20]

	button[1] = OryUICreateButton("size:25,5;text:Button;offset:0,0;position:5," + str(contentHeight#) + ";depth:20")
	menu[1] = OryUICreateMenu("width:60;depth:5")
	OryUISetMenuItemCount(menu[1], 6)
	OryUIUpdateMenuItem(menu[1], 1, "name:NewTab;text:New Tab")
	OryUIUpdateMenuItem(menu[1], 2, "name:Bookmarks;text:Bookmarks")
	OryUIUpdateMenuItem(menu[1], 3, "name:RecentTabs;text:Recent Tabs")
	OryUIUpdateMenuItem(menu[1], 4, "name:History;text:History")
	OryUIUpdateMenuItem(menu[1], 5, "name:Settings;text:Settings")
	OryUIUpdateMenuItem(menu[1], 6, "name:HelpFeedback;text:Help & Feedback")
	
	button[2] = OryUICreateButton("size:25,5;text:Button;offset:25,0;position:95," + str(contentHeight#) + ";depth:20")
	menu[2] = OryUICreateMenu("width:60;depth:5")
	OryUISetMenuItemCount(menu[2], 7)
	OryUIUpdateMenuItem(menu[2], 1, "name:Play;text:Play;color:0,0,0;textColor:255,255,255")
	OryUIUpdateMenuItem(menu[2], 2, "name:AddToQueue;text:Add to Queue;color:0,0,0;textColor:255,255,255")
	OryUIUpdateMenuItem(menu[2], 3, "name:AddToPlaylist;text:Add to Playlist;color:0,0,0;textColor:255,255,255")
	OryUIUpdateMenuItem(menu[2], 4, "name:ViewArtist;text:ViewArtist;color:0,0,0;textColor:255,255,255")
	OryUIUpdateMenuItem(menu[2], 5, "name:ViewAlbum;text:ViewAlbum;color:0,0,0;textColor:255,255,255")
	OryUIUpdateMenuItem(menu[2], 6, "name:Share;text:Share;color:0,0,0;textColor:255,255,255")
	OryUIUpdateMenuItem(menu[2], 7, "name:BuyMerchandise;text:BuyMerchandise;color:0,0,0;textColor:255,255,255")
	
	button[3] = OryUICreateButton("size:25,5;text:Button;offset:0,0;position:5,90;depth:20")
	menu[3] = OryUICreateMenu("showRightIcon:true;width:60;depth:5")
	OryUISetMenuItemCount(menu[3], 6)
	OryUIUpdateMenuItem(menu[3], 1, "name:One;text:One;rightIcon:looks_one;rightIconColor:255,0,0")
	OryUIUpdateMenuItem(menu[3], 2, "name:Two;text:Two;rightIcon:looks_two;rightIconColor:255,0,0")
	OryUIUpdateMenuItem(menu[3], 3, "name:Three;text:Three;rightIcon:looks_3;rightIconColor:255,0,0")
	OryUIUpdateMenuItem(menu[3], 4, "name:Four;text:Four;rightIcon:looks_4;rightIconColor:255,0,0")
	OryUIUpdateMenuItem(menu[3], 5, "name:Five;text:Five;rightIcon:looks_5;rightIconColor:255,0,0")
	OryUIUpdateMenuItem(menu[3], 6, "name:Six;text:Six;rightIcon:looks_6;rightIconColor:255,0,0")
	
	greenFlagImage as integer : greenFlagImage = LoadImage("FlagGreen.png")
	redFlagImage as integer : redFlagImage = LoadImage("FlagRed.png")
	yellowFlagImage as integer : yellowFlagImage = LoadImage("FlagYellow.png")
	button[4] = OryUICreateButton("size:25,5;text:Button;offset:25,0;position:95,90;depth:20")
	menu[4] = OryUICreateMenu("showLeftIcon:true;showRightIcon:true;width:60;depth:5")
	OryUISetMenuItemCount(menu[4], 3)
	OryUIUpdateMenuItem(menu[4], 1, "name:Red;text:Red;leftIconID:" + str(redFlagImage) + ";leftIconColor:255,255,255")
	OryUIUpdateMenuItem(menu[4], 2, "name:Yellow;text:Yellow;leftIconID:" + str(yellowFlagImage) + ";leftIconColor:255,255,255;rightIcon:check")
	OryUIUpdateMenuItem(menu[4], 3, "name:Green;text:Green;leftIconID:" + str(greenFlagImage) + ";leftIconColor:255,255,255")
	
	tooltip as integer : tooltip = OryUICreateTooltip("")

	scrollToTop as integer : scrollToTop = OryUICreateScrollToTop("color:52,73,94")
	
	// Manage Screen
	do	
		PrintDebug()
		
		// ScrollToTop listeners need to be added to the top of the do loop. Adding it to the bottom causes the screen to flicker when pressed.
		OryUIInsertScrollToTopListener(scrollToTop)	
		
		OryUIInsertTopBarListener(topBar)
		if (OryUIGetTopBarNavigationReleasedName(topBar) = "Menu")
			OryUIShowNavigationDrawer(mainMenu)
		endif
		if (lower(OryUIGetTopBarActionReleasedName(topBar)) = "morevert")
			OryUIShowMenu(topBarMenu, OryUIGetTopBarActionXByIcon(topBar, "more_vert"), OryUIGetTopBarActionYByIcon(topBar, "more_vert") + OryUIGetTopBarActionHeightByIcon(topBar, "more_vert"))
		endif
		OryUIInsertMenuListener(topBarMenu)
		if (OryUIGetMenuItemReleasedName(topBarMenu) = "AddAccount")
			OryUIUpdateTooltip(tooltip, "text:'Add Account' Released")
			OryUIShowTooltip(tooltip, GetViewOffsetX() + 50, GetViewOffsetY() + 90)
		endif
		if (OryUIGetMenuItemReleasedName(topBarMenu) = "EditAccounts")
			OryUIUpdateTooltip(tooltip, "text:'Edit Accounts' Released")
			OryUIShowTooltip(tooltip, GetViewOffsetX() + 50, GetViewOffsetY() + 90)
		endif
		if (OryUIGetMenuItemReleasedName(topBarMenu) = "Settings")
			OryUIUpdateTooltip(tooltip, "text:'Settings' Released")
			OryUIShowTooltip(tooltip, GetViewOffsetX() + 50, GetViewOffsetY() + 90)
		endif
		if (OryUIGetMenuItemReleasedName(topBarMenu) = "Help")
			OryUIUpdateTooltip(tooltip, "text:'Help' Released")
			OryUIShowTooltip(tooltip, GetViewOffsetX() + 50, GetViewOffsetY() + 90)
		endif
		ProcessMainMenu()

		OryUIInsertTabsListener(tabs)
		if (OryUIGetTabsButtonReleasedID(tabs) >= 1)
			tabSelected[thisScreen] = OryUIGetTabsButtonReleasedID(tabs)
		endif
		
		for i = 1 to 4
			if (OryUIGetButtonReleased(button[i]))
				OryUIShowMenu(menu[i], OryUIGetButtonX(button[i]), OryUIGetButtonY(button[i]) + OryUIGetButtonHeight(button[i]))
			endif
			OryUIInsertMenuListener(menu[i])
			if (OryUIGetMenuItemReleasedIndex(menu[i]) > 0)
				OryUIUpdateTooltip(tooltip, "text:'" + OryUIGetMenuItemReleasedName(menu[i]) + "' Released")
				OryUIShowTooltip(tooltip, GetViewOffsetX() + 50, GetViewOffsetY() + 90)
			endif
		next
		
		// Device OS back button pressed
		if (GetRawKeyPressed(27))
			screen = constHomeScreen
		endif
		
		// Change Screen/Tab?
		if (screen <> thisScreen or tabSelected[thisScreen] <> thisTab) then exit
		
		// Scroll Limits
		OryUISetScreenScrollLimits(0, 0, 0, contentHeight# - 100.0)
		
		OryUIAnimateTooltip(tooltip)
		
		OryUISync()
	loop
	
	// Delete all OryUI created components
	OryUIDeleteAllWidgets()
	
	// Delete everything else
	DeleteImage(greenFlagImage)
	DeleteImage(redFlagImage)
	DeleteImage(yellowFlagImage)
endfunction

function MenuScreenCodeTab()
	thisScreen as integer : thisScreen = constMenuScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]

	// Initiate Screen
	contentHeight# as float
	contentWidth# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIMenu;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	txtCode as integer : txtCode = OryUICreateText("text:" + ReadCodeFile("MenuScreen.txt") + ";size:2;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
	contentHeight# = contentHeight# + GetTextTotalHeight(txtCode) + 50
	contentWidth# = GetTextTotalWidth(txtCode) + 10
	
	fabShare as integer : fabShare = OryUICreateFloatingActionButton("icon:Share;mini:true;placement:bottomcentre;color:52,73,94;depth:10")
	OryUIShowFloatingActionButton(fabShare)
	
	// Manage Screen
	do
		PrintDebug()

		OryUIInsertTopBarListener(topBar)
		if (OryUIGetTopBarNavigationReleasedName(topBar) = "Menu")
			OryUIShowNavigationDrawer(mainMenu)
		endif
		ProcessMainMenu()

		OryUIInsertTabsListener(tabs)
		if (OryUIGetTabsButtonReleasedID(tabs) >= 1)
			tabSelected[thisScreen] = OryUIGetTabsButtonReleasedID(tabs)
		endif

		if (OryUIGetFloatingActionButtonReleased(fabShare))
			ShareCode("MenuScreen.txt")
		endif
		
		// Device OS back button pressed
		if (GetRawKeyPressed(27))
			tabSelected[thisScreen] = 1
		endif
		
		// Change Screen/Tab?
		if (screen <> thisScreen or tabSelected[thisScreen] <> thisTab) then exit
		
		// Scroll Limits
		OryUISetScreenScrollLimits(0, contentWidth# - 100.0, 0, contentHeight# - 100.0)
		
		OryUISync()
	loop
	
	// Delete all OryUI created components
	OryUIDeleteAllWidgets()
endfunction