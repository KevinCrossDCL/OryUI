<p align="center">
  <img width="150" src="https://github.com/KevinCrossDCL/OryUI/blob/master/Logos/Logo-Transparent.png" alt="OryUI logo">
</p>

# OryUI
OryUI (v0.17a) is a UI framework to be used with AGK2 (AppGameKit). It's written in Tier 1 and is a work in progress.

With it you can create the following UI widgets:

* Buttons
* Button Groups (Radio buttons)
* Checkboxes
* Dialogs
* Edit Avatar Screen
* Floating Action Buttons
* HTTPS Queueing System (not a UI widget)
* Input Spinners
* Lists (1 or 2 line lists with left and right text, and thumbnail/icon images if required)
* Menus (Drop down / pop up type menus)
* Navigation Drawers
* Pagination
* Progress Indicators
* Scroll Bars (including Fast Scroller)
* Scroll To Top Button
* Sprites
* Switches
* Tabs
* Text
* Text Cards (Simple cards, with title and supporting text)
* Textfields
* Tooltips
* Top Bars

OryUI at the moment is set to work with percentage based positioning and sizing. The aim is to eventually have it work just as well with pixel based positioning and sizing (although I don't work with pixel based apps so it's not a high priority for me). This is an important fact to consider because a button 30% wide and 5% high will look much smaller if you're not using percentages because it will actually be sized as 30px wide and 5px high. Another example is the Edit Avatar screen which fills the screen when using percentages, but looks silly on pixel based positioning and sizing because it only fills 100x100 pixels of the screen.

How widgets are called and displayed may change slightly. All effort would be taken to make sure future changes made will not break old code in your app.

This repository includes an examples folder with a couple of AGK projects, including a kitchen sink demo which will eventually showcase most of the OryUI widgets. At the moment the kitchen sink only contains examples of a few widgets. More will be added over time.

OryUI will work with your programs if you use #option_explicit.

## Installation
To include it in your project add the following line to the top of your script

```
#insert "..\OryUI\OryUI.agc"
#insert "..\OryUI\OryUIButton.agc"
#insert "..\OryUI\OryUIButtonGroup.agc"
#insert "..\OryUI\OryUICheckbox.agc"
#insert "..\OryUI\OryUIDialog.agc"
#insert "..\OryUI\OryUIEditAvatarScreen.agc"
#insert "..\OryUI\OryUIFloatingActionButton.agc"
#insert "..\OryUI\OryUIHTTPSQueue.agc"
#insert "..\OryUI\OryUIInputSpinner.agc"
#insert "..\OryUI\OryUIList.agc"
#insert "..\OryUI\OryUIMedia.agc"
#insert "..\OryUI\OryUIMenu.agc"
#insert "..\OryUI\OryUINavigationDrawer.agc"
#insert "..\OryUI\OryUIPagination.agc"
#insert "..\OryUI\OryUIProgressIndicator.agc"
#insert "..\OryUI\OryUIScrollBar.agc"
#insert "..\OryUI\OryUIScrollToTop.agc"
#insert "..\OryUI\OryUISprite.agc"
#insert "..\OryUI\OryUISwitch.agc"
#insert "..\OryUI\OryUITabs.agc"
#insert "..\OryUI\OryUIText.agc"
#insert "..\OryUI\OryUITextCard.agc"
#insert "..\OryUI\OryUITextfield.agc"
#insert "..\OryUI\OryUITooltip.agc"
#insert "..\OryUI\OryUITopBar.agc"
#insert "..\OryUI\OryUITouch.agc"
#insert "..\OryUI\OryUIDefaultSettings.agc"
```

You will also need to copy the OryUIMedia folder from this repository media folder into your media folder as a subfolder i.e. media\OryUIMedia.

The above insert lines are based on the files being placed in your project folder. You will need to change the insert paths if you place the files somewhere else.

A copy of AGK2 is required to use OryUI. For more information on AGK2 check out: https://www.appgamekit.com

For best results run your OryUI designed app on a mobile device via AGK Broadcast, or compile as APK/IPA and install the app on your device. You may experience flickering/bouncing when running the app in AGK Studio on your computer, at least on Mac OS. The flickering/bouncing doesn't happen on the device. Hopefully someone will find the reason for this bug and offer a solution in the future.

## Example Main.agc
```
// Add the above OryUI #insert lines here along with the usual Set functions that get included in a new .agc file i.e.: SetScissor(0, 0, 0, 0)

#constant constHomeScreen 1
#constant constAboutScreen 2

#insert "HomeScreen.agc"
#insert "AboutScreen.agc"

OryUISetSyncRate(30, 0)

global screen as integer
screen = constHomeScreen

do
	select screen
		case constHomeScreen
			HomeScreen()
		endcase
		case constAboutScreen
			AboutScreen()
		endcase
	endselect
loop

```

## Example HomeScreen.agc File
```
function HomeScreen()
	SetViewOffset(0, 0)

	// Initiate Screen
	contentHeight# as float

	topBar as integer : topBar = OryUICreateTopBar("text:Home;depth:10")
	contentHeight# = contentHeight# + OryUIGetTopBarHeight(topBar) + 2
	
	button as integer : button = OryUICreateButton("text:About;offset:center;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button)
	
	// Manage Screen
	do
		OryUIInsertTopBarListener(topBar)
		if (OryUIGetButtonReleased(button))
			screen = constAboutScreen
		endif
		
		// Change Screen?
		if (screen <> constHomeScreen) then exit

		// Scroll Limits
		OryUISetScreenScrollLimits(0, 0, 0, contentHeight#)
		
		OryUISync()
	loop
	
	// Delete all OryUI created widgets
	OryUIDeleteAllWidgets()
endfunction
```

## Example AboutScreen.agc File
```
function AboutScreen()
	SetViewOffset(0, 0)

	// Initiate Screen
	contentHeight# as float

	topBar as integer : topBar = OryUICreateTopBar("text:About;depth:10")
	contentHeight# = contentHeight# + OryUIGetTopBarHeight(topBar) + 2
	
	button as integer : button = OryUICreateButton("text:Home;offset:center;position:50," + str(contentHeight#) + ";depth:20")
	contentHeight# = contentHeight# + OryUIGetButtonHeight(button)
	
	// Manage Screen
	do
		OryUIInsertTopBarListener(topBar)
		if (OryUIGetButtonReleased(button))
			screen = constHomeScreen
		endif
		
		// Change Screen?
		if (screen <> constAboutScreen) then exit

		// Scroll Limits
		OryUISetScreenScrollLimits(0, 0, 0, contentHeight#)
		
		OryUISync()
	loop
	
	// Delete all OryUI created widgets
	OryUIDeleteAllWidgets()
endfunction
```

## Documentation
I've started on some documentation which can be found here in the Wiki section: https://github.com/KevinCrossDCL/OryUI/wiki

## Contributing

Please check out the [How to contribute to OryUI guide](https://github.com/KevinCrossDCL/OryUI/blob/master/CONTRIBUTING.md) for guidelines about how to proceed.

## Screenshots
<img src="https://github.com/KevinCrossDCL/OryUI/blob/screenshots/screenshots/Screenshot_20200628-090809_ChastiKey.jpg" height=400>&nbsp;&nbsp;<img src="https://github.com/KevinCrossDCL/OryUI/blob/screenshots/screenshots/Screenshot_20200628-090816_ChastiKey.jpg" height=400>&nbsp;&nbsp;<img src="https://github.com/KevinCrossDCL/OryUI/blob/screenshots/screenshots/Screenshot_20200628-090825_ChastiKey.jpg" height=400>&nbsp;&nbsp;<img src="https://github.com/KevinCrossDCL/OryUI/blob/screenshots/screenshots/Screenshot_20200628-090918_ChastiKey.jpg" height=400>&nbsp;&nbsp;<img src="https://github.com/KevinCrossDCL/OryUI/blob/screenshots/screenshots/Screenshot_20200628-091158_ChastiKey.jpg" height=400>&nbsp;&nbsp;<img src="https://github.com/KevinCrossDCL/OryUI/blob/screenshots/screenshots/Screenshot_20200628-091215_ChastiKey.jpg" height=400>

## Feedback / Suggestions
This is the first framework I've attempted to create so any feedback, suggestions, and constructive criticsm will be greatly appreciated. You can contact me on the below forum post:

* [AGK Forum thread for OryUI](https://forum.thegamecreators.com/thread/223719)

## License
The OryUI framework is open-source software licensed under the [MIT license](https://opensource.org/licenses/MIT).

The OryUI framework uses icons from the Material icons set. [Material icons](https://material.io/resources/icons/?style=baseline)
