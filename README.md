# OryUI
OryUI (v0.12a) is a UI framework to be used with AGK2 (AppGameKit). It's written in Tier 1 and is a work in progress.

With it you can create the following UI components:

* Buttons
* Button Groups (Radio buttons)
* Dialogs
* Edit Avatar Screen
* Floating Action Buttons
* HTTPS Queueing System (not a UI component)
* Input Spinners
* Lists (1 or 2 line lists with left and right text, and thumbnail/icon images if required)
* Menus (Drop down / pop up type menus)
* Navigation Drawers
* Pagination
* Progress Indicators
* Scroll Bars (including Fast Scroller)
* Scroll To Top Button
* Sprites
* Tabs
* Text
* Text Cards (Simple cards, with title and supporting text)
* Textfields
* Tooltips
* Top Bars

OryUI at the moment is set to work with percentage based positioning and sizing. The aim is to eventually have it work just as well with pixel based positioning and sizing (although I don't work with pixel based apps so it's not a high priority for me). This is an important fact to consider because a button 30% wide and 5% high will look much smaller if you're not using percentages because it will actually be sized as 30px wide and 5px high. Another example is the Edit Avatar screen which fills the screen when using percentages, but looks silly on pixel based positioning and sizing because it only fills 100x100 pixels of the screen.

It's in an early stage of development so you may only want to play around with it and not put it in a live app (although I am). How components are called and displayed may change slightly. All effort would be taken to make sure future changes made will not break old code in your app.

OryUI works with programs that use #option_explicit.

## Installation
To include it in your project add the following line to the top of your script

```
#insert "..\OryUI Framework\OryUI.agc"
#insert "..\OryUI Framework\OryUIButton.agc"
#insert "..\OryUI Framework\OryUIButtonGroup.agc"
#insert "..\OryUI Framework\OryUIDialog.agc"
#insert "..\OryUI Framework\OryUIEditAvatarScreen.agc"
#insert "..\OryUI Framework\OryUIFloatingActionButton.agc"
#insert "..\OryUI Framework\OryUIHTTPSQueue.agc"
#insert "..\OryUI Framework\OryUIInputSpinner.agc"
#insert "..\OryUI Framework\OryUIList.agc"
#insert "..\OryUI Framework\OryUIMedia.agc"
#insert "..\OryUI Framework\OryUIMenu.agc"
#insert "..\OryUI Framework\OryUINavigationDrawer.agc"
#insert "..\OryUI Framework\OryUIPagination.agc"
#insert "..\OryUI Framework\OryUIProgressIndicator.agc"
#insert "..\OryUI Framework\OryUIScrollBar.agc"
#insert "..\OryUI Framework\OryUIScrollToTop.agc"
#insert "..\OryUI Framework\OryUISprite.agc"
#insert "..\OryUI Framework\OryUITabs.agc"
#insert "..\OryUI Framework\OryUIText.agc"
#insert "..\OryUI Framework\OryUITextCard.agc"
#insert "..\OryUI Framework\OryUITextfield.agc"
#insert "..\OryUI Framework\OryUITooltip.agc"
#insert "..\OryUI Framework\OryUITopBar.agc"
#insert "..\OryUI Framework\OryUITouch.agc"
#insert "..\OryUI Framework\OryUIDefaultSettings.agc"
```

You will also need to copy the OryUIMedia folder from this repository media folder into your media folder as a subfolder i.e. media\OryUIMedia.

The above insert lines are based on the files being placed in your project folder. You will need to change the insert paths if you place the files somewhere else.

If you want to access the OryUI Touch events then you will need to add OryUIStartTrackingTouch() and OryUIEndTrackingTouch() to your main game/app do loop. This is required for some components like textfields, and the edit avatar screen component.

```
do
	OryUIStartTrackingTouch()

	/*
	Your main game/app code here
	*/
  
	OryUIEndTrackingTouch()
	
	Sync()
loop
```

A copy of AGK2 is required to use OryUI. For more information on AGK2 check out: https://www.appgamekit.com

## Documentation
I've started on some documentation which can be found here in the Wiki section: https://github.com/KevinCrossDCL/OryUI/wiki

## Screenshots
<img src="https://github.com/KevinCrossDCL/OryUI/blob/screenshots/screenshots/Screenshot_20200628-090809_ChastiKey.jpg" height=400>&nbsp;&nbsp;<img src="https://github.com/KevinCrossDCL/OryUI/blob/screenshots/screenshots/Screenshot_20200628-090816_ChastiKey.jpg" height=400>&nbsp;&nbsp;<img src="https://github.com/KevinCrossDCL/OryUI/blob/screenshots/screenshots/Screenshot_20200628-090825_ChastiKey.jpg" height=400>&nbsp;&nbsp;<img src="https://github.com/KevinCrossDCL/OryUI/blob/screenshots/screenshots/Screenshot_20200628-090918_ChastiKey.jpg" height=400>&nbsp;&nbsp;<img src="https://github.com/KevinCrossDCL/OryUI/blob/screenshots/screenshots/Screenshot_20200628-091158_ChastiKey.jpg" height=400>&nbsp;&nbsp;<img src="https://github.com/KevinCrossDCL/OryUI/blob/screenshots/screenshots/Screenshot_20200628-091215_ChastiKey.jpg" height=400>

## Showcase
ChastiKey ([App Store](https://itunes.apple.com/gb/app/chastikey/id1375243924?mt=8) / [Play Store](https://play.google.com/store/apps/details?id=co.uk.kevincross.chastikey))

## Feedback / Suggestions
This is the first framework I've attempted to create so any feedback, suggestions, and constructive criticsm will be greatly appreciated. You can contact me on the below forum post:

* [AGK Forum thread for OryUI](https://forum.thegamecreators.com/thread/223719)


## License
The OryUI framework is open-source software licensed under the [MIT license](https://opensource.org/licenses/MIT).
