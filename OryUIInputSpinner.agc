
foldstart // OryUIInputSpinner Component (Updated 01/03/2020)

type typeOryUIInputSpinner
	id as integer
	activeButtonColor# as float[4]
	activeIconColor# as float[4]
	autoCorrectIfOutOfRange as integer
	buttons as typeOryUIInputSpinnerButton[2]
	changedValue as integer
	decimals as integer
	defaultValue# as float
	editBox as integer
	inactiveButtonColor# as float[4]
	inactiveIconColor# as float[4]
	max# as float
	maxLength as integer
	maxLimitSet as integer
	min# as float
	minLimitSet as integer
	pressed as integer
	sprContainer as integer
	sprInvisibleCover as integer
	step# as float
	textColor# as float[4]
	textfieldType$ as string
	textInput$ as string
	txtInput as integer
	txtInvisibleString as integer
	visible as integer
endtype

type typeOryUIInputSpinnerButton
	id as integer
	icon$ as string
	pressed as integer
	sprContainer as integer
	sprIcon as integer
	timePressed# as float
endtype

global OryUIInputSpinnerCollection as typeOryUIInputSpinner[]
OryUIInputSpinnerCollection.length = 1
global OryUIInputSpinnerIDFocused as integer : OryUIInputSpinnerIDFocused = -1
global OryUIInputSpinnerIDTextfieldFocused as integer : OryUIInputSpinnerIDTextfieldFocused = -1

function OryUIAnyInputSpinnerFocused()
	local oryUIAnyInputSpinnerFocused
	if (OryUIInputSpinnerIDFocused >= 0) then oryUIAnyInputSpinnerFocused = 1
endfunction oryUIAnyInputSpinnerFocused

function OryUIAnyInputSpinnerTextfieldFocused()
	local oryUIAnyInputSpinnerTextfieldFocused
	if (OryUIInputSpinnerIDTextfieldFocused >= 0) then oryUIAnyInputSpinnerTextfieldFocused = 1
endfunction oryUIAnyInputSpinnerTextfieldFocused

function OryUICreateInputSpinner(oryUIComponentParameters$ as string)
	local oryUIInputSpinnerID as integer
	OryUIInputSpinnerCollection.length = OryUIInputSpinnerCollection.length + 1
	oryUIInputSpinnerID = OryUIInputSpinnerCollection.length
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].id = oryUIInputSpinnerID

	// DEFAULT SETTINGS
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[1] = oryUIDefaults.inputSpinnerButtonActiveColor#[1]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[2] = oryUIDefaults.inputSpinnerButtonActiveColor#[2]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[3] = oryUIDefaults.inputSpinnerButtonActiveColor#[3]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[4] = oryUIDefaults.inputSpinnerButtonActiveColor#[4]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[1] = oryUIDefaults.inputSpinnerButtonActiveIconColor#[1]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[2] = oryUIDefaults.inputSpinnerButtonActiveIconColor#[2]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[3] = oryUIDefaults.inputSpinnerButtonActiveIconColor#[3]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[4] = oryUIDefaults.inputSpinnerButtonActiveIconColor#[4]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].autoCorrectIfOutOfRange = oryUIDefaults.inputSpinnerAutoCorrectIfOutOfRange
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].icon$ = "subtract"
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].icon$ = "add"
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals = 0
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[1] = oryUIDefaults.inputSpinnerButtonInactiveColor#[1]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[2] = oryUIDefaults.inputSpinnerButtonInactiveColor#[2]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[3] = oryUIDefaults.inputSpinnerButtonInactiveColor#[3]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[4] = oryUIDefaults.inputSpinnerButtonInactiveColor#[4]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[1] = oryUIDefaults.inputSpinnerButtonInactiveIconColor#[1]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[2] = oryUIDefaults.inputSpinnerButtonInactiveIconColor#[2]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[3] = oryUIDefaults.inputSpinnerButtonInactiveIconColor#[3]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[4] = oryUIDefaults.inputSpinnerButtonInactiveIconColor#[4]
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].maxLimitSet = 0
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].minLimitSet = 0
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].step# = 1
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].visible = 1

	OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, oryUIDefaults.inputSpinnerWidth#, oryUIDefaults.inputSpinnerHeight#)
	SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, oryUIDefaults.inputSpinnerBackgroundColor#[1], oryUIDefaults.inputSpinnerBackgroundColor#[2], oryUIDefaults.inputSpinnerBackgroundColor#[3], oryUIDefaults.inputSpinnerBackgroundColor#[4])
	SetSpriteOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, 0, 0)

	OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox = CreateEditBox()
	SetEditBoxBackgroundColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, oryUIDefaults.inputSpinnerBackgroundColor#[1], oryUIDefaults.inputSpinnerBackgroundColor#[2], oryUIDefaults.inputSpinnerBackgroundColor#[3], oryUIDefaults.inputSpinnerBackgroundColor#[4])
	SetEditBoxBorderSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 0)
	SetEditBoxCursorColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, oryUIDefaults.inputSpinnerTextColor#[1], oryUIDefaults.inputSpinnerTextColor#[2], oryUIDefaults.inputSpinnerTextColor#[3])
	SetEditBoxUseAlternateInput(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 0)
	SetEditBoxSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, oryUIDefaults.inputSpinnerWidth#, oryUIDefaults.inputSpinnerTextSize# * 1.25)
	SetEditBoxTextColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, oryUIDefaults.inputSpinnerTextColor#[1], oryUIDefaults.inputSpinnerTextColor#[2], oryUIDefaults.inputSpinnerTextColor#[3])
	SetEditBoxTextSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, oryUIDefaults.inputSpinnerTextSize#)
	SetEditBoxPosition(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, GetSpriteX(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer), GetSpriteY(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) + ((GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) - GetEditBoxHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)) / 2))
	SetEditBoxDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) - 1)
	SetEditBoxActive(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 0)
	SetEditBoxInputType(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 1)
	SetEditBoxScissor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, GetSpriteX(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer), GetSpriteY(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer), GetSpriteX(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) + GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer), GetSpriteY(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) + GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))

	OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString = CreateText("Placeholder")
	SetTextSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString, oryUIDefaults.inputSpinnerTextSize#)
	SetTextColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString, 0, 0, 0, 0)
	SetTextAlignment(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString, 0)
	SetTextDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) - 2)
	SetTextPosition(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString, GetSpriteX(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) + 3.4, (GetSpriteY(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) + (GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) / 2)) - (GetTextTotalHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString) / 2))

	OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover = CreateSprite(0)
	SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, oryUIDefaults.inputSpinnerWidth# - (oryUIDefaults.inputSpinnerButtonWidth# * 2), oryUIDefaults.inputSpinnerHeight#)
	SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, 0, 0, 0, 0)
	SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) - 2)
	SetSpriteOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover) / 2, GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover) / 2)
	OryUIPinSpriteToCentreOfSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, 0, 0)
	
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, oryUIDefaults.inputSpinnerButtonWidth#, oryUIDefaults.inputSpinnerButtonHeight#)
	SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) - 2)
	SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[1], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[2], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[3], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[4])
	SetSpriteOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, 0, 0)
	OryUIPinSpriteToTopLeftOfSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, 0, 0)
	
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon = CreateSprite(0)
	SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, oryUIDefaults.inputSpinnerButtonIconWidth#, oryUIDefaults.inputSpinnerButtonIconHeight#) //2.87
	SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[1], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[2], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[3], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[4])
	SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer) - 1)
	SetSpriteImage(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, oryUIIconSubtractImage)
	SetSpriteOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon) / 2, GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon) / 2)
	OryUIPinSpriteToCentreOfSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, 0, 0)

	OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, oryUIDefaults.inputSpinnerButtonWidth#, oryUIDefaults.inputSpinnerButtonHeight#)
	SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) - 2)
	SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[1], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[2], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[3], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[4])
	SetSpriteOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, 0, 0)
	OryUIPinSpriteToTopRightOfSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, 0, 0)
	
	OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon = CreateSprite(0)
	SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, oryUIDefaults.inputSpinnerButtonIconWidth#, oryUIDefaults.inputSpinnerButtonIconHeight#) //2.87
	SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[1], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[2], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[3], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[4])
	SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer) - 1)
	SetSpriteImage(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, oryUIIconAddImage)
	SetSpriteOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon) / 2, GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon) / 2)
	OryUIPinSpriteToCentreOfSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, 0, 0)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateInputSpinner(oryUIInputSpinnerID, oryUIComponentParameters$)
endfunction oryUIInputSpinnerID

function OryUIDeleteInputSpinner(oryUIInputSpinnerID as integer)
	if (oryUIInputSpinnerID <= OryUIInputSpinnerCollection.length)
		DeleteSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer)
		DeleteEditBox(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)
		DeleteSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover)
		DeleteText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString)
		DeleteSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer)
		DeleteSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon)
		DeleteSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer)
		DeleteSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon)
	endif
endfunction

function OryUIGetInputSpinnerChangedValue(OryUIInputSpinnerID as integer)
	local oryUIInputSpinnerChangedValue as integer
	if (OryUIInputSpinnerCollection[oryUIInputSpinnerID].changedValue = 1)
		oryUIInputSpinnerChangedValue = 1
	endif
endfunction oryUIInputSpinnerChangedValue

function OryUIGetInputSpinnerDefaultFloat(OryUIInputSpinnerID as integer)
	local oryUIInputSpinnerDefaultFloat# as float
	if (oryUIInputSpinnerID <= OryUIInputSpinnerCollection.length)
		if (GetSpriteExists(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
			oryUIInputSpinnerDefaultFloat# = OryUIInputSpinnerCollection[oryUIInputSpinnerID].defaultValue#
		endif
	endif
endfunction oryUIInputSpinnerDefaultFloat#

function OryUIGetInputSpinnerDefaultInteger(OryUIInputSpinnerID as integer)
	local oryUIInputSpinnerDefaultInteger as integer
	if (oryUIInputSpinnerID <= OryUIInputSpinnerCollection.length)
		if (GetSpriteExists(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
			oryUIInputSpinnerDefaultInteger = val(str(OryUIInputSpinnerCollection[oryUIInputSpinnerID].defaultValue#))
		endif
	endif
endfunction oryUIInputSpinnerDefaultInteger

function OryUIGetInputSpinnerHasFocus(oryUIInputSpinnerID as integer)
	local oryUIInputSpinnerHasFocus as integer
	if (GetEditBoxHasFocus(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox))
		oryUIInputSpinnerHasFocus = 1
	endif
endfunction oryUIInputSpinnerHasFocus

function OryUIGetInputSpinnerHeight(oryUIInputSpinnerID as integer)
	local oryUIInputSpinnerHeight#
	oryUIInputSpinnerHeight# = GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer)
endfunction oryUIInputSpinnerHeight#

function OryUIGetInputSpinnerFloat(oryUIInputSpinnerID as integer)
	local OryUIGetInputSpinnerFloat#
	if (oryUIInputSpinnerID <= OryUIInputSpinnerCollection.length)
		if (GetSpriteExists(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
			OryUIGetInputSpinnerFloat# = valFloat(GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox))
		endif
	endif
endfunction OryUIGetInputSpinnerFloat#

function OryUIGetInputSpinnerInteger(oryUIInputSpinnerID as integer)
	local oryUIInputSpinnerInteger
	if (oryUIInputSpinnerID <= OryUIInputSpinnerCollection.length)
		if (GetSpriteExists(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
			oryUIInputSpinnerInteger = val(GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox))
		endif
	endif
endfunction oryUIInputSpinnerInteger

function OryUIGetInputSpinnerString(oryUIInputSpinnerID as integer)
	local oryUIInputSpinnerString$
	if (oryUIInputSpinnerID <= OryUIInputSpinnerCollection.length)
		if (GetSpriteExists(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
			oryUIInputSpinnerString$ = GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)
		endif
	endif
endfunction oryUIInputSpinnerString$

function OryUIGetInputSpinnerVisible(oryUIInputSpinnerID as integer)

endfunction OryUIInputSpinnerCollection[oryUIInputSpinnerID].visible

function OryUIGetInputSpinnerWidth(oryUIInputSpinnerID as integer)
	local oryUIInputSpinnerWidth#
	if (oryUIInputSpinnerID <= OryUIInputSpinnerCollection.length)
		if (GetSpriteExists(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
			oryUIInputSpinnerWidth# = GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer)
		endif
	endif
endfunction oryUIInputSpinnerWidth#

function OryUIGetInputSpinnerX(oryUIInputSpinnerID as integer)
	local oryUIInputSpinnerX# as float
	if (OryUIInputSpinnerCollection[oryUIInputSpinnerID].visible = 1)
		oryUIInputSpinnerX# = GetSpriteX(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer)
	endif
endfunction oryUIInputSpinnerX#

function OryUIGetInputSpinnerY(oryUIInputSpinnerID as integer)
	local oryUIInputSpinnerY# as float
	if (OryUIInputSpinnerCollection[oryUIInputSpinnerID].visible = 1)
		oryUIInputSpinnerY# = GetSpriteY(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer)
	endif
endfunction oryUIInputSpinnerY#

function OryUIInsertInputSpinnerListener(oryUIInputSpinnerID as integer)
	if (oryUIScrimVisible = 1) then exitfunction

	if (GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox) = "" and GetEditBoxHasFocus(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox) = 0)
		SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, str(OryUIInputSpinnerCollection[oryUIInputSpinnerID].defaultValue#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals))
	endif
	if (oryUIInputSpinnerID <= OryUIInputSpinnerCollection.length)
		if (OryUIGetSwipingVertically() = 0)
			if (GetEditBoxExists(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox))
				if (GetEditBoxHasFocus(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox))
					OryUIInputSpinnerIDFocused = oryUIInputSpinnerID
					OryUIInputSpinnerIDTextfieldFocused = oryUIInputSpinnerID
				else
					if (OryUIInputSpinnerIDFocused = oryUIInputSpinnerID)
						OryUIInputSpinnerIDFocused = -1
						OryUIInputSpinnerIDTextfieldFocused = -1
					endif
					SetEditBoxActive(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 0)
				endif
			endif
		endif
		OryUIInputSpinnerCollection[oryUIInputSpinnerID].changedValue = -1
		if (GetSpriteExists(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover))
			if (OryUIGetSwipingVertically() = 0)
				if (GetPointerPressed())
					oryUIInputSpinnerAddButton = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIInputSpinnerInvisibleCoverSprite = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIInputSpinnerSubtractButton = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (oryUIInputSpinnerAddButton = 1 and OryUIGetSpritePressed() <> OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer and OryUIGetSpritePressed() <> OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon)
						oryUIInputSpinnerAddButton = 0
					endif
					if (oryUIInputSpinnerInvisibleCoverSprite = 1 and OryUIGetSpritePressed() <> OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover)
						oryUIInputSpinnerInvisibleCoverSprite = 0
					endif
					if (oryUIInputSpinnerSubtractButton = 1 and OryUIGetSpritePressed() <> OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer and OryUIGetSpritePressed() <> OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon)
						oryUIInputSpinnerSubtractButton = 0
					endif
					OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 0
					if (oryUIInputSpinnerAddButton = 1)
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 1
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].pressed = 1
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].timePressed# = timer()
						OryUIInputSpinnerIDFocused = oryUIInputSpinnerID
					endif
					if (oryUIInputSpinnerInvisibleCoverSprite = 1)
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 1
						OryUIInputSpinnerIDFocused = oryUIInputSpinnerID
					endif
					if (oryUIInputSpinnerSubtractButton = 1)
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 1
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].pressed = 1
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].timePressed# = timer()
						OryUIInputSpinnerIDFocused = oryUIInputSpinnerID
					endif
				elseif (OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 1)
					if (GetPointerState())
						oryUIInputSpinnerAddButton = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIInputSpinnerSubtractButton = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (timer() - OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].timePressed# >= 0.4 and oryUIInputSpinnerAddButton = 1)
							SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, str(valFloat(GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)) + OryUIInputSpinnerCollection[oryUIInputSpinnerID].step#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals))
							OryUIInputSpinnerCollection[oryUIInputSpinnerID].changedValue = 1
							OryUIInputSpinnerIDFocused = oryUIInputSpinnerID
						endif
						if (timer() - OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].timePressed# >= 0.4 and oryUIInputSpinnerSubtractButton = 1)
							SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, str(valFloat(GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)) - OryUIInputSpinnerCollection[oryUIInputSpinnerID].step#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals))
							OryUIInputSpinnerCollection[oryUIInputSpinnerID].changedValue = 1
							OryUIInputSpinnerIDFocused = oryUIInputSpinnerID
						endif
					endif
					if (GetPointerReleased())
						oryUIInputSpinnerAddButton = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIInputSpinnerInvisibleCoverSprite = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIInputSpinnerSubtractButton = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 1)
							if (oryUIInputSpinnerAddButton = 1 and OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].pressed = 1)
								SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, str(valFloat(GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)) + OryUIInputSpinnerCollection[oryUIInputSpinnerID].step#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals))
							endif
							if (oryUIInputSpinnerInvisibleCoverSprite = 1)
								SetEditBoxActive(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 1)
								SetEditBoxFocus(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 1)
							else
								SetEditBoxActive(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 0)
								SetEditBoxFocus(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 0)
							endif
							if (oryUIInputSpinnerSubtractButton = 1 and OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].pressed = 1)
								SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, str(valFloat(GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)) - OryUIInputSpinnerCollection[oryUIInputSpinnerID].step#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals))
							endif
							OryUIInputSpinnerCollection[oryUIInputSpinnerID].changedValue = 1
						endif
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 0
					endif
				endif
			else
				OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 0
				OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].pressed = 0
				OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].timePressed# = timer()
				OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].pressed = 0
				OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].timePressed# = timer()
			endif
		endif
	endif
	SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[1], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[2], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[3], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[4])
	SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[1], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[2], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[3], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[4])
	SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[1], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[2], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[3], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[4])
	SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[1], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[2], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[3], OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[4])
	if (OryUIInputSpinnerCollection[oryUIInputSpinnerID].minLimitSet = 1 and OryUIInputSpinnerCollection[oryUIInputSpinnerID].autoCorrectIfOutOfRange = 1 and GetEditBoxHasFocus(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox) = 0)
		if (valFloat(GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)) <= OryUIInputSpinnerCollection[oryUIInputSpinnerID].min#)
			SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, str(OryUIInputSpinnerCollection[oryUIInputSpinnerID].min#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals))
			SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[1], OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[2], OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[3], OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[4])
			SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[1], OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[2], OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[3], OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[4])
		endif
	endif
	if (OryUIInputSpinnerCollection[oryUIInputSpinnerID].maxLimitSet = 1 and OryUIInputSpinnerCollection[oryUIInputSpinnerID].autoCorrectIfOutOfRange = 1 and GetEditBoxHasFocus(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox) = 0)
		if (valFloat(GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)) >= OryUIInputSpinnerCollection[oryUIInputSpinnerID].max#)
			SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, str(OryUIInputSpinnerCollection[oryUIInputSpinnerID].max#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals))
			SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[1], OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[2], OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[3], OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[4])
			SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[1], OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[2], OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[3], OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[4])
		endif
	endif
	SetTextString(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString, GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox))
	SetEditBoxSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, GetTextTotalWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString) + oryUIDefaults.inputSpinnerTextSize#, GetEditBoxHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox))
	SetEditBoxPosition(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, GetSpriteX(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) + (GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) / 2) + (oryUIDefaults.inputSpinnerTextSize# / 2)- (GetEditBoxWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox) / 2), GetEditBoxY(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox))
	SetEditBoxScissor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, GetSpriteX(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer), GetSpriteY(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer), GetSpriteX(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) + GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer), GetSpriteY(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) + GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
endfunction

function OryUIUpdateInputSpinner(oryUIInputSpinnerID as integer, oryUIComponentParameters$ as string)
	local oryUIRepositionInputSpinnerButtons as integer
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		oryUIRepositionInputSpinnerButtons = 0
		if (oryUIParameters.addIconSize#[1] > -999999 or oryUIParameters.addIconSize#[2] > -999999)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, oryUIParameters.addIconSize#[1], oryUIParameters.addIconSize#[2])
			SetSpriteOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon) / 2, GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon) / 2)
			oryUIRepositionInputSpinnerButtons = 1
		endif
		if (oryUIParameters.addIcon$ <> "" and oryUIParameters.addIconID > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].icon$ = lower(oryUIParameters.addIcon$)
			SetSpriteImage(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, oryUIParameters.addIconID)
		elseif (oryUIParameters.addIconID > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].icon$ = "custom"
			SetSpriteImage(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, oryUIParameters.addIconID)
		endif
		if (oryUIParameters.subtractIconSize#[1] > -999999 or oryUIParameters.subtractIconSize#[2] > -999999)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, oryUIParameters.subtractIconSize#[1], oryUIParameters.subtractIconSize#[2])
			SetSpriteOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon) / 2, GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon) / 2)
			oryUIRepositionInputSpinnerButtons = 1
		endif
		if (oryUIParameters.subtractIcon$ <> "" and oryUIParameters.subtractIconID > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].icon$ = lower(oryUIParameters.subtractIcon$)
			SetSpriteImage(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, oryUIParameters.subtractIconID)
		elseif (oryUIParameters.subtractIconID > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].icon$ = "custom"
			SetSpriteImage(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, oryUIParameters.subtractIconID)
		endif
		if (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, oryUIParameters.size#[1], oryUIParameters.size#[2])
		elseif (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, oryUIParameters.size#[1], GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
		elseif (oryUIParameters.size#[1] = -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer), oryUIParameters.size#[2])
		endif
		if (oryUIParameters.size#[2] > -999999)
			SetEditBoxTextSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, oryUIParameters.size#[2] * 0.75)
			SetTextSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString, oryUIParameters.size#[2] * 0.75)
		endif
		if (oryUIParameters.textSize# > -999999)
			SetEditBoxTextSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, oryUIParameters.textSize#)
			SetTextSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString, oryUIParameters.textSize#)
		endif
		if (oryUIParameters.size#[1] > -999999 or oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer), GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer), GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
			SetEditBoxSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, GetTextTotalWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString) + GetTextSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString), GetTextSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString) * 1.25)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, oryUIParameters.size#[1] - GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer) - GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer), GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
			SetSpriteOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover) / 2, GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover) / 2)
			oryUIRepositionInputSpinnerButtons = 1
		endif
		if (oryUIParameters.position#[1] > -999999 or oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
			SetEditBoxPosition(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, GetSpriteX(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer), GetSpriteY(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) + ((GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) - GetEditBoxHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)) / 2))
			OryUIPinSpriteToCentreOfSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, 0, 0)
			oryUIRepositionInputSpinnerButtons = 1
		endif
		if (oryUIRepositionInputSpinnerButtons = 1)
			OryUIPinSpriteToTopLeftOfSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, 0, 0)
			OryUIPinSpriteToCentreOfSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, 0, 0)
			OryUIPinSpriteToTopRightOfSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, 0, 0)
			OryUIPinSpriteToCentreOfSprite(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, 0, 0)
		endif
		
		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.activeButtonColor#[1] > -999999 or oryUIParameters.activeButtonColor#[2] > -999999 or oryUIParameters.activeButtonColor#[3] > -999999 or oryUIParameters.activeButtonColor#[4] > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[1] = oryUIParameters.activeButtonColor#[1]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[2] = oryUIParameters.activeButtonColor#[2]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[3] = oryUIParameters.activeButtonColor#[3]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[4] = oryUIParameters.activeButtonColor#[4]
		endif
		if (oryUIParameters.activeIconColor#[1] > -999999 or oryUIParameters.activeIconColor#[2] > -999999 or oryUIParameters.activeIconColor#[3] > -999999 or oryUIParameters.activeIconColor#[4] > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[1] = oryUIParameters.activeIconColor#[1]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[2] = oryUIParameters.activeIconColor#[2]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[3] = oryUIParameters.activeIconColor#[3]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[4] = oryUIParameters.activeIconColor#[4]
		endif
		if (oryUIParameters.autoCorrectIfOutOfRange > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].autoCorrectIfOutOfRange = oryUIParameters.autoCorrectIfOutOfRange
		endif
		if (oryUIParameters.backgroundColor#[1] > -999999 or oryUIParameters.backgroundColor#[2] > -999999 or oryUIParameters.backgroundColor#[3] > -999999 or oryUIParameters.backgroundColor#[4] > -999999)
			SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, oryUIParameters.backgroundColor#[1], oryUIParameters.backgroundColor#[2], oryUIParameters.backgroundColor#[3], oryUIParameters.backgroundColor#[4])
			SetEditBoxBackgroundColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, oryUIParameters.backgroundColor#[1], oryUIParameters.backgroundColor#[2], oryUIParameters.backgroundColor#[3], oryUIParameters.backgroundColor#[4])
		endif
		if (oryUIParameters.decimals > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals = oryUIParameters.decimals
		endif
		if (oryUIParameters.defaultValue# > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].defaultValue# = oryUIParameters.defaultValue#
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, oryUIParameters.depth)
			SetEditBoxDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, oryUIParameters.depth - 1)
			SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, oryUIParameters.depth - 2)
			SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) - 2)
			SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer) - 1)
			SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) - 2)
			SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer) - 1)
		endif
		if (oryUIParameters.inactiveButtonColor#[1] > -999999 or oryUIParameters.inactiveButtonColor#[2] > -999999 or oryUIParameters.inactiveButtonColor#[3] > -999999 or oryUIParameters.inactiveButtonColor#[4] > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[1] = oryUIParameters.inactiveButtonColor#[1]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[2] = oryUIParameters.inactiveButtonColor#[2]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[3] = oryUIParameters.inactiveButtonColor#[3]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[4] = oryUIParameters.inactiveButtonColor#[4]
		endif
		if (oryUIParameters.inactiveIconColor#[1] > -999999 or oryUIParameters.inactiveIconColor#[2] > -999999 or oryUIParameters.inactiveIconColor#[3] > -999999 or oryUIParameters.inactiveIconColor#[4] > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[1] = oryUIParameters.inactiveIconColor#[1]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[2] = oryUIParameters.inactiveIconColor#[2]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[3] = oryUIParameters.inactiveIconColor#[3]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[4] = oryUIParameters.inactiveIconColor#[4]
		endif
		if (oryUIParameters.inputText$ <> "")
			if (lower(oryUIParameters.inputText$) = "null") then oryUIParameters.inputText$ = ""
			if (GetEditBoxHasFocus(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox) = 0) // and GetEditBoxText(OryUITextfieldCollection[oryUITextfieldID].editBox) = "")
				SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, oryUIParameters.inputText$)
			endif
		endif
		if (oryUIParameters.inputType$ <> "")
			if (lower(oryUIParameters.inputType$) = "null") then oryUIParameters.inputType$ = ""
			if (oryUIParameters.inputType$ = "integer" or oryUIParameters.inputType$ = "int")

			elseif (oryUIParameters.inputType$ = "decimal" or oryUIParameters.inputType$ = "float")

			endif
		endif
		if (oryUIParameters.max# > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].max# = oryUIParameters.max#
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].maxLimitSet = 1
			SetEditBoxMaxChars(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, len(str(oryUIParameters.max#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals)))
		endif
		if (oryUIParameters.maxLength > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].maxLength = oryUIParameters.maxLength
			SetEditBoxMaxChars(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, oryUIParameters.maxLength)
		endif
		if (oryUIParameters.min# > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].minLimitSet = 1
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].min# = oryUIParameters.min#
		endif
		if (oryUIParameters.step# > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].step# = oryUIParameters.step#
		endif
		if (oryUIParameters.textColor#[1] > -999999 or oryUIParameters.textColor#[2] > -999999 or oryUIParameters.textColor#[3] > -999999 or oryUIParameters.textColor#[4] > -999999)
			SetEditBoxTextColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, oryUIParameters.textColor#[1], oryUIParameters.textColor#[2], oryUIParameters.textColor#[3])
			SetEditBoxCursorColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, oryUIParameters.textColor#[1], oryUIParameters.textColor#[2], oryUIParameters.textColor#[3])
		endif			
	endif
endfunction

foldend
