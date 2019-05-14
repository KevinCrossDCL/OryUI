
foldstart // OryUIDialog Component (Updated 20/04/2019)

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

function OryUICreateDialog(oryUIComponentParameters$ as string)
	local oryUIDialogID as integer
	OryUIDialogCollection.length = OryUIDialogCollection.length + 1
	oryUIDialogID = OryUIDialogCollection.length
	OryUIDialogCollection[oryUIDialogID].id = oryUIDialogID

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
	SetSpriteSize(OryUIDialogCollection[oryUIDialogID].sprScrim, 100, 100)
	SetSpriteDepth(OryUIDialogCollection[oryUIDialogID].sprScrim, oryUIDefaults.dialogDepth)
	SetSpriteColor(OryUIDialogCollection[oryUIDialogID].sprScrim, oryUIDefaults.dialogScrimColor#[1], oryUIDefaults.dialogScrimColor#[2], oryUIDefaults.dialogScrimColor#[3], oryUIDefaults.dialogScrimColor#[4])
	SetSpriteOffset(OryUIDialogCollection[oryUIDialogID].sprScrim, 0, 0)
	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprScrim, -999999, -999999)
	
	OryUIDialogCollection[oryUIDialogID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIDefaults.dialogWidth#, oryUIDefaults.dialogHeight#)
	SetSpriteDepth(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIDefaults.dialogDepth - 1)
	SetSpriteColor(OryUIDialogCollection[oryUIDialogID].sprContainer, oryUIDefaults.dialogColor#[1], oryUIDefaults.dialogColor#[2], oryUIDefaults.dialogColor#[3], oryUIDefaults.dialogColor#[4])
	SetSpriteOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, -999999, -999999)

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

	OryUIDialogCollection[oryUIDialogID].txtCheckbox = CreateText("")
	SetTextSize(OryUIDialogCollection[oryUIDialogID].txtCheckbox, oryUIDefaults.dialogCheckboxTextSize#)
	SetTextColor(OryUIDialogCollection[oryUIDialogID].txtCheckbox, oryUIDefaults.dialogCheckboxTextColor#[1], oryUIDefaults.dialogCheckboxTextColor#[2], oryUIDefaults.dialogCheckboxTextColor#[3], oryUIDefaults.dialogCheckboxTextColor#[4])
	SetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtCheckbox, 0)
	SetTextDepth(OryUIDialogCollection[oryUIDialogID].txtCheckbox, oryUIDefaults.dialogDepth - 2)
	SetTextPosition(OryUIDialogCollection[oryUIDialogID].txtCheckbox, -999999, -999999)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateDialog(oryUIDialogID, oryUIComponentParameters$)
endfunction oryUIDialogID

function OryUIDeleteDialog(oryUIDialogID as integer)
	DeleteSprite(OryUIDialogCollection[oryUIDialogID].sprScrim)
	DeleteSprite(OryUIDialogCollection[oryUIDialogID].sprContainer)
	DeleteSprite(OryUIDialogCollection[oryUIDialogID].sprCheckbox)
	DeleteText(OryUIDialogCollection[oryUIDialogID].txtTitle)
	DeleteText(OryUIDialogCollection[oryUIDialogID].txtSupportingText)
	DeleteText(OryUIDialogCollection[oryUIDialogID].txtCheckbox)
	while (OryUIDialogCollection[oryUIDialogID].buttons.length > 0)
		OryUIDeleteDialogButton(oryUIDialogID, 0)
	endwhile
endfunction

function OryUIDeleteDialogButton(oryUIDialogID as integer, oryUIButtonID as integer)
	DeleteSprite(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID].sprContainer)
	DeleteText(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID].txtLabel)
	OryUIDialogCollection[oryUIDialogID].buttons.remove(oryUIButtonID)
endfunction

function OryUIGetDialogButtonCount(oryUIDialogID as integer)
	local oryUIDialogButtonCount
	oryUIDialogButtonCount = OryUIDialogCollection[oryUIDialogID].buttons.length + 1
endfunction oryUIDialogButtonCount

function OryUIGetDialogButtonHeight(oryUIDialogID as integer, oryUIButtonID as integer)
	local oryUIDialogButtonHeight#
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
		if (OryUIDialogCollection[oryUIDialogID].buttons[OryUIDialogCollection[oryUIDialogID].buttonReleased - 1].name$ = oryUIDialogButtonName$) then oryUIDialogButtonReleased = 1
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
	local oryUIDialogButtonWidth#
	if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].sprContainer))
		oryUIDialogButtonWidth# = GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].sprContainer)
	endif
endfunction oryUIDialogButtonWidth#

function OryUIGetDialogChecked(oryUIDialogID as integer)

endfunction OryUIDialogCollection[oryUIDialogID].checked

function OryUIGetDialogHeight(oryUIDialogID as integer)
	local oryUIDialogHeight#
	if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].sprContainer))
		oryUIDialogHeight# = GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].sprContainer)
	endif
endfunction oryUIDialogHeight#

function OryUIGetDialogWidth(oryUIDialogID as integer)
	local oryUIDialogWidth#
	if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].sprContainer))
		oryUIDialogWidth# = GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer)
	endif
endfunction oryUIDialogWidth#

function OryUIHideDialog(oryUIDialogID as integer)
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

function OryUIInsertDialogButton(oryUIDialogID as integer, oryUIIndex as integer, oryUIComponentParameters$ as string)
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

	OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel = CreateText("Button")
	SetTextSize(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel, oryUIDefaults.dialogButtonTextSize#)
	SetTextBold(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel, oryUIDefaults.dialogButtonTextBold)
	SetTextColor(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel, oryUIDefaults.dialogButtonTextColor#[1], oryUIDefaults.dialogButtonTextColor#[2], oryUIDefaults.dialogButtonTextColor#[3], oryUIDefaults.dialogButtonTextColor#[4])
	SetTextAlignment(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel, 1)
	SetTextDepth(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel, GetSpriteDepth(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].sprContainer) - 1)
	SetTextPosition(OryUIDialogCollection[oryUIDialogID].buttons[oryUIDialogButtonID].txtLabel, -999999, -999999)
	
	if (oryUIComponentParameters$ <> "") then OryUIUpdateDialogButton(oryUIDialogID, oryUIDialogButtonID + 1, oryUIComponentParameters$)
endfunction

function OryUIInsertDialogListener(oryUIDialogID as integer)
	local oryUIDialogButtonSprite as integer

	OryUIDialogCollection[oryUIDialogID].buttonReleased = -1
	if (OryUIDialogCollection[oryUIDialogID].visible = 1)
		for oryUIForI = 0 to OryUIGetDialogButtonCount(oryUIDialogID) - 1
			OryUIUpdateDialogButton(oryUIDialogID, oryUIForI + 1, "")
			if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer))
				if (OryUIGetSwipingVertically() = 0)
					if (GetPointerPressed())
						oryUIDialogScrimSprite = GetSpriteHitTest(OryUIDialogCollection[oryUIDialogID].sprScrim, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIDialogCheckboxSprite = GetSpriteHitTest(OryUIDialogCollection[oryUIDialogID].sprCheckbox, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIDialogCheckboxText = GetTextHitTest(OryUIDialogCollection[oryUIDialogID].txtCheckbox, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						oryUIDialogButtonSprite = GetSpriteHitTest(OryUIDialogCollection[oryUIDialogID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (oryUIDialogScrimSprite = 1 and oryUIDialogButtonSprite = 0 and OryUIDialogCollection[oryUIDialogID].decisionRequired = 0)
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
	local oryUIOldDialogButtonCount
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
	local oryUILastButtonX# as float
	local oryUILastButtonY# as float
	local oryUITotalCheckboxWidth# as float

	oryUIBlockScreenScrolling = 1
	oryUIDialogVisible = 1
	OryUIDialogCollection[oryUIDialogID].visible = 1
	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprScrim, GetViewOffsetX(), GetViewOffsetY())

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

function OryUIUpdateDialog(oryUIDialogID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].sprContainer))

		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIDialogCollection[oryUIDialogID].sprContainer, OryUIParameters.size#[1], OryUIParameters.size#[2])
		elseif (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUIDialogCollection[oryUIDialogID].sprContainer, OryUIParameters.size#[1], GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].sprContainer))
		elseif (OryUIParameters.size#[1] = -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIDialogCollection[oryUIDialogID].sprContainer, GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer), OryUIParameters.size#[2])
		endif
		if (OryUIParameters.showCheckbox > -999999)
			OryUIDialogCollection[oryUIDialogID].showCheckbox = OryUIParameters.showCheckbox
		endif
		if (OryUIParameters.checkboxAlignment >- 999999)
			OryUIDialogCollection[oryUIDialogID].checkboxAlignment = OryUIParameters.checkboxAlignment
		endif
		if (OryUIParameters.checkboxTextBold > -999999)
			SetTextBold(OryUIDialogCollection[oryUIDialogID].txtCheckbox, OryUIParameters.checkboxTextBold)
		endif
		if (OryUIParameters.checkboxTextSize# > -999999)
			SetTextSize(OryUIDialogCollection[oryUIDialogID].txtCheckbox, OryUIParameters.checkboxTextSize#)
		endif
		if (OryUIParameters.checkboxText$ <> "")
			SetTextString(OryUIDialogCollection[oryUIDialogID].txtCheckbox, OryUIParameters.checkboxText$)
		endif
		if (OryUIParameters.supportingTextBold > -999999)
			SetTextBold(OryUIDialogCollection[oryUIDialogID].txtSupportingText, OryUIParameters.supportingTextBold)
		endif
		if (OryUIParameters.supportingTextSize# > -999999)
			SetTextSize(OryUIDialogCollection[oryUIDialogID].txtSupportingText, OryUIParameters.supportingTextSize#)
		endif
		if (OryUIParameters.supportingText$ <> "")
			SetTextString(OryUIDialogCollection[oryUIDialogID].txtSupportingText, OryUIWrapText(OryUIParameters.supportingText$, GetTextSize(OryUIDialogCollection[oryUIDialogID].txtSupportingText), GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer) - oryUIDefaults.dialogLeftMargin# - oryUIDefaults.dialogRightMargin#))
		endif
		if (OryUIParameters.titleTextBold > -999999)
			SetTextBold(OryUIDialogCollection[oryUIDialogID].txtTitle, OryUIParameters.titleTextBold)
		endif
		if (OryUIParameters.titleTextSize# > -999999)
			SetTextSize(OryUIDialogCollection[oryUIDialogID].txtTitle, OryUIParameters.titleTextSize#)
		endif
		if (OryUIParameters.titleText$ <> "")
			SetTextString(OryUIDialogCollection[oryUIDialogID].txtTitle, OryUIWrapText(OryUIParameters.titleText$, GetTextSize(OryUIDialogCollection[oryUIDialogID].txtTitle), GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer) - oryUIDefaults.dialogLeftMargin# - oryUIDefaults.dialogRightMargin#))
		endif
		if (OryUIParameters.autoHeight > -999999)
			OryUIDialogCollection[oryUIDialogID].autoHeight = OryUIParameters.autoHeight
		endif
		if (OryUIParameters.flexButtons > -999999)
			OryUIDialogCollection[oryUIDialogID].flexButtons = OryUIParameters.flexButtons
		endif
		//if (OryUIParameters.offsetCenter = 1)
		//	SetSpriteOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, GetSpriteWidth(OryUIDialogCollection[oryUIDialogID].sprContainer) / 2, GetSpriteHeight(OryUIDialogCollection[oryUIDialogID].sprContainer) / 2)
		//else
		//	if (OryUIParameters.offset#[1] > -999999 or OryUIParameters.offset#[2] > -999999)
		//		SetSpriteOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, OryUIParameters.offset#[1], OryUIParameters.offset#[2])
		//	endif
		//endif
		//if (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] > -999999)
		//	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, OryUIParameters.position#[1], OryUIParameters.position#[2])
		//elseif (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] = -999999)
		//	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, OryUIParameters.position#[1], GetSpriteYByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer))
		//elseif (OryUIParameters.position#[1] = -999999 and OryUIParameters.position#[2] > -999999)
		//	SetSpritePositionByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer, GetSpriteXByOffset(OryUIDialogCollection[oryUIDialogID].sprContainer), OryUIParameters.position#[2])
		//endif

		// THE REST OF THE PARAMETERS NEXT
		if (OryUIParameters.checkedImageID > -999999)
			OryUIDialogCollection[oryUIDialogID].checkedImage = OryUIParameters.checkedImageID
		endif
		if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999 or OryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUIDialogCollection[oryUIDialogID].sprContainer, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], OryUIParameters.color#[4])
		endif
		if (OryUIParameters.decisionRequired > -999999)
			OryUIDialogCollection[oryUIDialogID].decisionRequired = OryUIParameters.decisionRequired
		endif
		if (OryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIDialogCollection[oryUIDialogID].sprContainer, OryUIParameters.depth)
			SetTextDepth(OryUIDialogCollection[oryUIDialogID].txtTitle, OryUIParameters.depth - 1)
			SetTextDepth(OryUIDialogCollection[oryUIDialogID].txtSupportingText, OryUIParameters.depth - 1)
		endif
		if (OryUIParameters.stackButtons > -999999)
			OryUIDialogCollection[oryUIDialogID].stackButtons = OryUIParameters.stackButtons
		endif
		if (OryUIParameters.titleTextAlignment > -999999)
			SetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtTitle, OryUIParameters.titleTextAlignment)
		endif
		if (OryUIParameters.titleTextColor#[1] > -999999 or OryUIParameters.titleTextColor#[2] > -999999 or OryUIParameters.titleTextColor#[3] > -999999 or OryUIParameters.titleTextColor#[4] > -999999)
			SetTextColor(OryUIDialogCollection[oryUIDialogID].txtTitle, OryUIParameters.titleTextColor#[1], OryUIParameters.titleTextColor#[2], OryUIParameters.titleTextColor#[3], OryUIParameters.titleTextColor#[4])
		endif
		if (OryUIParameters.imageID > -999999)
			SetSpriteImage(OryUIDialogCollection[oryUIDialogID].sprContainer, OryUIParameters.imageID)
		endif
		if (OryUIParameters.supportingTextAlignment > -999999)
			SetTextAlignment(OryUIDialogCollection[oryUIDialogID].txtSupportingText, OryUIParameters.supportingTextAlignment)
		endif
		if (OryUIParameters.supportingTextColor#[1] > -999999 or OryUIParameters.supportingTextColor#[2] > -999999 or OryUIParameters.supportingTextColor#[3] > -999999 or OryUIParameters.supportingTextColor#[4] > -999999)
			SetTextColor(OryUIDialogCollection[oryUIDialogID].txtSupportingText, OryUIParameters.supportingTextColor#[1], OryUIParameters.supportingTextColor#[2], OryUIParameters.supportingTextColor#[3], OryUIParameters.supportingTextColor#[4])
		endif
		if (OryUIParameters.uncheckedImageID > -999999)
			OryUIDialogCollection[oryUIDialogID].uncheckedImage = OryUIParameters.uncheckedImageID
		endif
	endif
endfunction

function OryUIUpdateDialogButton(oryUIDialogID as integer, oryUIButtonID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].sprContainer))
		if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999 or OryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].sprContainer, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], OryUIParameters.color#[4])
		endif
		if (OryUIParameters.name$ <> "")
			OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].name$ = OryUIParameters.name$
		endif
		if (OryUIParameters.text$ <> "")
			SetTextString(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].txtLabel, OryUIParameters.text$)
		endif
		if (OryUIParameters.textBold > -999999)
			SetTextBold(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].txtLabel, OryUIParameters.textBold)
		endif
		if (OryUIParameters.textColor#[1] > -999999 or OryUIParameters.textColor#[2] > -999999 or OryUIParameters.textColor#[3] > -999999 or OryUIParameters.textColor#[4] > -999999)
			SetTextColor(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].txtLabel, OryUIParameters.textColor#[1], OryUIParameters.textColor#[2], OryUIParameters.textColor#[3], OryUIParameters.textColor#[4])
		endif
		if (OryUIParameters.textSize# > -999999)
			SetTextSize(OryUIDialogCollection[oryUIDialogID].buttons[oryUIButtonID - 1].txtLabel, OryUIParameters.textSize#)
		endif
	endif
endfunction

foldend
