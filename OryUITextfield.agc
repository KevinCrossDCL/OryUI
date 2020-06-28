
foldstart // OryUITextfield Component (Updated 28/06/2020)

type typeOryUITextfield
	id as integer
	editBox as integer
	inputType$ as string
	labelText$ as string
	maxLength as integer
	pressed as integer
	showHelperText as integer
	sprActivationIndicator as integer
	sprContainer as integer
	sprInvisibleCover as integer
	sprLeadingIcon as integer
	sprTrailingIcon as integer
	strokeColor# as float[4]
	textColor# as float[4]
	textfieldType$ as string
	textInput$ as string
	tweenActivationIndicator as integer
	tweenEditBox as integer
	tweenLabel as integer
	txtHelper as integer
	txtInput as integer
	txtLabel as integer
endtype

global OryUITextfieldCollection as typeOryUITextfield[]
OryUITextfieldCollection.length = 1
global OryUITextfieldIDFocused as integer : OryUITextfieldIDFocused = -1

function OryUIAnyTextfieldFocused()
	local oryUIAnyTextfieldFocused
	if (OryUITextfieldIDFocused >= 0) then oryUIAnyTextfieldFocused = 1
endfunction oryUIAnyTextfieldFocused

function OryUICreateTextfield(oryUIComponentParameters$ as string)
	local oryUITextfieldID as integer
	OryUITextfieldCollection.length = OryUITextfieldCollection.length + 1
	oryUITextfieldID = OryUITextfieldCollection.length
	OryUITextfieldCollection[oryUITextfieldID].id = oryUITextfieldID

	// DEFAULT SETTINGS
	OryUITextfieldCollection[oryUITextfieldID].textColor#[1] = 0
	OryUITextfieldCollection[oryUITextfieldID].textColor#[2] = 0
	OryUITextfieldCollection[oryUITextfieldID].textColor#[3] = 0
	OryUITextfieldCollection[oryUITextfieldID].textColor#[4] = 255
	OryUITextfieldCollection[oryUITextfieldID].showHelperText = 0
	OryUITextfieldCollection[oryUITextfieldID].strokeColor#[1] = 101
	OryUITextfieldCollection[oryUITextfieldID].strokeColor#[2] = 28
	OryUITextfieldCollection[oryUITextfieldID].strokeColor#[3] = 228
	OryUITextfieldCollection[oryUITextfieldID].strokeColor#[4] = 255

	OryUITextfieldCollection[oryUITextfieldID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUITextfieldCollection[oryUITextfieldID].sprContainer, 78, 7.3) // 5.8 without label
	SetSpriteColor(OryUITextfieldCollection[oryUITextfieldID].sprContainer, 232, 232, 232, 255)
	SetSpriteOffset(OryUITextfieldCollection[oryUITextfieldID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUITextfieldCollection[oryUITextfieldID].sprContainer, 0, 0)

	OryUITextfieldCollection[oryUITextfieldID].editBox = CreateEditBox()
	SetEditBoxBackgroundColor(OryUITextfieldCollection[oryUITextfieldID].editBox, 232, 232, 232, 255)
	SetEditBoxBorderSize(OryUITextfieldCollection[oryUITextfieldID].editBox, 0)
	SetEditBoxCursorColor(OryUITextfieldCollection[oryUITextfieldID].editBox, oryUIParameters.strokeColor#[1], oryUIParameters.strokeColor#[2], oryUIParameters.strokeColor#[3])
	SetEditBoxUseAlternateInput(OryUITextfieldCollection[oryUITextfieldID].editBox, 0)
	SetEditBoxSize(OryUITextfieldCollection[oryUITextfieldID].editBox, 72, 4.4)
	SetEditBoxPosition(OryUITextfieldCollection[oryUITextfieldID].editBox, GetSpriteX(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + 3, GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + 2.8)
	SetEditBoxDepth(OryUITextfieldCollection[oryUITextfieldID].editBox, GetSpriteDepth(OryUITextfieldCollection[oryUITextfieldID].sprContainer) - 1)
	SetEditBoxActive(OryUITextfieldCollection[oryUITextfieldID].editBox, 0)
	SetEditBoxMultiLine(OryUITextfieldCollection[oryUITextfieldID].editBox, 0)
	
	OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator = CreateSprite(0)
	SetSpriteSize(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator, 0, 0.3)
	SetSpriteColor(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator, OryUITextfieldCollection[oryUITextfieldID].strokeColor#[1], OryUITextfieldCollection[oryUITextfieldID].strokeColor#[2], OryUITextfieldCollection[oryUITextfieldID].strokeColor#[3], 255)
	SetSpriteDepth(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator, GetSpriteDepth(OryUITextfieldCollection[oryUITextfieldID].sprContainer) - 2)
	SetSpriteOffset(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator, 0, 0)
	SetSpritePositionByOffset(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator, GetSpriteX(OryUITextfieldCollection[oryUITextfieldID].sprContainer), (GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer)) - 0.3)
		
	OryUITextfieldCollection[oryUITextfieldID].tweenActivationIndicator = CreateTweenSprite(0.2)

	OryUITextfieldCollection[oryUITextfieldID].txtLabel = CreateText("")
	SetTextSize(OryUITextfieldCollection[oryUITextfieldID].txtLabel, 3.6)
	SetTextColor(OryUITextfieldCollection[oryUITextfieldID].txtLabel, 0, 0, 0, 140)
	SetTextAlignment(OryUITextfieldCollection[oryUITextfieldID].txtLabel, 0)
	SetTextDepth(OryUITextfieldCollection[oryUITextfieldID].txtLabel, GetSpriteDepth(OryUITextfieldCollection[oryUITextfieldID].sprContainer) - 2)
	SetTextPosition(OryUITextfieldCollection[oryUITextfieldID].txtLabel, GetSpriteX(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + 3.4, (GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) / 2)) - (GetTextTotalHeight(OryUITextfieldCollection[oryUITextfieldID].txtLabel) / 2))

	OryUITextfieldCollection[oryUITextfieldID].txtHelper = CreateText("")
	SetTextSize(OryUITextfieldCollection[oryUITextfieldID].txtHelper, 2.5)
	SetTextColor(OryUITextfieldCollection[oryUITextfieldID].txtHelper, 0, 0, 0, 140)
	SetTextAlignment(OryUITextfieldCollection[oryUITextfieldID].txtHelper, 0)
	SetTextDepth(OryUITextfieldCollection[oryUITextfieldID].txtHelper, GetSpriteDepth(OryUITextfieldCollection[oryUITextfieldID].sprContainer) - 2)
	SetTextPosition(OryUITextfieldCollection[oryUITextfieldID].txtHelper, GetSpriteX(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + 3.4, GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + 1)

	OryUITextfieldCollection[oryUITextfieldID].tweenLabel = CreateTweenText(0.2)

	OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover = CreateSprite(0)
	SetSpriteSize(OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover, 78, 7.3) // 5.8 without label
	SetSpriteColor(OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover, 0, 0, 0, 0)
	SetSpriteDepth(OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover, GetSpriteDepth(OryUITextfieldCollection[oryUITextfieldID].sprContainer) - 2)
	SetSpriteOffset(OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover, 0, 0)
	SetSpritePositionByOffset(OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover, 0, 0)
	
	if (oryUIComponentParameters$ <> "") then OryUIUpdateTextfield(oryUITextfieldID, oryUIComponentParameters$)
endfunction oryUITextfieldID

function OryUIDeleteTextfield(oryUITextfieldID as integer)
	if (oryUITextfieldID <= OryUITextfieldCollection.length)
		DeleteSprite(OryUITextfieldCollection[oryUITextfieldID].sprContainer)
		DeleteEditBox(OryUITextfieldCollection[oryUITextfieldID].editBox)
		DeleteSprite(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator)
		DeleteText(OryUITextfieldCollection[oryUITextfieldID].txtLabel)
		DeleteSprite(OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover)
	endif
endfunction

function OryUIGetTextfieldHasFocus(oryUITextfieldID as integer)
	local oryUITextfieldHasFocus as integer
	if (GetEditBoxHasFocus(OryUITextfieldCollection[oryUITextfieldID].editBox))
		oryUITextfieldHasFocus = 1
	endif
endfunction oryUITextfieldHasFocus

function OryUIGetTextfieldHeight(oryUITextfieldID as integer)
	local oryUITextfieldHeight#
	if (oryUITextfieldID <= OryUITextfieldCollection.length)
		if (GetSpriteExists(OryUITextfieldCollection[oryUITextfieldID].sprContainer))
			oryUITextfieldHeight# = GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer)
			if (OryUITextfieldCollection[oryUITextfieldID].showHelperText = 1)
				oryUITextfieldHeight# = oryUITextfieldHeight# + (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.06849315068) + GetTextTotalHeight(OryUITextfieldCollection[oryUITextfieldID].txtHelper)
			endif
		endif
	endif
endfunction oryUITextfieldHeight#

function OryUIGetTextfieldString(oryUITextfieldID as integer)
	local oryUITextfieldString$
	if (oryUITextfieldID <= OryUITextfieldCollection.length)
		if (GetSpriteExists(OryUITextfieldCollection[oryUITextfieldID].sprContainer))
			oryUITextfieldString$ = GetEditBoxText(OryUITextfieldCollection[oryUITextfieldID].editBox)
		endif
	endif
endfunction oryUITextfieldString$

function OryUIGetTextfieldWidth(oryUITextfieldID as integer)
	local oryUITextfieldWidth#
	if (oryUITextfieldID <= OryUITextfieldCollection.length)
		if (GetSpriteExists(OryUITextfieldCollection[oryUITextfieldID].sprContainer))
			oryUITextfieldWidth# = GetSpriteWidth(OryUITextfieldCollection[oryUITextfieldID].sprContainer)
		endif
	endif
endfunction oryUITextfieldWidth#

function OryUIGetTextfieldX(oryUITextfieldID as integer)
	local oryUITextfieldX#
	if (oryUITextfieldID <= OryUITextfieldCollection.length)
		if (GetSpriteExists(OryUITextfieldCollection[oryUITextfieldID].sprContainer))
			oryUITextfieldX# = GetSpriteX(OryUITextfieldCollection[oryUITextfieldID].sprContainer)
		endif
	endif
endfunction oryUITextfieldX#

function OryUIGetTextfieldY(oryUITextfieldID as integer)
	local oryUITextfieldY#
	if (oryUITextfieldID <= OryUITextfieldCollection.length)
		if (GetSpriteExists(OryUITextfieldCollection[oryUITextfieldID].sprContainer))
			oryUITextfieldY# = GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer)
		endif
	endif
endfunction oryUITextfieldY#


function OryUIInsertTextfieldListener(oryUITextfieldID as integer)
	if (oryUIScrimVisible = 1) then exitfunction
	
	//local oryUITextfieldSprite as integer
	if (oryUITextfieldID <= OryUITextfieldCollection.length)
		if (GetSpriteExists(OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover))
			if (GetPointerPressed())
				if (OryUIGetSwipingVertically() = 0)
					oryUITextfieldIvisibleCoverSprite = GetSpriteHitTest(OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (oryUITextfieldIvisibleCoverSprite = 1)
						OryUITextfieldCollection[oryUITextfieldID].pressed = 1
					else
						OryUITextfieldCollection[oryUITextfieldID].pressed = 0
					endif
				else
					OryUITextfieldCollection[oryUITextfieldID].pressed = 0
				endif
			elseif (OryUITextfieldCollection[oryUITextfieldID].pressed = 1)
				if (GetPointerState())
					if (OryUIGetSwipingVertically())
						OryUITextfieldCollection[oryUITextfieldID].pressed = 0
					endif
				endif
				if (GetPointerReleased())
					if (OryUIGetSwipingVertically() = 0)
						oryUITextfieldIvisibleCoverSprite = GetSpriteHitTest(OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (OryUITextfieldCollection[oryUITextfieldID].pressed = 1)
							if (oryUITextfieldIvisibleCoverSprite = 1)
								SetEditBoxActive(OryUITextfieldCollection[oryUITextfieldID].editBox, 1)
								SetEditBoxFocus(OryUITextfieldCollection[oryUITextfieldID].editBox, 1)
							else
								SetEditBoxActive(OryUITextfieldCollection[oryUITextfieldID].editBox, 0)
								SetEditBoxFocus(OryUITextfieldCollection[oryUITextfieldID].editBox, 0)
							endif
						endif
					endif
					OryUITextfieldCollection[oryUITextfieldID].pressed = 0
				endif
				
			endif
		endif
		if (GetEditBoxExists(OryUITextfieldCollection[oryUITextfieldID].editBox))
			if (GetEditBoxHasFocus(OryUITextfieldCollection[oryUITextfieldID].editBox))
				//if (GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) - 10.63 > 0)
				//	SetViewOffset(GetViewOffsetX(), GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) - 10.63)
				//endif
				OryUITextfieldIDFocused = oryUITextfieldID
				SetTextSize(OryUITextfieldCollection[oryUITextfieldID].txtLabel, GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.3287671233)
				SetTextY(OryUITextfieldCollection[oryUITextfieldID].txtLabel, (GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) / 2)) - (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.3287671233) - (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.04109589041))
				SetTextColor(OryUITextfieldCollection[oryUITextfieldID].txtLabel, OryUITextfieldCollection[oryUITextfieldID].strokeColor#[1], OryUITextfieldCollection[oryUITextfieldID].strokeColor#[2], OryUITextfieldCollection[oryUITextfieldID].strokeColor#[3], 255)
				SetSpriteSize(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator, GetSpriteWidth(OryUITextfieldCollection[oryUITextfieldID].sprContainer), GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator))
			else
				if (OryUITextfieldIDFocused = oryUITextfieldID) then OryUITextfieldIDFocused = -1
				if (GetEditBoxText(OryUITextfieldCollection[oryUITextfieldID].editBox) = "")
					SetTextSize(OryUITextfieldCollection[oryUITextfieldID].txtLabel, GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.4931506849)
					SetTextY(OryUITextfieldCollection[oryUITextfieldID].txtLabel, (GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) / 2)) - ((GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.4931506849) / 2))
					SetTextColor(OryUITextfieldCollection[oryUITextfieldID].txtLabel, OryUITextfieldCollection[oryUITextfieldID].textColor#[1], OryUITextfieldCollection[oryUITextfieldID].textColor#[2], OryUITextfieldCollection[oryUITextfieldID].textColor#[3], 140)
					SetSpriteSize(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator, 0, GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator))
				else
					SetTextSize(OryUITextfieldCollection[oryUITextfieldID].txtLabel, GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.3287671233)
					SetTextY(OryUITextfieldCollection[oryUITextfieldID].txtLabel, (GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) / 2)) - (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.3287671233) - (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.04109589041))
					SetTextColor(OryUITextfieldCollection[oryUITextfieldID].txtLabel, OryUITextfieldCollection[oryUITextfieldID].strokeColor#[1], OryUITextfieldCollection[oryUITextfieldID].strokeColor#[2], OryUITextfieldCollection[oryUITextfieldID].strokeColor#[3], 255)
					SetSpriteSize(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator, 0, GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator))
				endif
				SetEditBoxActive(OryUITextfieldCollection[oryUITextfieldID].editBox, 0)
			endif
		endif
	endif
endfunction	

function OryUIUpdateTextfield(oryUITextfieldID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)
	
	if (oryUITextfieldID <= OryUITextfieldCollection.length)
		if (GetEditBoxExists(OryUITextfieldCollection[oryUITextfieldID].editBox))

			// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
			if (oryUIParameters.size#[1] > -999999)
				SetSpriteSize(OryUITextfieldCollection[oryUITextfieldID].sprContainer, oryUIParameters.size#[1], GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer))
				SetEditBoxSize(OryUITextfieldCollection[oryUITextfieldID].editBox, GetSpriteWidth(OryUITextfieldCollection[oryUITextfieldID].sprContainer) - 6, GetEditBoxHeight(OryUITextfieldCollection[oryUITextfieldID].editBox))
				SetSpriteSize(OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover, oryUIParameters.size#[1], GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer))
			endif
			if (oryUIParameters.size#[2] > -999999)
				SetSpriteSize(OryUITextfieldCollection[oryUITextfieldID].sprContainer, GetSpriteWidth(OryUITextfieldCollection[oryUITextfieldID].sprContainer), oryUIParameters.size#[2])
				SetEditBoxSize(OryUITextfieldCollection[oryUITextfieldID].editBox, GetSpriteWidth(OryUITextfieldCollection[oryUITextfieldID].sprContainer) - 6, GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.602739726)
				SetSpriteSize(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator, 0, GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.04109589041)
				SetTextSize(OryUITextfieldCollection[oryUITextfieldID].txtLabel, GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.4931506849)
				SetTextSize(OryUITextfieldCollection[oryUITextfieldID].txtHelper, GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.3424657534)
				SetSpriteSize(OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover, GetSpriteWidth(OryUITextfieldCollection[oryUITextfieldID].sprContainer), GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer))
			endif
			if (oryUIParameters.position#[1] > -999999 or oryUIParameters.position#[2] > -999999)
				SetSpritePositionByOffset(OryUITextfieldCollection[oryUITextfieldID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
				SetEditBoxPosition(OryUITextfieldCollection[oryUITextfieldID].editBox, GetSpriteX(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.4109589041), GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.3835616438))
				SetTextPosition(OryUITextfieldCollection[oryUITextfieldID].txtLabel, GetSpriteX(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.4657534247), (GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) / 2)) - (GetTextTotalHeight(OryUITextfieldCollection[oryUITextfieldID].txtLabel) / 2))
				SetSpritePositionByOffset(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator, GetSpriteX(OryUITextfieldCollection[oryUITextfieldID].sprContainer), (GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer)) - (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.04109589041))
				SetSpritePositionByOffset(OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover, oryUIParameters.position#[1], oryUIParameters.position#[2])
				if (OryUITextfieldCollection[oryUITextfieldID].showHelperText = 1)
					SetTextPosition(OryUITextfieldCollection[oryUITextfieldID].txtHelper, GetSpriteX(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.4657534247), GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.06849315068))
				else
					SetTextPosition(OryUITextfieldCollection[oryUITextfieldID].txtHelper, -999999, -999999)
				endif
			endif

			// THE REST OF THE PARAMETERS NEXT
			if (oryUIParameters.backgroundColor#[1] > -999999 or oryUIParameters.backgroundColor#[2] > -999999 or oryUIParameters.backgroundColor#[3] > -999999 or oryUIParameters.backgroundColor#[4] > -999999)
				SetSpriteColor(OryUITextfieldCollection[oryUITextfieldID].sprContainer, oryUIParameters.backgroundColor#[1], oryUIParameters.backgroundColor#[2], oryUIParameters.backgroundColor#[3], oryUIParameters.backgroundColor#[4])
				SetEditBoxBackgroundColor(OryUITextfieldCollection[oryUITextfieldID].editBox, oryUIParameters.backgroundColor#[1], oryUIParameters.backgroundColor#[2], oryUIParameters.backgroundColor#[3], oryUIParameters.backgroundColor#[4])
			endif
			if (oryUIParameters.depth > -999999)
				SetSpriteDepth(OryUITextfieldCollection[oryUITextfieldID].sprContainer, oryUIParameters.depth)
				SetEditBoxDepth(OryUITextfieldCollection[oryUITextfieldID].editBox, oryUIParameters.depth - 1)
				SetTextDepth(OryUITextfieldCollection[oryUITextfieldID].txtLabel, oryUIParameters.depth - 2)
				SetTextDepth(OryUITextfieldCollection[oryUITextfieldID].txtHelper, oryUIParameters.depth - 2)
				SetSpriteDepth(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator, oryUIParameters.depth - 2)
				SetSpriteDepth(OryUITextfieldCollection[oryUITextfieldID].sprInvisibleCover, oryUIParameters.depth - 2)
			endif
			if (oryUIParameters.helperText$ <> "")
				if (lower(oryUIParameters.helperText$) = "null") then oryUIParameters.helperText$ = ""
				SetTextString(OryUITextfieldCollection[oryUITextfieldID].txtHelper, oryUIParameters.helperText$)
			endif
			if (oryUIParameters.helperTextColor#[1] > -999999 or oryUIParameters.helperTextColor#[2] > -999999 or oryUIParameters.helperTextColor#[3] > -999999 or oryUIParameters.helperTextColor#[4] > -999999)
				SetTextColor(OryUITextfieldCollection[oryUITextfieldID].txtHelper, oryUIParameters.helperTextColor#[1], oryUIParameters.helperTextColor#[2], oryUIParameters.helperTextColor#[3], oryUIParameters.helperTextColor#[4])
			endif
			if (oryUIParameters.inputText$ <> "")
				if (GetEditBoxHasFocus(OryUITextfieldCollection[oryUITextfieldID].editBox) = 0) // and GetEditBoxText(OryUITextfieldCollection[oryUITextfieldID].editBox) = "")
					if (lower(oryUIParameters.inputText$) = "null") then oryUIParameters.inputText$ = ""
					SetEditBoxText(OryUITextfieldCollection[oryUITextfieldID].editBox, oryUIParameters.inputText$)
					SetTextSize(OryUITextfieldCollection[oryUITextfieldID].txtLabel, 2.4)
					SetTextY(OryUITextfieldCollection[oryUITextfieldID].txtLabel, (GetSpriteY(OryUITextfieldCollection[oryUITextfieldID].sprContainer) + (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) / 2)) - 2.4 - (GetSpriteHeight(OryUITextfieldCollection[oryUITextfieldID].sprContainer) * 0.04109589041))
				endif
			endif
			if (oryUIParameters.inputType$ <> "")
				if (oryUIParameters.inputType$ = "integer" or oryUIParameters.inputType$ = "int")
					SetEditBoxInputType(OryUITextfieldCollection[oryUITextfieldID].editBox, 1)
				elseif (oryUIParameters.inputType$ = "string" or oryUIParameters.inputType$ = "str")
					SetEditBoxInputType(OryUITextfieldCollection[oryUITextfieldID].editBox, 0)
				endif
			endif
			if (oryUIParameters.labelText$ <> "")
				if (lower(oryUIParameters.labelText$) = "null") then oryUIParameters.labelText$ = ""
				SetTextString(OryUITextfieldCollection[oryUITextfieldID].txtLabel, oryUIParameters.labelText$)
			endif
			if (oryUIParameters.maxLength > 0)
				OryUITextfieldCollection[oryUITextfieldID].maxLength = oryUIParameters.maxLength
				SetEditBoxMaxChars(OryUITextfieldCollection[oryUITextfieldID].editBox, OryUITextfieldCollection[oryUITextfieldID].maxLength)
			endif
			//if (oryUIParameters.placeholderTextColor#[1] > -999999 or oryUIParameters.placeholderTextColor#[2] > -999999 or oryUIParameters.placeholderTextColor#[3] > -999999)
				//OryUITextfieldCollection[oryUITextfieldID].placeholderTextColor#[1] = oryUIParameters.placeholderTextColor#[1]
				//OryUITextfieldCollection[oryUITextfieldID].placeholderTextColor#[2] = oryUIParameters.placeholderTextColor#[2]
				//OryUITextfieldCollection[oryUITextfieldID].placeholderTextColor#[3] = oryUIParameters.placeholderTextColor#[3]
				//OryUITextfieldCollection[oryUITextfieldID].placeholderTextColor#[4] = oryUIParameters.placeholderTextColor#[4]
				//if (GetEditBoxText(OryUITextfieldCollection[oryUITextfieldID].editBox) = "")
					//SetTextColor(OryUITextfieldCollection[oryUITextfieldID].txtLabel, oryUIParameters.placeholderTextColor#[1], oryUIParameters.placeholderTextColor#[2], oryUIParameters.placeholderTextColor#[3], oryUIParameters.placeholderTextColor#[4])
				//endif
			//endif
			if (oryUIParameters.showHelperText > -999999)
				OryUITextfieldCollection[oryUITextfieldID].showHelperText = oryUIParameters.showHelperText
			endif
			if (oryUIParameters.strokeColor#[1] > -999999 or oryUIParameters.strokeColor#[2] > -999999 or oryUIParameters.strokeColor#[3] > -999999)
				OryUITextfieldCollection[oryUITextfieldID].strokeColor#[1] = oryUIParameters.strokeColor#[1]
				OryUITextfieldCollection[oryUITextfieldID].strokeColor#[2] = oryUIParameters.strokeColor#[2]
				OryUITextfieldCollection[oryUITextfieldID].strokeColor#[3] = oryUIParameters.strokeColor#[3]
				OryUITextfieldCollection[oryUITextfieldID].strokeColor#[4] = oryUIParameters.strokeColor#[4]
				if (GetEditBoxText(OryUITextfieldCollection[oryUITextfieldID].editBox) <> "")
					SetTextColor(OryUITextfieldCollection[oryUITextfieldID].txtLabel, oryUIParameters.strokeColor#[1], oryUIParameters.strokeColor#[2], oryUIParameters.strokeColor#[3], oryUIParameters.strokeColor#[4])
				endif
				SetSpriteColor(OryUITextfieldCollection[oryUITextfieldID].sprActivationIndicator, oryUIParameters.strokeColor#[1], oryUIParameters.strokeColor#[2], oryUIParameters.strokeColor#[3], oryUIParameters.strokeColor#[4])
				SetEditBoxCursorColor(OryUITextfieldCollection[oryUITextfieldID].editBox, oryUIParameters.strokeColor#[1], oryUIParameters.strokeColor#[2], oryUIParameters.strokeColor#[3])
			endif
			if (oryUIParameters.textColor#[1] > -999999 or oryUIParameters.textColor#[2] > -999999 or oryUIParameters.textColor#[3] > -999999 or oryUIParameters.textColor#[4] > -999999)
				OryUITextfieldCollection[oryUITextfieldID].textColor#[1] = oryUIParameters.textColor#[1]
				OryUITextfieldCollection[oryUITextfieldID].textColor#[2] = oryUIParameters.textColor#[2]
				OryUITextfieldCollection[oryUITextfieldID].textColor#[3] = oryUIParameters.textColor#[3]
				OryUITextfieldCollection[oryUITextfieldID].textColor#[4] = oryUIParameters.textColor#[4]
				SetEditBoxTextColor(OryUITextfieldCollection[oryUITextfieldID].editBox, oryUIParameters.textColor#[1], oryUIParameters.textColor#[2], oryUIParameters.textColor#[3])
			endif
		endif
	endif
endfunction

foldend
