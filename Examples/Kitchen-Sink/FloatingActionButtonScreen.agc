
function FloatingActionButtonScreen(selectedTab as integer)
	SetViewOffset(0, 0)
	thisScreen as integer : thisScreen = constFloatingActionButtonScreen
	
	if (selectedTab = 0) then selectedTab = 1
	tabSelected[thisScreen] = selectedTab
	
	select tabSelected[thisScreen]
		case 1
			FloatingActionButtonScreenPreviewTab()
		endcase
		case 2
			FloatingActionButtonScreenCodeTab()
		endcase
	endselect
endfunction

function FloatingActionButtonScreenPreviewTab()
	thisScreen as integer : thisScreen = constFloatingActionButtonScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]
	
	// Initiate Screen
	contentHeight# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIFloatingActionButton;textSize:3;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs)

	imgCatProfilePic as integer : imgCatProfilePic = LoadImage("Cat-Profile-Pic.jpg")
	sprCatProfilePic as integer : sprCatProfilePic = OryUICreateSprite("image:" + str(imgCatProfilePic) + ";size:100,30;position:0," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + GetSpriteHeight(sprCatProfilePic) + 7
	
	fab as integer[20]
	
	fab[1] = OryUICreateFloatingActionButton("icon:chat;mini:true;shadow:true;placement:bottomcenter;placementOffset:-20,4;color:50,50,50;attachToSpriteID:" + str(sprCatProfilePic) + ";depth:15")

	fab[2] = OryUICreateFloatingActionButton("icon:star;mini:true;shadow:true;placement:bottomcenter;placementOffset:0,4;color:50,50,50;attachToSpriteID:" + str(sprCatProfilePic) + ";depth:15")

	fab[3] = OryUICreateFloatingActionButton("icon:camera_alt;mini:true;shadow:true;placement:bottomcenter;placementOffset:20,4;color:50,50,50;attachToSpriteID:" + str(sprCatProfilePic) + ";depth:15")

	fab[4] = OryUICreateFloatingActionButton("icon:save;shadow:true;color:52,73,94;depth:10")
	OryUIHideFloatingActionButton(fab[4])
	
	formIcon as integer[20]
	textfield as integer[20]
	
	formIcon[1] = OryUICreateSprite("image:" + str(OryUIReturnIconID("person")) + ";size:-1,3;offset:center;position:5," + str(contentHeight# + 3.5) + ";color:0,0,0,200;depth:20")
	textfield[1] = OryUICreateTextfield("labelText:Name;inputText:Molly;position:10," + str(contentHeight#) + ";width:85;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextfieldHeight(textfield[1]) + 50
	
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
		ProcessMainMenu()

		OryUIInsertTabsListener(tabs)
		if (OryUIGetTabsButtonReleasedID(tabs) >= 1)
			tabSelected[thisScreen] = OryUIGetTabsButtonReleasedID(tabs)
		endif
		
		OryUIShowFloatingActionButton(fab[1])
		if (OryUIGetFloatingActionButtonReleased(fab[1]))
			OryUIUpdateTooltip(tooltip, "text:'Message' Released")
			OryUIShowTooltip(tooltip, GetViewOffsetX() + 50, GetViewOffsetY() + 90)
		endif
		OryUIShowFloatingActionButton(fab[2])
		if (OryUIGetFloatingActionButtonReleased(fab[2]))
			OryUIUpdateTooltip(tooltip, "text:'Favourite' Released")
			OryUIShowTooltip(tooltip, GetViewOffsetX() + 50, GetViewOffsetY() + 90)
		endif
		OryUIShowFloatingActionButton(fab[3])
		if (OryUIGetFloatingActionButtonReleased(fab[3]))
			OryUIUpdateTooltip(tooltip, "text:'Camera' Released")
			OryUIShowTooltip(tooltip, GetViewOffsetX() + 50, GetViewOffsetY() + 90)
		endif
		
		for i = 1 to 4
			OryUIInsertTextfieldListener(textfield[i])
		next
		
		OryUIHideFloatingActionButton(fab[4])
		if (OryUIGetTextfieldHasFocus(textfield[1]))
			SetViewOffset(GetViewOffsetX(), OryUIGetTextfieldY(textfield[1]) - OryUIGetTopBarHeight(topBar) - OryUIGetTabsHeight(tabs) - 2)
		endif
		
		if (OryUIGetTextfieldString(textfield[1]) <> "Molly")
			OryUIShowFloatingActionButton(fab[4])
		endif
		if (OryUIGetFloatingActionButtonReleased(fab[4]))
			OryUIUpdateTooltip(tooltip, "text:'Save' Released")
			OryUIShowTooltip(tooltip, GetViewOffsetX() + 50, GetViewOffsetY() + 90)
		endif
		
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
	DeleteImage(imgCatProfilePic)
	DeleteSprite(sprCatProfilePic)
	for i = 1 to 20
		DeleteSprite(formIcon[i])
	next
endfunction

function FloatingActionButtonScreenCodeTab()
	thisScreen as integer : thisScreen = constFloatingActionButtonScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]

	// Initiate Screen
	contentHeight# as float
	contentWidth# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIFloatingActionButton;textSize:3;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	txtCode as integer : txtCode = OryUICreateText("text:" + ReadCodeFile("FloatingActionButtonScreen.txt") + ";size:2;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
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
			ShareCode("FloatingActionButtonScreen.txt")
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