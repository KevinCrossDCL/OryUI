
foldstart // OryUIDialog Widget (Updated 07/07/2020)

type typeOryUIDialog
	id as integer
	autoHeight as integer
	buttonPressed
	buttonReleased as integer
	buttons as typeOryUIDialogButton[]
	checkboxAlignment as integer
	checkboxPressed as integer
	checked as integer
	checkedImage as integer
	decisionRequired as integer
	flexButtons as integer
	//scrimPressed as integer
	//scrimReleased as integer
	scrolling as integer
	showCheckbox as integer
	sprCheckbox as integer
	sprContainer as integer
	sprScrim as integer
	stackButtons as integer
	txtCheckbox as integer
	txtSupportingText as integer
	txtTitle as integer
	uncheckedImage as integer
	visible as integer
endtype

type typeOryUIDialogButton
	id as integer
	name$ as string
	pressed as integer
	released as integer
	sprContainer as integer
	txtLabel as integer
endtype

global OryUIDialogCollection as typeOryUIDialog[]
OryUIDialogCollection.length = 1

function OryUICreateDialog(oryUIWidgetParameters$ as string)
	local oryUIDialogID as integer
	
	OryUIDialogCollection.length = OryUIDialogCollection.length + 1
	oryUIDialogID = OryUIDialogCollection.length
	OryUIDialogCollection[oryUIDialogID].id = oryUIDialogID

	oryUICreatedWidgets.insert(OryUIAddCreatedWidget(oryUIDialogID, "Dialog"))

	// DEFAULT SETTINGS
	OryUIDialogCollection[oryUIDialogID].autoHeight = oryUIDefaults.dialogAutoHeight
	OryUIDialogCollection[oryUIDialogID].checkboxAlignment = oryUIDefaults.dialogCheckboxAlignment
	OryUIDialogCollection[oryUIDialogID].checkedImage = oryUIDefaults.dialogCheckboxCheckedImage
	OryUIDialogCollection[oryUIDialogID].decisionRequired = 1
	OryUIDialogCollection[oryUIDialogID].flexButtons = oryUIDefaults.dialogFlexButtons
	OryUIDialogCollection[oryUIDialogID].scrolling = 0
	OryUIDialogCollection[oryUIDialogID].stackButtons = oryUIDefaults.dialogStackButtons
	OryUIDialogCollection[oryUIDialogID].uncheckedImage = oryUIDefaults.dialogCheckboxUncheckedImage
	
	OryUIDialogCollection[oryUIDialogID].sprScrim = CreateSprite(0)
	SetSpriteSize(OryUIDialogCollection[oryUIDialogID].sprScrim, 100, abs(GetScreenBoundsTop() * 2) + 100)
	SetSpriteDepth(OryUIDialogCollection[oryUIDialogID].sprScrim, oryUIDefaults.dialogDepth)
	SetSpriteColor(OryUIDialogCollection[oryUIDialogID].sprScrim, oryUIDefaults.dialogScrimColor#[1], oryUIDefaults.dialogScrimColor#[2], oryUIDefaults.dialogScrimColor#[3], oryUIDefaults.dialogScrimColor#[4])
	SetSpriteOffset(OryUIDialogCollection[oryUIDialogID].sprScrim, 0, 0)
	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprScrim, -999999, -999999)
	SetSpritePhysicsOff(OryUIDialogCollection[oryUIDialogID].sprScrim)
	
	OryUIDialogCollection[oryUIDialogID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIDefaults.dialogWidth#, oryUIDefaults.dialogHeight#)
	SetSpriteDepth(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIDefaults.dialogDepth - 1)
	SetSpriteColor(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIDefaults.dialogColor#[1], oryUIDefaults.dialogColor#[2], oryUIDefaults.dialogColor#[3], oryUIDefaults.dialogColor#[4])
	SetSpriteOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, -999999, -999999)
	SetSpritePhysicsOff(OryUIDialogCollection[oryUIDialogID].sprContainer)
	
	OryUIDialogCollection[oryUIDialogID].txtTitle = CreateText("")
	SetTextSize(OryUIDialogCollection[oryUIDialogID].txtTitle, oryUIDefaults.dialogTitleTextSize#)
	SetTextColor(OryUIDialogCollection[oryUIDialogID].txtTitle, oryUIDefaults.dialogTitleTextColor#[1], oryUIDefaults.dialogTitleTextColor#[2], oryUIDefaults.dialogTitleTextColor#[3], oryUIDefaults.dialogTitleTextColor#[4])
	SetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtTitle, oryUIDefaults.dialogTitleTextAlignment)
	SetTextDepth(OryUIDialogCollection[oryUIDialogID].txtTitle, oryUIDefaults.dialogDepth - 2)
	SetTextPosition(OryUIDialogCollection[oryUIDialogID].txtTitle, -999999, -999999)

	OryUIDialogCollection[oryUIDialogID].txtSupportingText = CreateText("")
	SetTextSize(OryUIDialogCollection[oryUIDialogID].txtSupportingText, oryUIDefaults.dialogSupportingTextSize#)
	SetTextColor(OryUIDialogCollection[oryUIDialogID].txtSupportingText, oryUIDefaults.dialogSupportingTextColor#[1], oryUIDefaults.dialogSupportingTextColor#[2], oryUIDefaults.dialogSupportingTextColor#[3], oryUIDefaults.dialogSupportingTextColor#[4])
	SetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtSupportingText, oryUIDefaults.dialogSupportingTextAlignment)
	SetTextDepth(OryUIDialogCollection[oryUIDialogID].txtSupportingText, oryUIDefaults.dialogDepth - 2)
	SetTextPosition(OryUIDialogCollection[oryUIDialogID].txtSupportingText, -999999, -999999)

	OryUIDialogCollection[oryUIDialogID].sprCheckbox = CreateSprite(0)
	SetSpriteSize(OryUIDialogCollection[oryUIDialogID].sprCheckbox, -1, 2.8)
	SetSpriteImage(OryUIDialogCollection[oryUIDialogID].sprCheckbox, OryUIDialogCollection[oryUIDialogID].uncheckedImage)
	SetSpriteDepth(OryUIDialogCollection[oryUIDialogID].sprCheckbox, oryUIDefaults.dialogDepth - 2)
	SetSpriteColor(OryUIDialogCollection[oryUIDialogID].sprCheckbox, oryUIDefaults.dialogCheckboxColor#[1], oryUIDefaults.dialogCheckboxColor#[2], oryUIDefaults.dialogCheckboxColor#[3], oryUIDefaults.dialogCheckboxColor#[4])
	SetSpriteOffset(OryUIDialogCollection[oryUIDialogID].sprCheckbox, 0, 0)
	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprCheckbox, -999999, -999999)
	SetSpritePhysicsOff(OryUIDialogCollection[oryUIDialogID].sprCheckbox)
	
	OryUIDialogCollection[oryUIDialogID].txtCheckbox = CreateText("")
	SetTextSize(OryUIDialogCollection[oryUIDialogID].txtCheckbox, oryUIDefaults.dialogCheckboxTextSize#)
	SetTextColor(OryUIDialogCollection[oryUIDialogID].txtCheckbox, oryUIDefaults.dialogCheckboxTextColor#[1], oryUIDefaults.dialogCheckboxTextColor#[2], oryUIDefaults.dialogCheckboxTextColor#[3], oryUIDefaults.dialogCheckboxTextColor#[4])
	SetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtCheckbox, 0)
	SetTextDepth(OryUIDialogCollection[oryUIDialogID].txtCheckbox, oryUIDefaults.dialogDepth - 2)
	SetTextPosition(OryUIDialogCollection[oryUIDialogID].txtCheckbox, -999999, -999999)

	if (oryUIWidgetParameters$ <> "") then OryUIUpdateDialog(oryUIDialogID, oryUIWidgetParameters$)
endfunction oryUIDialogID

function OryUIDeleteDialog(oryUIDialogID as integer)
	DeleteSprite(OryUIDialogCollection[oryUIDialogID].sprScrim)
	DeleteSprite(OryUIDialogCollection[oryUIDialogID].sprContainer)
	DeleteSprite(OryUIDialogCollection[oryUIDialogID].sprCheckbox)
	DeleteText(OryUIDialogCollection[oryUIDialogID].txtTitle)
	DeleteText(OryUIDialogCollection[oryUIDialogID].txtSupportingText)
	DeleteText(OryUIDialogCollection[oryUIDialogID].txtCheckbox)
	while (OryUIDialogCollection[oryUIDialogID].buttons.length >= 0)
		OryUIDeleteDialogButton(oryUIDialogID, 0)
	endwhile
endfunction

function OryUIDeleteDialogButton(oryUIDialogID as integer, oryUIButtonID as integer)
	DeleteSprite(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID].sprContainer)
	DeleteText(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID].txtLabel)
	OryUIDialogCollection[oryUIDialogID].buttons.remove(oryUIButtonID)
endfunction

function OryUIGetDialogButtonCount(oryUIDialogID as integer)
	local oryUIDialogButtonCount as integer
	
	oryUIDialogButtonCount = OryUIDialogCollection[oryUIDialogID].buttons.length + 1
endfunction oryUIDialogButtonCount

function OryUIGetDialogButtonHeight(oryUIDialogID as integer, oryUIButtonID as integer)
	local oryUIDialogButtonHeight# as float
	
	if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].sprContainer))
		oryUIDialogButtonHeight# = GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].sprContainer)
	endif
endfunction oryUIDialogButtonHeight#

function OryUIGetDialogButtonReleasedByIndex(oryUIDialogID as integer, oryUIDialogButtonIndex as integer)
	local oryUIDialogButtonReleased as integer
	
	oryUIDialogButtonReleased = 0
	if (OryUIDialogCollection[oryUIDialogID].buttonReleased = oryUIDialogButtonIndex) then oryUIDialogButtonReleased = 1
endfunction oryUIDialogButtonReleased

function OryUIGetDialogButtonReleasedByName(oryUIDialogID as integer, oryUIDialogButtonName$ as string)
	local oryUIDialogButtonReleased as integer
	
	oryUIDialogButtonReleased = 0
	if (OryUIDialogCollection[oryUIDialogID].buttonReleased > 0)
		if (lower(OryUIDialogCollection[oryUIDialogID].buttons[OryUIDialogCollection[oryUIDialogID].buttonReleased - 1].name$) = lower(oryUIDialogButtonName$)) then oryUIDialogButtonReleased = 1
	endif
endfunction oryUIDialogButtonReleased

function OryUIGetDialogButtonReleasedIndex(oryUIDialogID as integer)
	local oryUIDialogButtonReleasedIndex as integer
	
	oryUIDialogButtonReleasedIndex = OryUIDialogCollection[oryUIDialogID].buttonReleased
endfunction oryUIDialogButtonReleasedIndex

function OryUIGetDialogButtonReleasedName(oryUIDialogID as integer)
	local oryUIDialogButtonReleasedName$ as string
	
	if (OryUIDialogCollection[oryUIDialogID].buttonReleased > 0)
		oryUIDialogButtonReleasedName$ = OryUIDialogCollection[oryUIDialogID].buttons[OryUIDialogCollection[oryUIDialogID].buttonReleased - 1].name$
	endif
endfunction oryUIDialogButtonReleasedName$

function OryUIGetDialogButtonWidth(oryUIDialogID as integer, oryUIButtonID as integer)
	local oryUIDialogButtonWidth# as float
	
	if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].sprContainer))
		oryUIDialogButtonWidth# = GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].sprContainer)
	endif
endfunction oryUIDialogButtonWidth#

function OryUIGetDialogChecked(oryUIDialogID as integer)

endfunction OryUIDialogCollection[oryUIDialogID].checked

function OryUIGetDialogHeight(oryUIDialogID as integer)
	local oryUIDialogHeight# as float
	
	if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].sprContainer))
		oryUIDialogHeight# = GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].sprContainer)
	endif
endfunction oryUIDialogHeight#

function OryUIGetDialogWidth(oryUIDialogID as integer)
	local oryUIDialogWidth# as float
	
	if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].sprContainer))
		oryUIDialogWidth# = GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer)
	endif
endfunction oryUIDialogWidth#

function OryUIGetDialogVisible(oryUIDialogID as integer)

endfunction oryUIDialogVisible

function OryUIHideDialog(oryUIDialogID as integer)
	local oryUIForI as integer
	
	oryUIScrimVisible = 0
	oryUIBlockScreenScrolling = 0
	oryUIDialogVisible = 0
	OryUIDialogCollection[oryUIDialogID].visible = 0
	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprScrim, -999999, -999999)
	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, -999999, -999999)
	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprCheckbox, -999999, -999999)
	SetTextPosition(OryUIDialogCollection[oryUIDialogID].txtTitle, -999999, -999999)
	SetTextPosition(OryUIDialogCollection[oryUIDialogID].txtSupportingText, -999999, -999999)
	SetTextPosition(OryUIDialogCollection[oryUIDialogID].txtCheckbox, -999999, -999999)
	for oryUIForI = 0 to OryUIGetDialogButtonCount(oryUIDialogID) - 1
		if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer))
			SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer, -999999, -999999)
			SetTextPosition(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].txtLabel, -999999, -999999)
		endif
	next
endfunction

function OryUIInsertDialogButton(oryUIDialogID as integer, oryUIIndex as integer, oryUIWidgetParameters$ as string)
	local oryUIDialogButtonID as integer
	
	if (oryUIIndex = -1)
		OryUIDialogCollection[oryUIDialogID].buttons.length = OryUIDialogCollection[oryUIDialogID].buttons.length + 1
		oryUIDialogButtonID = OryUIDialogCollection[oryUIDialogID].buttons.length
		OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].id = oryUIDialogButtonID + 1
	endif

	OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].sprContainer, 30, oryUIDefaults.dialogButtonHeight#)
	SetSpriteDepth(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].sprContainer, GetSpriteDepth(OryUIDialogCollection[oryUIDialogID].sprContainer) - 1)
	SetSpriteColor(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].sprContainer, oryUIDefaults.dialogButtonColor#[1], oryUIDefaults.dialogButtonColor#[2], oryUIDefaults.dialogButtonColor#[3], oryUIDefaults.dialogButtonColor#[4])
	SetSpriteOffset(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].sprContainer, -999999, -999999)
	SetSpritePhysicsOff(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].sprContainer)
	
	OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel = CreateText("Button")
	SetTextSize(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel, oryUIDefaults.dialogButtonTextSize#)
	SetTextBold(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel, oryUIDefaults.dialogButtonTextBold)
	SetTextColor(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel, oryUIDefaults.dialogButtonTextColor#[1], oryUIDefaults.dialogButtonTextColor#[2], oryUIDefaults.dialogButtonTextColor#[3], oryUIDefaults.dialogButtonTextColor#[4])
	SetTextAlignment(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel, 1)
	SetTextDepth(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel, GetSpriteDepth(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].sprContainer) - 1)
	SetTextPosition(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel, -999999, -999999)
	
	if (oryUIWidgetParameters$ <> "") then OryUIUpdateDialogButton(oryUIDialogID, oryUIDialogButtonID + 1, oryUIWidgetParameters$)
endfunction

function OryUIInsertDialogListener(oryUIDialogID as integer)
	local oryUIDialogButtonSprite as integer
	local oryUIDialogCheckboxSprite as integer
	local oryUIDialogCheckboxText as integer
	local oryUIDialogContainerSprite as integer
	local oryUIDialogScrimSprite as integer
	local oryUIForI as integer
	
	OryUIDialogCollection[oryUIDialogID].buttonPressed = -1
	OryUIDialogCollection[oryUIDialogID].buttonReleased = -1
	if (GetRawKeyPressed(27) and OryUIDialogCollection[oryUIDialogID].visible = 1)
		OryUIHideDialog(oryUIDialogID)
	endif
	if (OryUIDialogCollection[oryUIDialogID].visible = 1)
		for oryUIForI = 0 to OryUIGetDialogButtonCount(oryUIDialogID) - 1
			OryUIUpdateDialogButton(oryUIDialogID, oryUIForI + 1, "")
			if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer))
				if (OryUIGetSwipingVertically() = 0)
					if (GetPointerPressed())
						oryUIDialogContainerSprite = GetSpriteHitTest(OryUIDialogCollection[oryUIDialogID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIDialogScrimSprite = GetSpriteHitTest(OryUIDialogCollection[oryUIDialogID].sprScrim, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIDialogCheckboxSprite = GetSpriteHitTest(OryUIDialogCollection[oryUIDialogID].sprCheckbox, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIDialogCheckboxText = GetTextHitTest(OryUIDialogCollection[oryUIDialogID].txtCheckbox, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIDialogButtonSprite = GetSpriteHitTest(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (oryUIDialogScrimSprite = 1 and oryUIDialogContainerSprite = 0 and OryUIDialogCollection[oryUIDialogID].decisionRequired = 0)
							OryUIHideDialog(oryUIDialogID)
						endif
						if (oryUIDialogCheckboxSprite = 1 or oryUIDialogCheckboxText = 1)
							OryUIDialogCollection[oryUIDialogID].checkboxPressed = 1
						endif
						if (oryUIDialogButtonSprite = 1)
							OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].pressed = 1
							OryUIDialogCollection[oryUIDialogID].buttonPressed = oryUIForI + 1
						endif
					else
						if (GetPointerState())
							oryUIDialogButtonSprite = GetSpriteHitTest(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].pressed)
								if (oryUIDialogButtonSprite = 0)
									OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].pressed = 0
									OryUIDialogCollection[oryUIDialogID].buttonPressed = 0
								endif
							endif
						endif
						if (GetPointerReleased())
							oryUIDialogScrimSprite = GetSpriteHitTest(OryUIDialogCollection[oryUIDialogID].sprScrim, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							oryUIDialogCheckboxSprite = GetSpriteHitTest(OryUIDialogCollection[oryUIDialogID].sprCheckbox, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							oryUIDialogCheckboxText = GetTextHitTest(OryUIDialogCollection[oryUIDialogID].txtCheckbox, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							oryUIDialogButtonSprite = GetSpriteHitTest(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUIDialogCollection[oryUIDialogID].checkboxPressed)
								if (OryUIDialogCollection[oryUIDialogID].checked = 0)
									OryUIDialogCollection[oryUIDialogID].checked = 1
									SetSpriteImage(OryUIDialogCollection[oryUIDialogID].sprCheckbox, OryUIDialogCollection[oryUIDialogID].checkedImage)
								else
									OryUIDialogCollection[oryUIDialogID].checked = 0
									SetSpriteImage(OryUIDialogCollection[oryUIDialogID].sprCheckbox, OryUIDialogCollection[oryUIDialogID].uncheckedImage)
								endif
							endif
							if (OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].pressed)
								if (oryUIDialogButtonSprite = 1)
									OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].released = 1
									OryUIDialogCollection[oryUIDialogID].buttonReleased = oryUIForI + 1
								endif
								OryUIHideDialog(oryUIDialogID)
							endif
							OryUIDialogCollection[oryUIDialogID].checkboxPressed = 0
							OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].pressed = 0
							OryUIDialogCollection[oryUIDialogID].buttonPressed = 0
						endif
					endif
				endif
			endif
		next
	endif
endfunction

function OryUISetDialogButtonCount(oryUIDialogID as integer, oryUINewDialogButtonCount as integer)
	local oryUIForI as integer
	local oryUIOldDialogButtonCount as integer
	
	oryUIOldDialogButtonCount = OryUIGetDialogButtonCount(oryUIDialogID) - 1
	while (OryUIGetDialogButtonCount(oryUIDialogID) - 1 > oryUINewDialogButtonCount - 1)
		OryUIDeleteDialogButton(oryUIDialogID, OryUIGetDialogButtonCount(oryUIDialogID) - 1)
	endwhile
	for oryUIForI = 0 to oryUINewDialogButtonCount - 1
		if (oryUIForI > oryUIOldDialogButtonCount)
			OryUIInsertDialogButton(oryUIDialogID, -1, "")
		endif
	next
endfunction

function OryUIShowDialog(oryUIDialogID as integer)
	local oryUIButtonWidth# as float
	local oryUICheckboxHeight# as float
	local oryUIForI as integer
	local oryUILastButtonX# as float
	local oryUILastButtonY# as float
	local oryUITotalCheckboxWidth# as float

	oryUIScrimDepth = GetSpriteDepth(OryUIDialogCollection[oryUIDialogID].sprScrim)
	oryUIScrimVisible = 1
	oryUIBlockScreenScrolling = 1
	oryUIDialogVisible = 1
	OryUIDialogCollection[oryUIDialogID].visible = 1
	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprScrim, GetViewOffsetX(), GetViewOffsetY() + GetScreenBoundsTop())

	OryUIDialogCollection[oryUIDialogID].checked = 0
	SetSpriteImage(OryUIDialogCollection[oryUIDialogID].sprCheckbox, OryUIDialogCollection[oryUIDialogID].uncheckedImage)
	
	if (OryUIDialogCollection[oryUIDialogID].autoHeight = 1)
		if (OryUIDialogCollection[oryUIDialogID].showCheckbox = 0)
			oryUICheckboxHeight# = oryUIDefaults.dialogSpacingBetweenSupportingTextAndButtons#
		else
			oryUICheckboxHeight# = GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].sprCheckbox) + oryUIDefaults.dialogSpacingBetweenTitleAndSupportingText# + oryUIDefaults.dialogSpacingBetweenSupportingTextAndButtons#
		endif
		if (OryUIDialogCollection[oryUIDialogID].stackButtons = 0)
			SetSpriteSize(OryUIDialogCollection[oryUIDialogID].sprContainer, GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer), oryUIDefaults.dialogTopMargin# + GetTextTotalHeight(OryUIDialogCollection[oryUIDialogID].txtTitle) + oryUIDefaults.dialogSpacingBetweenTitleAndSupportingText# + GetTextTotalHeight(OryUIDialogCollection[oryUIDialogID].txtSupportingText) + oryUICheckboxHeight# + GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].buttons[0].sprContainer) + oryUIDefaults.dialogBottomMargin#)
		endif
		if (OryUIDialogCollection[oryUIDialogID].stackButtons = 1)
			SetSpriteSize(OryUIDialogCollection[oryUIDialogID].sprContainer, GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer), oryUIDefaults.dialogTopMargin# + GetTextTotalHeight(OryUIDialogCollection[oryUIDialogID].txtTitle) + oryUIDefaults.dialogSpacingBetweenTitleAndSupportingText# + GetTextTotalHeight(OryUIDialogCollection[oryUIDialogID].txtSupportingText) + oryUICheckboxHeight# + (OryUIGetDialogButtonCount(oryUIDialogID) * (GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].buttons[0].sprContainer) + oryUIDefaults.dialogButtonYSpacing#)) + oryUIDefaults.dialogBottomMargin#)
		endif
	endif
	
	SetSpriteOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer) / 2, GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].sprContainer) / 2)
	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, GetViewOffsetX() + 50, GetViewOffsetY() + 50)
	if (GetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtTitle) = 0)
		OryUIPinTextToTopLeftOfSprite(OryUIDialogCollection[oryUIDialogID].txtTitle, OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIDefaults.dialogLeftMargin#, oryUIDefaults.dialogTopMargin#)
	elseif (GetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtTitle) = 1)
		OryUIPinTextToTopCentreOfSprite(OryUIDialogCollection[oryUIDialogID].txtTitle, OryUIDialogCollection[oryUIDialogID].sprContainer, 0, oryUIDefaults.dialogTopMargin#)
	elseif (GetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtTitle) = 2)
		OryUIPinTextToTopRightOfSprite(OryUIDialogCollection[oryUIDialogID].txtTitle, OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIDefaults.dialogRightMargin#, oryUIDefaults.dialogTopMargin#)
	endif
	if (GetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtSupportingText) = 0)
		OryUIPinTextToTopLeftOfSprite(OryUIDialogCollection[oryUIDialogID].txtSupportingText, OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIDefaults.dialogLeftMargin#, oryUIDefaults.dialogTopMargin# + GetTextTotalHeight(OryUIDialogCollection[oryUIDialogID].txtTitle) + oryUIDefaults.dialogSpacingBetweenTitleAndSupportingText#)
	elseif (GetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtSupportingText) = 1)
		OryUIPinTextToTopCentreOfSprite(OryUIDialogCollection[oryUIDialogID].txtSupportingText, OryUIDialogCollection[oryUIDialogID].sprContainer, 0, oryUIDefaults.dialogTopMargin# + GetTextTotalHeight(OryUIDialogCollection[oryUIDialogID].txtTitle) + oryUIDefaults.dialogSpacingBetweenTitleAndSupportingText#)
	elseif (GetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtSupportingText) = 2)
		OryUIPinTextToTopRightOfSprite(OryUIDialogCollection[oryUIDialogID].txtSupportingText, OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIDefaults.dialogRightMargin#, oryUIDefaults.dialogTopMargin# + GetTextTotalHeight(OryUIDialogCollection[oryUIDialogID].txtTitle) + oryUIDefaults.dialogSpacingBetweenTitleAndSupportingText#)
	endif
	if (OryUIDialogCollection[oryUIDialogID].showCheckbox = 1)
		oryUITotalCheckboxWidth# = GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprCheckbox) + GetTextTotalWidth(OryUIDialogCollection[oryUIDialogID].txtCheckbox)
		if (OryUIDialogCollection[oryUIDialogID].checkboxAlignment = 0)
			SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprCheckbox, GetSpriteX(OryUIDialogCollection[oryUIDialogID].sprContainer) + oryUIDefaults.dialogLeftMargin#, GetTextY(OryUIDialogCollection[oryUIDialogID].txtSupportingText) + GetTextTotalHeight(OryUIDialogCollection[oryUIDialogID].txtSupportingText) + oryUIDefaults.dialogSpacingBetweenTitleAndSupportingText#)
		elseif (OryUIDialogCollection[oryUIDialogID].checkboxAlignment = 1)
			SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprCheckbox, (GetSpriteX(OryUIDialogCollection[oryUIDialogID].sprContainer) + (GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer) / 2)) - (oryUITotalCheckboxWidth# / 2), GetTextY(OryUIDialogCollection[oryUIDialogID].txtSupportingText) + GetTextTotalHeight(OryUIDialogCollection[oryUIDialogID].txtSupportingText) + oryUIDefaults.dialogSpacingBetweenTitleAndSupportingText#)
		elseif (OryUIDialogCollection[oryUIDialogID].checkboxAlignment = 2)
			SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprCheckbox, (GetSpriteX(OryUIDialogCollection[oryUIDialogID].sprContainer) + GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer)) - oryUITotalCheckboxWidth# - oryUIDefaults.dialogRightMargin#, GetTextY(OryUIDialogCollection[oryUIDialogID].txtSupportingText) + GetTextTotalHeight(OryUIDialogCollection[oryUIDialogID].txtSupportingText) + oryUIDefaults.dialogSpacingBetweenTitleAndSupportingText#)
		endif
		OryUIPinTextToCentreLeftOfSprite(OryUIDialogCollection[oryUIDialogID].txtCheckbox, OryUIDialogCollection[oryUIDialogID].sprCheckbox, GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprCheckbox), 0)
	endif

	oryUILastButtonX# = GetSpriteX(OryUIDialogCollection[oryUIDialogID].sprContainer) + GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer)
	if (OryUIDialogCollection[oryUIDialogID].stackButtons = 0)
		for oryUIForI = OryUIGetDialogButtonCount(oryUIDialogID) - 1 to 0 step - 1
			if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer))
				if (OryUIDialogCollection[oryUIDialogID].flexButtons = 0)
					SetSpriteSize(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer, GetTextTotalWidth(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].txtLabel) + (oryUIDefaults.dialogButtonXSpacing# * 2), GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer))
				endif
				if (OryUIDialogCollection[oryUIDialogID].flexButtons = 1)
					oryUIButtonWidth# = (GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer) - ((OryUIGetDialogButtonCount(oryUIDialogID) + 1) * 2)) / OryUIGetDialogButtonCount(oryUIDialogID)
					SetSpriteSize(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer, oryUIButtonWidth#, GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer))
				endif
				SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer, oryUILastButtonX# - oryUIDefaults.dialogButtonXSpacing# - GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer), GetTextY(OryUIDialogCollection[oryUIDialogID].txtSupportingText) + GetTextTotalHeight(OryUIDialogCollection[oryUIDialogID].txtSupportingText) + oryUICheckboxHeight#)
				OryUIPinTextToCentreOfSprite(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].txtLabel, OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer, 0, 0)
				oryUILastButtonX# = GetSpriteX(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer)
			endif
		next
	endif
	oryUILastButtonX# = GetSpriteX(OryUIDialogCollection[oryUIDialogID].sprContainer) + GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer)
	oryUILastButtonY# = GetSpriteY(OryUIDialogCollection[oryUIDialogID].sprContainer) + GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].sprContainer)
	if (OryUIDialogCollection[oryUIDialogID].stackButtons = 1)
		for oryUIForI = OryUIGetDialogButtonCount(oryUIDialogID) - 1 to 0 step - 1
			if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer))
				if (OryUIDialogCollection[oryUIDialogID].flexButtons = 0)
					SetSpriteSize(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer, GetTextTotalWidth(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].txtLabel) + (oryUIDefaults.dialogButtonXSpacing# * 2), GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer))
				endif
				if (OryUIDialogCollection[oryUIDialogID].flexButtons = 1)
					oryUIButtonWidth# = GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer) - (oryUIDefaults.dialogButtonXSpacing# * 2)
					SetSpriteSize(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer, oryUIButtonWidth#, GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer))
				endif
				SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer, oryUILastButtonX# - oryUIDefaults.dialogButtonXSpacing# - GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer), oryUILastButtonY# - oryUIDefaults.dialogButtonYSpacing# - GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer))
				OryUIPinTextToCentreOfSprite(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].txtLabel, OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer, 0, 0)
				oryUILastButtonY# = GetSpriteY(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer)
			endif
		next
	endif
endfunction

function OryUIUpdateDialog(oryUIDialogID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].sprContainer))

		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE WIDGET
		if (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIParameters.size#[1], oryUIParameters.size#[2])
		elseif (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIParameters.size#[1], GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].sprContainer))
		elseif (oryUIParameters.size#[1] = -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIDialogCollection[oryUIDialogID].sprContainer, GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer), oryUIParameters.size#[2])
		endif
		if (oryUIParameters.showCheckbox > -999999)
			OryUIDialogCollection[oryUIDialogID].showCheckbox = oryUIParameters.showCheckbox
		endif
		if (oryUIParameters.checkboxAlignment >- 999999)
			OryUIDialogCollection[oryUIDialogID].checkboxAlignment = oryUIParameters.checkboxAlignment
		endif
		if (oryUIParameters.checkboxTextBold > -999999)
			SetTextBold(OryUIDialogCollection[oryUIDialogID].txtCheckbox, oryUIParameters.checkboxTextBold)
		endif
		if (oryUIParameters.checkboxTextSize# > -999999)
			SetTextSize(OryUIDialogCollection[oryUIDialogID].txtCheckbox, oryUIParameters.checkboxTextSize#)
		endif
		if (oryUIParameters.checkboxText$ <> "")
			if (lower(oryUIParameters.checkboxText$) = "null") then oryUIParameters.checkboxText$ = ""
			SetTextString(OryUIDialogCollection[oryUIDialogID].txtCheckbox, oryUIParameters.checkboxText$)
		endif
		if (oryUIParameters.supportingTextBold > -999999)
			SetTextBold(OryUIDialogCollection[oryUIDialogID].txtSupportingText, oryUIParameters.supportingTextBold)
		endif
		if (oryUIParameters.supportingTextSize# > -999999)
			SetTextSize(OryUIDialogCollection[oryUIDialogID].txtSupportingText, oryUIParameters.supportingTextSize#)
		endif
		if (oryUIParameters.supportingText$ <> "")
			SetTextString(OryUIDialogCollection[oryUIDialogID].txtSupportingText, OryUIWrapText(oryUIParameters.supportingText$, GetTextSize(OryUIDialogCollection[oryUIDialogID].txtSupportingText), GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer) - oryUIDefaults.dialogLeftMargin# - oryUIDefaults.dialogRightMargin#))
		endif
		if (oryUIParameters.titleTextBold > -999999)
			SetTextBold(OryUIDialogCollection[oryUIDialogID].txtTitle, oryUIParameters.titleTextBold)
		endif
		if (oryUIParameters.titleTextSize# > -999999)
			SetTextSize(OryUIDialogCollection[oryUIDialogID].txtTitle, oryUIParameters.titleTextSize#)
		endif
		if (oryUIParameters.titleText$ <> "")
			if (lower(oryUIParameters.titleText$) = "null") then oryUIParameters.titleText$ = ""
			SetTextString(OryUIDialogCollection[oryUIDialogID].txtTitle, OryUIWrapText(oryUIParameters.titleText$, GetTextSize(OryUIDialogCollection[oryUIDialogID].txtTitle), GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer) - oryUIDefaults.dialogLeftMargin# - oryUIDefaults.dialogRightMargin#))
		endif
		if (oryUIParameters.autoHeight > -999999)
			OryUIDialogCollection[oryUIDialogID].autoHeight = oryUIParameters.autoHeight
		endif
		if (oryUIParameters.flexButtons > -999999)
			OryUIDialogCollection[oryUIDialogID].flexButtons = oryUIParameters.flexButtons
		endif
		//if (oryUIParameters.offsetCenter = 1)
		//	SetSpriteOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer) / 2, GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].sprContainer) / 2)
		//else
		//	if (oryUIParameters.offset#[1] > -999999 or oryUIParameters.offset#[2] > -999999)
		//		SetSpriteOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIParameters.offset#[1], oryUIParameters.offset#[2])
		//	endif
		//endif
		//if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
		//	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
		//elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
		//	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIParameters.position#[1], GetSpriteYByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer))
		//elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
		//	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, GetSpriteXByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer), oryUIParameters.position#[2])
		//endif

		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.checkedImageID > -999999)
			OryUIDialogCollection[oryUIDialogID].checkedImage = oryUIParameters.checkedImageID
		endif
		if (oryUIParameters.checkboxColor#[1] > -999999 or oryUIParameters.checkboxColor#[2] > -999999 or oryUIParameters.checkboxColor#[3] > -999999 or oryUIParameters.checkboxColor#[4] > -999999)
			SetSpriteColor(OryUIDialogCollection[oryUIDialogID].sprCheckbox, oryUIParameters.checkboxColor#[1], oryUIParameters.checkboxColor#[2], oryUIParameters.checkboxColor#[3], oryUIParameters.checkboxColor#[4])
		endif
		if (oryUIParameters.checkboxTextColor#[1] > -999999 or oryUIParameters.checkboxTextColor#[2] > -999999 or oryUIParameters.checkboxTextColor#[3] > -999999 or oryUIParameters.checkboxTextColor#[4] > -999999)
			SetTextColor(OryUIDialogCollection[oryUIDialogID].txtCheckbox, oryUIParameters.checkboxTextColor#[1], oryUIParameters.checkboxTextColor#[2], oryUIParameters.checkboxTextColor#[3], oryUIParameters.checkboxTextColor#[4])
		endif
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
		endif
		if (oryUIParameters.decisionRequired > -999999)
			OryUIDialogCollection[oryUIDialogID].decisionRequired = oryUIParameters.decisionRequired
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIParameters.depth)
			SetTextDepth(OryUIDialogCollection[oryUIDialogID].txtTitle, oryUIParameters.depth - 1)
			SetTextDepth(OryUIDialogCollection[oryUIDialogID].txtSupportingText, oryUIParameters.depth - 1)
		endif
		if (oryUIParameters.stackButtons > -999999)
			OryUIDialogCollection[oryUIDialogID].stackButtons = oryUIParameters.stackButtons
		endif
		if (oryUIParameters.titleTextAlignment > -999999)
			SetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtTitle, oryUIParameters.titleTextAlignment)
		endif
		if (oryUIParameters.titleTextColor#[1] > -999999 or oryUIParameters.titleTextColor#[2] > -999999 or oryUIParameters.titleTextColor#[3] > -999999 or oryUIParameters.titleTextColor#[4] > -999999)
			SetTextColor(OryUIDialogCollection[oryUIDialogID].txtTitle, oryUIParameters.titleTextColor#[1], oryUIParameters.titleTextColor#[2], oryUIParameters.titleTextColor#[3], oryUIParameters.titleTextColor#[4])
		endif
		if (oryUIParameters.imageID > -999999)
			SetSpriteImage(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIParameters.imageID)
		endif
		if (oryUIParameters.supportingTextAlignment > -999999)
			SetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtSupportingText, oryUIParameters.supportingTextAlignment)
		endif
		if (oryUIParameters.supportingTextColor#[1] > -999999 or oryUIParameters.supportingTextColor#[2] > -999999 or oryUIParameters.supportingTextColor#[3] > -999999 or oryUIParameters.supportingTextColor#[4] > -999999)
			SetTextColor(OryUIDialogCollection[oryUIDialogID].txtSupportingText, oryUIParameters.supportingTextColor#[1], oryUIParameters.supportingTextColor#[2], oryUIParameters.supportingTextColor#[3], oryUIParameters.supportingTextColor#[4])
		endif
		if (oryUIParameters.uncheckedImageID > -999999)
			OryUIDialogCollection[oryUIDialogID].uncheckedImage = oryUIParameters.uncheckedImageID
		endif
	endif
endfunction

function OryUIUpdateDialogButton(oryUIDialogID as integer, oryUIButtonID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].sprContainer))
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
		endif
		if (oryUIParameters.name$ <> "")
			if (lower(oryUIParameters.name$) = "null") then oryUIParameters.name$ = ""
			OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].name$ = oryUIParameters.name$
		endif
		if (oryUIParameters.text$ <> "")
			if (lower(oryUIParameters.text$) = "null") then oryUIParameters.text$ = ""
			SetTextString(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].txtLabel, oryUIParameters.text$)
		endif
		if (oryUIParameters.textBold > -999999)
			SetTextBold(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].txtLabel, oryUIParameters.textBold)
		endif
		if (oryUIParameters.textColor#[1] > -999999 or oryUIParameters.textColor#[2] > -999999 or oryUIParameters.textColor#[3] > -999999 or oryUIParameters.textColor#[4] > -999999)
			SetTextColor(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].txtLabel, oryUIParameters.textColor#[1], oryUIParameters.textColor#[2], oryUIParameters.textColor#[3], oryUIParameters.textColor#[4])
		endif
		if (oryUIParameters.textSize# > -999999)
			SetTextSize(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].txtLabel, oryUIParameters.textSize#)
		endif
	endif
endfunction

foldend
