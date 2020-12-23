
function IconsScreen()
	thisScreen as integer : thisScreen = constIconsScreen
	
	// Initiate Screen
	contentHeight# as float
	
	topBar as integer : topBar = OryUICreateTopBar("text:Icons;navigationIcon:menu;navigationName:Menu;depth:10")
	BuildMainMenu()
	contentHeight# = OryUIGetTopBarHeight(topBar) + 2
	
	textCard = OryUICreateTextCard("width:94;headerText:;supportingText:OryUI has access to 1,500+ Material icons. Below you'll find a small random selection of icons along with the icon name used. For a full list of available icons and their names check out[colon];position:3," + str(contentHeight#) + ";autoHeight:true;depth:20")
	contentHeight# = contentHeight# + OryUIGetTextCardHeight(textCard)
	
	buttonMaterialURL = OryUICreateButton("size:90,5;text:https[colon]//material.io/resources/icons;offset:45,0;position:50," + str(contentHeight#) + ";alpha:0;textColor:#0000EE;depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(buttonMaterialURL) + 1
	
	randomIcon as integer
	list as integer : list = OryUICreateList("noOfLeftLines:1;showLeftThumbnail:true;noOfRightLines:0;itemSize:94,6;position:3," + str(contentHeight#) + ";depth:20")
	OryUISetListItemCount(list, 25)
	
	for i = 0 to 24
		repeat
			randomIcon = random(1, 1500)
		until oryUIMaterialIcon[randomIcon].name$ <> ""
		OryUIUpdateListItem(list, i, "leftThumbnailImage:" + str(oryUIMaterialIcon[randomIcon].imageID) + ";leftLine1Text:" + oryUIMaterialIcon[randomIcon].name$)
		SetSpriteColor(OryUIListCollection[list].sprItemLeftThumbnail[i], 0, 0, 0, 255)
	next
	contentHeight# = contentHeight# + OryUIGetListHeight(list) + 50

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

		if (OryUIGetButtonReleased(buttonMaterialURL))
			OpenBrowser("https://material.io/resources/icons/?style=baseline")
		endif
		
		// Device OS back button pressed
		if (GetRawKeyPressed(27))
			screen = constHomeScreen
		endif
		
		// Change Screen/Tab?
		if (screen <> thisScreen) then exit
		
		// Scroll Limits
		OryUISetScreenScrollLimits(0, 0, 0, contentHeight# - 100.0)

		OryUISync()
	loop
	
	// Delete all OryUI created components
	OryUIDeleteAllWidgets()
	
	// Delete everything else
endfunction
