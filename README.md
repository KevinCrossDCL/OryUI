# OryUI
OryUI is a UI framework to be used with AGK2 (AppGameKit). It's a work in progress.

With it you can create the following UI components:

* Buttons
* Button Groups (Radio buttons)
* Floating Action Buttons
* Lists (1 or 2 line lists with left and right text, and left thumbnail images if required)
* TextCards (Simple cards, with title and subtitle)
* Textfields

It also contains a number of sprite and text functions including a number of 'pin sprite to' and 'pin text to', as well as a WrapText function.

OryUI at the moment is set to work best with percentage based positioning and sizing. The aim is to eventually have it work just as well with pixel based positioning and sizing.

It's in an early stage of development so you may only want to play around with it and not put it in a live app (although I am). How components are called and displayed may change slightly. All effort would be taken to make sure future changes made will not break old code in your app.

## Installation
To include it in your project add the following line to the top of your script

#insert "OryUI.agc"\n
#insert "OryUIButton.agc"\n
#insert "OryUIButtonGroup.agc"\n
#insert "OryUIFloatingActionButton.agc"
#insert "OryUIList.agc"
#insert "OryUIMedia.agc"
#insert "OryUISprite.agc"
#insert "OryUIText.agc"
#insert "OryUITextCard.agc"
#insert "OryUITextfield.agc"
#insert "OryUITouch.agc"

You will also need to copy the OryUIMedia folder into your media folder as a subfolder.

The above insert line is based on the files being placed in your project folder. You will need to change the insert path if you place the file somewhere else.

A copy of AGK2 is required to use OryUI. https://www.appgamekit.com

## Documentation
I've started on some documentation which can be found here in the Wiki section: https://github.com/KevinCrossDCL/OryUI/wiki

## Feedback / Suggestions
This is the first framework I've attempted to create so any feedback, suggestions, and constructive criticsm will be greatly appreciated. You can contact me on the below forum post or the OryUI Discord server

[AGK Forum thread for OryUI](https://forum.thegamecreators.com/thread/223719)
[OryUI Discord](https://discord.gg/Ebvtt2f)

## License
The OryUI framework is open-source software licensed under the [MIT license](https://opensource.org/licenses/MIT).
