
foldstart // OryUIInputSpinner Component (Updated 10/04/2019)

type typeOryUIInputSpinner
	id as integer
	activeButtonColor# as float[4]
	activeIconColor# as float[4]
	autoCorrectIfOutOfRange as integer
	buttons as typeOryUIInputSpinnerButton[2]
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
	if (oryUIDialogVisible = 1) then exitfunction

	if (GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox) = "" and GetEditBoxHasFocus(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox) = 0)
		SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, str(OryUIInputSpinnerCollection[oryUIInputSpinnerID].defaultValue#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals))
	endif
	if (oryUIInputSpinnerID <= OryUIInputSpinnerCollection.length)
		if (GetSpriteExists(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover))
			if (GetPointerPressed())
				if (OryUIGetSwipingVertically() = 0)
					oryUIInputSpinnerAddButton = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIInputSpinnerIvisibleCoverSprite = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIInputSpinnerSubtractButton = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 0
					if (oryUIInputSpinnerAddButton = 1)
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 1
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].pressed = 1
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].timePressed# = timer()
					endif
					if (oryUIInputSpinnerIvisibleCoverSprite = 1)
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 1
					endif
					if (oryUIInputSpinnerSubtractButton = 1)
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 1
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].pressed = 1
						OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].timePressed# = timer()
					endif
				else
					OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 0
				endif
			elseif (OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 1)
				if (GetPointerState())
					if (OryUIGetSwipingVertically() = 0)
						oryUIInputSpinnerAddButton = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIInputSpinnerSubtractButton = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (timer() - OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].timePressed# >= 0.4 and oryUIInputSpinnerAddButton = 1)
							SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, str(valFloat(GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)) + OryUIInputSpinnerCollection[oryUIInputSpinnerID].step#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals))
						endif
						if (timer() - OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].timePressed# >= 0.4 and oryUIInputSpinnerSubtractButton = 1)
							SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, str(valFloat(GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)) - OryUIInputSpinnerCollection[oryUIInputSpinnerID].step#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals))
						endif
					endif
					//if (OryUIGetSwipingVertically())
					//	OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 0
					//endif
				endif
				if (GetPointerReleased())
					if (OryUIGetSwipingVertically() = 0)
						oryUIInputSpinnerAddButton = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIInputSpinnerIvisibleCoverSprite = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIInputSpinnerSubtractButton = GetSpriteHitTest(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 1)
							if (oryUIInputSpinnerAddButton = 1)
								SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, str(valFloat(GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)) + OryUIInputSpinnerCollection[oryUIInputSpinnerID].step#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals))
							endif
							if (oryUIInputSpinnerIvisibleCoverSprite = 1)
								SetEditBoxActive(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 1)
								SetEditBoxFocus(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 1)
							else
								SetEditBoxActive(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 0)
								SetEditBoxFocus(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 0)
							endif
							if (oryUIInputSpinnerSubtractButton = 1)
								SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, str(valFloat(GetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox)) - OryUIInputSpinnerCollection[oryUIInputSpinnerID].step#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals))
							endif
						endif
					endif
					OryUIInputSpinnerCollection[oryUIInputSpinnerID].pressed = 0
				endif
				
			endif
		endif
		if (GetEditBoxExists(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox))
			if (GetEditBoxHasFocus(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox))
				OryUITextfieldIDFocused = oryUIInputSpinnerID
			else
				if (OryUITextfieldIDFocused = oryUIInputSpinnerID) then OryUITextfieldIDFocused = -1
				SetEditBoxActive(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, 0)
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
		if (OryUIParameters.addIconSize#[1] > -999999 or OryUIParameters.addIconSize#[2] > -999999)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, OryUIParameters.addIconSize#[1], OryUIParameters.addIconSize#[2])
			SetSpriteOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon) / 2, GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon) / 2)
			oryUIRepositionInputSpinnerButtons = 1
		endif
		if (OryUIParameters.addIcon$ <> "" and OryUIParameters.addIconID > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].icon$ = lower(OryUIParameters.addIcon$)
			SetSpriteImage(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, OryUIParameters.addIconID)
		elseif (OryUIParameters.addIconID > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].icon$ = "custom"
			SetSpriteImage(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, OryUIParameters.addIconID)
		endif
		if (OryUIParameters.subtractIconSize#[1] > -999999 or OryUIParameters.subtractIconSize#[2] > -999999)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, OryUIParameters.subtractIconSize#[1], OryUIParameters.subtractIconSize#[2])
			SetSpriteOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon) / 2, GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon) / 2)
			oryUIRepositionInputSpinnerButtons = 1
		endif
		if (OryUIParameters.subtractIcon$ <> "" and OryUIParameters.subtractIconID > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].icon$ = lower(OryUIParameters.subtractIcon$)
			SetSpriteImage(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, OryUIParameters.subtractIconID)
		elseif (OryUIParameters.subtractIconID > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].icon$ = "custom"
			SetSpriteImage(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, OryUIParameters.subtractIconID)
		endif
		if (OryUIParameters.textSize# > -999999)
			SetEditBoxTextSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, OryUIParameters.textSize#)
			SetTextSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString, OryUIParameters.textSize#)
		endif
		if (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, OryUIParameters.size#[1], OryUIParameters.size#[2])
		elseif (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, OryUIParameters.size#[1], GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
		elseif (OryUIParameters.size#[1] = -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer), OryUIParameters.size#[2])
		endif
		if (OryUIParameters.size#[1] > -999999 or OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer), GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer), GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
			SetEditBoxSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, GetTextTotalWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString) + GetTextSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString), GetTextSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].txtInvisibleString) * 1.25)
			SetSpriteSize(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, OryUIParameters.size#[1] - GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer) - GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer), GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer))
			SetSpriteOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, GetSpriteWidth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover) / 2, GetSpriteHeight(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover) / 2)
			oryUIRepositionInputSpinnerButtons = 1
		endif
		if (OryUIParameters.position#[1] > -999999 or OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, OryUIParameters.position#[1], OryUIParameters.position#[2])
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
		if (OryUIParameters.activeButtonColor#[1] > -999999 or OryUIParameters.activeButtonColor#[2] > -999999 or OryUIParameters.activeButtonColor#[3] > -999999 or OryUIParameters.activeButtonColor#[4] > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[1] = OryUIParameters.activeButtonColor#[1]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[2] = OryUIParameters.activeButtonColor#[2]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[3] = OryUIParameters.activeButtonColor#[3]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeButtonColor#[4] = OryUIParameters.activeButtonColor#[4]
		endif
		if (OryUIParameters.activeIconColor#[1] > -999999 or OryUIParameters.activeIconColor#[2] > -999999 or OryUIParameters.activeIconColor#[3] > -999999 or OryUIParameters.activeIconColor#[4] > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[1] = OryUIParameters.activeIconColor#[1]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[2] = OryUIParameters.activeIconColor#[2]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[3] = OryUIParameters.activeIconColor#[3]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].activeIconColor#[4] = OryUIParameters.activeIconColor#[4]
		endif
		if (OryUIParameters.autoCorrectIfOutOfRange > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].autoCorrectIfOutOfRange = OryUIParameters.autoCorrectIfOutOfRange
		endif
		if (OryUIParameters.backgroundColor#[1] > -999999 or OryUIParameters.backgroundColor#[2] > -999999 or OryUIParameters.backgroundColor#[3] > -999999 or OryUIParameters.backgroundColor#[4] > -999999)
			SetSpriteColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, OryUIParameters.backgroundColor#[1], OryUIParameters.backgroundColor#[2], OryUIParameters.backgroundColor#[3], OryUIParameters.backgroundColor#[4])
			SetEditBoxBackgroundColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, OryUIParameters.backgroundColor#[1], OryUIParameters.backgroundColor#[2], OryUIParameters.backgroundColor#[3], OryUIParameters.backgroundColor#[4])
		endif
		if (OryUIParameters.decimals > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals = OryUIParameters.decimals
		endif
		if (OryUIParameters.defaultValue# > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].defaultValue# = OryUIParameters.defaultValue#
		endif
		if (OryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer, OryUIParameters.depth)
			SetEditBoxDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, OryUIParameters.depth - 1)
			SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprInvisibleCover, OryUIParameters.depth - 2)
			SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) - 2)
			SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprIcon, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[1].sprContainer) - 1)
			SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].sprContainer) - 2)
			SetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprIcon, GetSpriteDepth(OryUIInputSpinnerCollection[oryUIInputSpinnerID].buttons[2].sprContainer) - 1)
		endif
		if (OryUIParameters.inactiveButtonColor#[1] > -999999 or OryUIParameters.inactiveButtonColor#[2] > -999999 or OryUIParameters.inactiveButtonColor#[3] > -999999 or OryUIParameters.inactiveButtonColor#[4] > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[1] = OryUIParameters.inactiveButtonColor#[1]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[2] = OryUIParameters.inactiveButtonColor#[2]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[3] = OryUIParameters.inactiveButtonColor#[3]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveButtonColor#[4] = OryUIParameters.inactiveButtonColor#[4]
		endif
		if (OryUIParameters.inactiveIconColor#[1] > -999999 or OryUIParameters.inactiveIconColor#[2] > -999999 or OryUIParameters.inactiveIconColor#[3] > -999999 or OryUIParameters.inactiveIconColor#[4] > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[1] = OryUIParameters.inactiveIconColor#[1]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[2] = OryUIParameters.inactiveIconColor#[2]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[3] = OryUIParameters.inactiveIconColor#[3]
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].inactiveIconColor#[4] = OryUIParameters.inactiveIconColor#[4]
		endif
		if (OryUIParameters.inputText$ <> "")
			if (GetEditBoxHasFocus(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox) = 0) // and GetEditBoxText(OryUITextfieldCollection[oryUITextfieldID].editBox) = "")
				SetEditBoxText(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, OryUIParameters.inputText$)
			endif
		endif
		if (OryUIParameters.inputType$ <> "")
			if (OryUIParameters.inputType$ = "integer" or OryUIParameters.inputType$ = "int")

			elseif (OryUIParameters.inputType$ = "decimal" or OryUIParameters.inputType$ = "float")

			endif
		endif
		if (OryUIParameters.max# > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].max# = OryUIParameters.max#
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].maxLimitSet = 1
			SetEditBoxMaxChars(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, len(str(OryUIParameters.max#, OryUIInputSpinnerCollection[oryUIInputSpinnerID].decimals)))
		endif
		if (OryUIParameters.maxLength > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].maxLength = OryUIParameters.maxLength
			SetEditBoxMaxChars(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, OryUIParameters.maxLength)
		endif
		if (OryUIParameters.min# > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].minLimitSet = 1
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].min# = OryUIParameters.min#
		endif
		if (OryUIParameters.step# > -999999)
			OryUIInputSpinnerCollection[oryUIInputSpinnerID].step# = OryUIParameters.step#
		endif
		if (OryUIParameters.textColor#[1] > -999999 or OryUIParameters.textColor#[2] > -999999 or OryUIParameters.textColor#[3] > -999999 or OryUIParameters.textColor#[4] > -999999)
			SetEditBoxTextColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, OryUIParameters.textColor#[1], OryUIParameters.textColor#[2], OryUIParameters.textColor#[3])
			SetEditBoxCursorColor(OryUIInputSpinnerCollection[oryUIInputSpinnerID].editBox, OryUIParameters.textColor#[1], OryUIParameters.textColor#[2], OryUIParameters.textColor#[3])
		endif			
	endif
endfunction

foldend
