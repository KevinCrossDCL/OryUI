
function EditAvatarScreen(selectedTab as integer)
	SetViewOffset(0, 0)
	thisScreen as integer : thisScreen = constEditAvatarScreen
	
	if (selectedTab = 0) then selectedTab = 1
	tabSelected[thisScreen] = selectedTab
	
	select tabSelected[thisScreen]
		case 1
			EditAvatarScreenPreviewTab()
		endcase
		case 2
			EditAvatarScreenCodeTab()
		endcase
	endselect
endfunction

function EditAvatarScreenPreviewTab()
	thisScreen as integer : thisScreen = constEditAvatarScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]
	
	// Initiate Screen
	contentHeight# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIEditAvatarScreen;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	defaultAvatarImage = LoadImage("DefaultAvatar.png")
	sprAvatar = OryUICreateSprite("size:50,-1;image:" + str(defaultAvatarImage) + ";offset:topCenter;color:255,255,255,255;position:50," + str(contentHeight#))
	avatarCircleFrameImage = LoadImage("AvatarCircleFrame.png")
	sprAvatarFrame = OryUICreateSprite("size:50,-1;image:" + str(avatarCircleFrameImage) + ";offset:topCenter;position:50," + str(contentHeight#))
	
	fabChangeAvatar = OryUICreateFloatingActionButton("icon:camera_alt;mini:true;shadow:false;color:50,50,50;attachToSpriteID:" + str(sprAvatar))
	OryUIShowFloatingActionButton(fabChangeAvatar)

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
		
		OryUIShowFloatingActionButton(fabChangeAvatar)
		
		if (OryUIGetFloatingActionButtonReleased(fabChangeAvatar))
			OryUIHideFloatingActionButton(fabChangeAvatar)
			avatarChosenImage = 0
			ShowChooseImageScreen()
			repeat
				if (GetRawKeyPressed(27))
					exit
				endif
				Sync()
			until (IsChoosingImage() = 0)
			avatarChosenImage = GetChosenImage()
			if (avatarChosenImage > 0)
				editAvatarScreen = OryUICreateEditAvatarScreen("position:200,0;frameShape:circle;image:" + str(avatarChosenImage) + ";maxZoom:5;cancelText:Cancel;saveText:Use")
			endif
	    endif
	    if (avatarChosenImage > 0)
	    		do
	    			OryUIInsertEditAvatarScreenListener(editAvatarScreen)
				if (OryUIGetEditAvatarCancelButtonReleased(editAvatarScreen))
					avatarChosenImage = 0
					exit
				endif
				if (OryUIGetFinalAvatar(editAvatarScreen) > 0)
					SetSpriteImage(sprAvatar, OryUIGetFinalAvatar(editAvatarScreen))
					avatarChosenImage = 0
					exit
				endif
		    		OryUISync()
	    		loop
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
	DeleteImage(defaultAvatarImage)
	DeleteImage(avatarCircleFrameImage)
endfunction

function EditAvatarScreenCodeTab()
	thisScreen as integer : thisScreen = constEditAvatarScreen
	thisTab as integer : thisTab = tabSelected[thisScreen]

	// Initiate Screen
	contentHeight# as float
	contentWidth# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:OryUIEditAvatarScreen;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar)
	
	tabs as integer : tabs = OryUICreateTabs("position:0," + str(contentHeight#) + ";minPosition:0," + str(contentHeight#) + ";depth:10")
	OryUIInsertTabsButton(tabs, -1, "text:Preview")
	OryUIInsertTabsButton(tabs, -1, "text:Code")
	OryUISetTabsButtonSelected(tabs, tabSelected[thisScreen])
	contentHeight# = contentHeight# + OryUIGetTabsHeight(tabs) + 2

	txtCode as integer : txtCode = OryUICreateText("text:" + ReadCodeFile("EditAvatarScreen.txt") + ";size:2;position:5," + str(contentHeight#) + ";color:0,0,0;depth:20")
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
			ShareCode("EditAvatarScreen.txt")
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