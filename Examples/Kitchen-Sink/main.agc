// Project: Kitchen-Sink
// Created: 20-11-29

SetClearColor(255, 255, 255)
SetOrientationAllowed(1, 1, 0, 0)
SetPrintColor(255, 255, 0)
SetPrintSize(2)
SetScissor(0, 0, 0, 0)
SetSyncRate(30, 0)
SetDisplayAspect(-1)
SetWindowSize(390, 844, 0)
UseNewDefaultFonts(1)
SetImmersiveMode(1) // Recommended to stop floating action buttons, and scroll to tops from sitting underneath the screen controls placed by the OS.
Sync()

#insert "..\..\..\OryUI\OryUI.agc"
#insert "..\..\..\OryUI\OryUIButton.agc"
#insert "..\..\..\OryUI\OryUIButtonGroup.agc"
#insert "..\..\..\OryUI\OryUICheckbox.agc"
#insert "..\..\..\OryUI\OryUIDialog.agc"
#insert "..\..\..\OryUI\OryUIEditAvatarScreen.agc"
#insert "..\..\..\OryUI\OryUIFloatingActionButton.agc"
#insert "..\..\..\OryUI\OryUIHTTPSQueue.agc"
#insert "..\..\..\OryUI\OryUIInputSpinner.agc"
#insert "..\..\..\OryUI\OryUIList.agc"
#insert "..\..\..\OryUI\OryUIMedia.agc"
#insert "..\..\..\OryUI\OryUIMenu.agc"
#insert "..\..\..\OryUI\OryUINavigationDrawer.agc"
#insert "..\..\..\OryUI\OryUIPagination.agc"
#insert "..\..\..\OryUI\OryUIProgressIndicator.agc"
#insert "..\..\..\OryUI\OryUIScrollBar.agc"
#insert "..\..\..\OryUI\OryUIScrollToTop.agc"
#insert "..\..\..\OryUI\OryUISprite.agc"
#insert "..\..\..\OryUI\OryUISwitch.agc"
#insert "..\..\..\OryUI\OryUITabs.agc"
#insert "..\..\..\OryUI\OryUIText.agc"
#insert "..\..\..\OryUI\OryUITextCard.agc"
#insert "..\..\..\OryUI\OryUITextfield.agc"
#insert "..\..\..\OryUI\OryUITooltip.agc"
#insert "..\..\..\OryUI\OryUITopBar.agc"
#insert "..\..\..\OryUI\OryUITouch.agc"
#insert "..\..\..\OryUI\OryUIDefaultSettings.agc"

#constant constHomeScreen 1
#constant constButtonScreen 2
#constant constButtonGroupScreen 3
#constant constCheckboxScreen 4
#constant constDialogScreen 5
#constant constEditAvatarScreen 6
#constant constFloatingActionButtonScreen 7
#constant constHTTPSQueueScreen 8
#constant constIconsScreen 9
#constant constInputSpinnerScreen 10
#constant constListScreen 11
#constant constMenuScreen 12
#constant constPaginationScreen 13
#constant constProgressIndicatorScreen 14
#constant constScrollBarScreen 15
#constant constScrollToTopScreen 16
#constant constSpriteScreen 17
#constant constSwitchScreen 18
#constant constTabsScreen 19
#constant constTextScreen 20
#constant constTextCardScreen 21
#constant constTooltipScreen 22
#constant constTopBarScreen 23
#constant constMoreSoonScreen 24
#constant constAboutScreen 25

#insert "MainMenu.agc"
#insert "HomeScreen.agc"
#insert "ButtonScreen.agc"
#insert "ButtonGroupScreen.agc"
#insert "CheckboxScreen.agc"
#insert "DialogScreen.agc"
#insert "EditAvatarScreen.agc"
#insert "FloatingActionButtonScreen.agc"
#insert "HTTPSQueueScreen.agc"
#insert "IconsScreen.agc"
#insert "InputSpinnerScreen.agc"
#insert "ListScreen.agc"
#insert "MenuScreen.agc"
#insert "PaginationScreen.agc"
#insert "ProgressIndicatorScreen.agc"
#insert "ScrollBarScreen.agc"
#insert "ScrollToTopScreen.agc"
#insert "SpriteScreen.agc"
#insert "SwitchScreen.agc"
#insert "TabsScreen.agc"
#insert "TextScreen.agc"
#insert "TextCardScreen.agc"
#insert "TooltipScreen.agc"
#insert "TopBarScreen.agc"
#insert "MoreSoonScreen.agc"
#insert "AboutScreen.agc"

OryUISetSyncRate(30, 0)

global debugMode as integer : debugMode = 0
global imgLogo as integer : imgLogo = LoadImage("Logo.png")
global screen as integer
global tabSelected as integer[100]
screen = constHomeScreen

do
	select screen
		case constHomeScreen
			HomeScreen()
		endcase
		case constButtonScreen
			ButtonScreen(tabSelected[screen])
		endcase
		case constButtonGroupScreen
			ButtonGroupScreen(tabSelected[screen])
		endcase
		case constCheckboxScreen
			CheckboxScreen(tabSelected[screen])
		endcase
		case constDialogScreen
			DialogScreen(tabSelected[screen])
		endcase
		case constEditAvatarScreen
			EditAvatarScreen(tabSelected[screen])
		endcase
		case constFloatingActionButtonScreen
			FloatingActionButtonScreen(tabSelected[screen])
		endcase
		case constHTTPSQueueScreen
			HTTPSQueueScreen()
		endcase
		case constIconsScreen
			IconsScreen()
		endcase
		case constInputSpinnerScreen
			InputSpinnerScreen(tabSelected[screen])
		endcase
		case constListScreen
			ListScreen()
		endcase
		case constMenuScreen
			MenuScreen(tabSelected[screen])
		endcase
		case constPaginationScreen
			PaginationScreen()
		endcase
		case constProgressIndicatorScreen
			ProgressIndicatorScreen(tabSelected[screen])
		endcase
		case constScrollBarScreen
			ScrollBarScreen()
		endcase
		case constScrollToTopScreen
			ScrollToTopScreen()
		endcase
		case constSpriteScreen
			SpriteScreen()
		endcase
		case constSwitchScreen
			SwitchScreen(tabSelected[screen])
		endcase
		case constTabsScreen
			TabsScreen()
		endcase
		case constTextScreen
			TextScreen()
		endcase
		case constTextCardScreen
			TextCardScreen(tabSelected[screen])
		endcase
		case constTooltipScreen
			TooltipScreen()
		endcase
		case constTopBarScreen
			TopBarScreen()
		endcase
		case constMoreSoonScreen
			MoreSoonScreen()
		endcase
		case constAboutScreen
			AboutScreen()
		endcase
	endselect
loop

function PrintDebug()
	if (debugMode = 1)
		print("")
		print("fps:" + str(ScreenFPS()))
		print("sprites drawn:" + str(GetManagedSpriteDrawnCount()))
		print("screen:" + str(screen))
		print("tab:" + str(tabSelected[screen]))
	endif
endfunction

function ReadCodeFile(fileName$ as string)
	code$ as string : code$ = ""
	fileID = OpenToRead(fileName$)
	while (FileEOF(fileID) = 0)
		code$ = code$ + ReadString(fileID) + chr(10)
	endwhile
	code$ = ReplaceString(code$, chr(9), "    ", -1)
	code$ = ReplaceString(code$, ":", "[colon]", -1)
	code$ = ReplaceString(code$, ";", "[semicolon]", -1)
	CloseFile(fileID)
endfunction code$

function ShareCode(fileName$ as string)
	code$ as string : code$ = ""
	fileID = OpenToRead(fileName$)
	while (FileEOF(fileID) = 0)
		code$ = code$ + ReadString(fileID) + chr(10)
	endwhile
	CloseFile(fileID)
	ShareText(code$)
endfunction
