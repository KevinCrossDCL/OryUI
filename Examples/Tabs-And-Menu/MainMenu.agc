
global mainMenu as integer

function BuildMainMenu()
	mainMenu = OryUICreateNavigationDrawer("showRightText:true")
	OryUISetNavigationDrawerItemCount(mainMenu, 2)
	
	mainMenuItemCount as integer : mainMenuItemCount = 0
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:Home;itemType:option;text:Home;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:Tabs;itemType:option;text:Tabs Screen;rightText:;")
	inc mainMenuItemCount
endfunction

function ProcessMainMenu()
	OryUIInsertNavigationDrawerListener(mainMenu)
	if (OryUIGetNavigationDrawerItemReleasedByName(mainMenu, "Home"))
		screen = constHomeScreen
	endif
	if (OryUIGetNavigationDrawerItemReleasedByName(mainMenu, "Tabs"))
		tabSelected[screen] = 1
		screen = constTabsScreen
	endif
endfunction