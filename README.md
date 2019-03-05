# OryUI
OryUI is a UI framework to be used with AGK2 (AppGameKit). It's written in Tier 1 and is a work in progress.

With it you can create the following UI components:

* Buttons
* Button Groups (Radio buttons)
* Edit Avatar Screen
* Floating Action Buttons
* Lists (1 or 2 line lists with left and right text, and left thumbnail images if required)
* Sprites
* Text
* Text Cards (Simple cards, with title and supporting text)
* Textfields

OryUI at the moment is set to work with percentage based positioning and sizing. The aim is to eventually have it work just as well with pixel based positioning and sizing (although I don't work with pixel based apps so it's not a high priority for me). This is an important fact to consider because a button 30% wide and 5% high will look much smaller if you're not using percentages because it will actually be sized as 30px wide and 5px high. Another example is the Edit Avatar screen which fills the screen when using percentages, but looks silly on pixel based positioning and sizing because it only fills 100x100 pixels of the screen.

It's in an early stage of development so you may only want to play around with it and not put it in a live app (although I am). How components are called and displayed may change slightly. All effort would be taken to make sure future changes made will not break old code in your app.

## Installation
To include it in your project add the following line to the top of your script

```
#insert "OryUI.agc"
#insert "OryUIButton.agc"
#insert "OryUIButtonGroup.agc"
#insert "OryUIEditAvatarScreen.agc"
#insert "OryUIFloatingActionButton.agc"
#insert "OryUIList.agc"
#insert "OryUIMedia.agc"
#insert "OryUISprite.agc"
#insert "OryUIText.agc"
#insert "OryUITextCard.agc"
#insert "OryUITextfield.agc"
#insert "OryUITouch.agc"
```

You will also need to copy the OryUIMedia folder into your media folder as a subfolder i.e. media\OryUIMedia.

The above insert lines are based on the files being placed in your project folder. You will need to change the insert paths if you place the files somewhere else.

If you want to access the OryUI Touch events (only swiping available at the moment) then you will need to add OryUIStartTrackingTouch() and OryUIEndTrackingTouch() to your main game/app do loop. This is required for when using textfields and may become necessary for other components in the future.

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

## Feedback / Suggestions
This is the first framework I've attempted to create so any feedback, suggestions, and constructive criticsm will be greatly appreciated. You can contact me on the below forum post or the OryUI Discord server

* [AGK Forum thread for OryUI](https://forum.thegamecreators.com/thread/223719)
* [OryUI Discord](https://discord.gg/Ebvtt2f)

## License
The OryUI framework is open-source software licensed under the [MIT license](https://opensource.org/licenses/MIT).
