
#option_explicit

SetErrorMode(2)

SetWindowTitle("OryUI Framework")
SetWindowAllowResize(1)
SetOrientationAllowed(1, 1, 1, 1)
SetSyncRate(60, 0)
SetScissor(0, 0, 0, 0)
UseNewDefaultFonts(1)

#insert "OryUI.agc"
#insert "OryUIButton.agc"
#insert "OryUIButtonGroup.agc"
#insert "OryUIDialog.agc"
#insert "OryUIEditAvatarScreen.agc"
#insert "OryUIFloatingActionButton.agc"
#insert "OryUIHTTPSQueue.agc"
#insert "OryUIInputSpinner.agc"
#insert "OryUIList.agc"
#insert "OryUIMedia.agc"
#insert "OryUIMenu.agc"
#insert "OryUINavigationDrawer.agc"
#insert "OryUIPagination.agc"
#insert "OryUIProgressIndicator.agc"
#insert "OryUIScrollBar.agc"
#insert "OryUIScrollToTop.agc"
#insert "OryUISprite.agc"
#insert "OryUITabs.agc"
#insert "OryUIText.agc"
#insert "OryUITextCard.agc"
#insert "OryUITextfield.agc"
#insert "OryUITooltip.agc"
#insert "OryUITopBar.agc"
#insert "OryUITouch.agc"
#insert "OryUIDefaultSettings.agc"

do
	
	OryUISync()
loop
