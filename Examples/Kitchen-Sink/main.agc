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
Sync()

#insert "..\..\..\OryUI\OryUI.agc"
#insert "..\..\..\OryUI\OryUIButton.agc"
#insert "..\..\..\OryUI\OryUIButtonGroup.agc"
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
#constant constDialogScreen 4
#constant constEditAvatarScreen 5
#constant constFloatingActionButtonScreen 6
#constant constHTTPSQueueScreen 7
#constant constIconsScreen 8
#constant constInputSpinnerScreen 9
#constant constListScreen 10
#constant constMenuScreen 11
#constant constPaginationScreen 12
#constant constProgressIndicatorScreen 13
#constant constScrollBarScreen 14
#constant constScrollToTopScreen 15
#constant constSpriteScreen 16
#constant constTabsScreen 17
#constant constTextScreen 18
#constant constTextCardScreen 19
#constant constTooltipScreen 20
#constant constTopBarScreen 21
#constant constAboutScreen 22

#insert "MainMenu.agc"
#insert "HomeScreen.agc"
#insert "ButtonScreen.agc"
#insert "ButtonGroupScreen.agc"
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
#insert "TabsScreen.agc"
#insert "TextScreen.agc"
#insert "TextCardScreen.agc"
#insert "TooltipScreen.agc"
#insert "TopBarScreen.agc"
#insert "AboutScreen.agc"

OryUISetSyncRate(30, 0)

global debugMode as integer : debugMode = 0
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
		case constDialogScreen
			DialogScreen(tabSelected[screen])
		endcase
		case constEditAvatarScreen
			EditAvatarScreen()
		endcase
		case constFloatingActionButtonScreen
			FloatingActionButtonScreen()
		endcase
		case constHTTPSQueueScreen
			HTTPSQueueScreen()
		endcase
		case constIconsScreen
			IconsScreen()
		endcase
		case constInputSpinnerScreen
			InputSpinnerScreen()
		endcase
		case constListScreen
			ListScreen()
		endcase
		case constMenuScreen
			MenuScreen()
		endcase
		case constPaginationScreen
			PaginationScreen()
		endcase
		case constProgressIndicatorScreen
			ProgressIndicatorScreen()
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
		case constTabsScreen
			TabsScreen()
		endcase
		case constTextScreen
			TextScreen()
		endcase
		case constTextCardScreen
			TextCardScreen()
		endcase
		case constTooltipScreen
			TooltipScreen()
		endcase
		case constTopBarScreen
			TopBarScreen()
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