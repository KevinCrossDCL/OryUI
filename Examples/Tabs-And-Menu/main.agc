// Project: Kitchen-Sink
// Created: 20-11-29

SetClearColor(255, 255, 255)
SetOrientationAllowed(1, 1, 0, 0)
SetPrintColor(255, 0, 0)
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
#constant constTabsScreen 2

#insert "MainMenu.agc"
#insert "HomeScreen.agc"
#insert "TabsScreen.agc"

OryUISetSyncRate(30, 0)

global playButtonImage as integer : playButtonImage = LoadImage("PlayButton.png")
global screen as integer
global tabSelected as integer[100]
screen = constHomeScreen

do
	select screen
		case constHomeScreen
			HomeScreen()
		endcase
		case constTabsScreen
			TabsScreen(tabSelected[screen])
		endcase
	endselect
loop