
global mainMenu as integer

function BuildMainMenu()
	mainMenu = OryUICreateNavigationDrawer("showRightText:true")
	OryUISetNavigationDrawerItemCount(mainMenu, 4)
	
	mainMenuItemCount as integer : mainMenuItemCount = 0
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:Home;itemType:option;text:Home;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIButton;itemType:option;text:OryUIButton;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIButtonGroup;itemType:option;text:OryUIButtonGroup;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIDialog;itemType:option;text:OryUIDialog;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	remstart
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIEditAvatarScreen;itemType:option;text:OryUIEditAvatarScreen;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIFloatingActionButton;itemType:option;text:OryUIFloatingActionButton;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIHTTPSQueue;itemType:option;text:OryUIHTTPSQueue;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIInputSpinner;itemType:option;text:OryUIInputSpinner;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIList;itemType:option;text:OryUIList;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIMenu;itemType:option;text:OryUIMenu;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIPagination;itemType:option;text:OryUIPagination;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIProgressIndicator;itemType:option;text:OryUIProgressIndicator;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIScrollBar;itemType:option;text:OryUIScrollBar;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIScrollToTop;itemType:option;text:OryUIScrollToTop;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUISprite;itemType:option;text:OryUISprite;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUITabs;itemType:option;text:OryUITabs;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUIText;itemType:option;text:OryUIText;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUITextCard;itemType:option;text:OryUITextCard;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUITooltip;itemType:option;text:OryUITooltip;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:OryUITopBar;itemType:option;text:OryUITopBar;textSize:2.6;rightText:;")
	inc mainMenuItemCount
	OryUIUpdateNavigationDrawerItem(mainMenu, mainMenuItemCount, "name:About;itemType:option;text:About;textSize:2.6;rightText:;")
	remend
endfunction

function ProcessMainMenu()
	OryUIInsertNavigationDrawerListener(mainMenu)
	if (OryUIGetNavigationDrawerItemReleasedByName(mainMenu, "Home"))
		screen = constHomeScreen
	endif
	if (OryUIGetNavigationDrawerItemReleasedByName(mainMenu, "OryUIButton"))
		tabSelected[screen] = 1
		screen = constButtonScreen
	endif
	if (OryUIGetNavigationDrawerItemReleasedByName(mainMenu, "OryUIButtonGroup"))
		tabSelected[screen] = 1
		screen = constButtonGroupScreen
	endif
	if (OryUIGetNavigationDrawerItemReleasedByName(mainMenu, "OryUIDialog"))
		tabSelected[screen] = 1
		screen = constDialogScreen
	endif
endfunction