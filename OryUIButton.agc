
foldstart // OryUIButton Component (Updated 07/07/2020)

type typeOryUIButton
	id as integer
	disabledColor# as float[4]
	disabledIcon$ as string
	disabledIconColor# as float[4]
	disabledIconID as integer
	disabledIconPlacement$ as string
	disabledIconSize# as float[2]
	disabledImageID as integer
	disabledText$ as string
	disabledTextAlignment as integer
	disabledTextBold as integer
	disabledTextColor# as float[4]
	disabledTextSize# as float
	enabled as integer
	enabledColor# as float[4]
	enabledIcon$ as string
	enabledIconColor# as float[4]
	enabledIconID as integer
	enabledIconPlacement$ as string
	enabledIconSize# as float[2]
	enabledImageID as integer
	enabledText$ as string
	enabledTextAlignment as integer
	enabledTextBold as integer
	enabledTextColor# as float[4]
	enabledTextSize# as float
	held as integer
	icon$ as string
	iconPlacement$ as string
	pressed as integer
	released as integer
	sprContainer as integer
	sprIcon as integer
	timePressed# as float
	txtLabel as integer
endtype

global OryUIButtonCollection as typeOryUIButton[]
OryUIButtonCollection.length = 1

function OryUIButtonListener(oryUIButtonID as integer)
	local oryUIButtonIconSprite as integer
	local oryUIButtonSprite as integer
	local oryUIButtonText as integer
	
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		oryUIButtonIconSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
		oryUIButtonSprite = GetSpriteHitTest(OryUIButtonCollection[oryUIButtonID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
		oryUIButtonText = GetTextHitTest(OryUIButtonCollection[oryUIButtonID].txtLabel, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
		OryUIButtonCollection[oryUIButtonID].released = 0
		if (GetPointerPressed())
			OryUIButtonCollection[oryUIButtonID].held = 0
			OryUIButtonCollection[oryUIButtonID].pressed = 0
			if (oryUIButtonIconSprite = 1 or oryUIButtonSprite = 1 or oryUIButtonText = 1)
				OryUIButtonCollection[oryUIButtonID].pressed = 1
				OryUIButtonCollection[oryUIButtonID].timePressed# = timer()
			endif	
		elseif (OryUIButtonCollection[oryUIButtonID].pressed = 1)
			if (GetPointerState())
				if (timer() - OryUIButtonCollection[oryUIButtonID].timePressed# >= 0.4 and (oryUIButtonIconSprite = 1 or oryUIButtonSprite = 1 or oryUIButtonText = 1))
					OryUIButtonCollection[oryUIButtonID].held = 1
				endif
			endif
			if (GetPointerReleased())
				OryUIButtonCollection[oryUIButtonID].held = 0
				if (oryUIButtonIconSprite = 1 or oryUIButtonSprite = 1 or oryUIButtonText = 1)
					OryUIButtonCollection[oryUIButtonID].released = 1
				else
					OryUIButtonCollection[oryUIButtonID].released = 0
				endif
			endif
		endif
	endif
	
	if (OryUIButtonCollection[oryUIButtonID].enabled = 0 or (oryUIScrimVisible = 1 and GetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprContainer) >= oryUIScrimDepth) or oryUITouchingTopBar = 1 or oryUITouchingTabs = 1)
		OryUIButtonCollection[oryUIButtonID].pressed = 0
		OryUIButtonCollection[oryUIButtonID].held = 0
		OryUIButtonCollection[oryUIButtonID].released = 0
	endif
endfunction

function OryUICreateButton(oryUIComponentParameters$ as string)
	local oryUIButtonID as integer
	
	OryUIButtonCollection.length = OryUIButtonCollection.length + 1
	oryUIButtonID = OryUIButtonCollection.length
	OryUIButtonCollection[oryUIButtonID].id = oryUIButtonID

	oryUICreatedComponents.insert(OryUIAddCreatedComponent(oryUIButtonID, "Button"))
	
	// DEFAULT SETTINGS
	OryUIButtonCollection[oryUIButtonID].disabledColor#[1] = oryUIDefaults.buttonDisabledColor#[1]
	OryUIButtonCollection[oryUIButtonID].disabledColor#[2] = oryUIDefaults.buttonDisabledColor#[2]
	OryUIButtonCollection[oryUIButtonID].disabledColor#[3] = oryUIDefaults.buttonDisabledColor#[3]
	OryUIButtonCollection[oryUIButtonID].disabledColor#[4] = oryUIDefaults.buttonDisabledColor#[4]
	OryUIButtonCollection[oryUIButtonID].disabledIconColor#[1] = oryUIDefaults.buttonDisabledIconColor#[1]
	OryUIButtonCollection[oryUIButtonID].disabledIconColor#[2] = oryUIDefaults.buttonDisabledIconColor#[2]
	OryUIButtonCollection[oryUIButtonID].disabledIconColor#[3] = oryUIDefaults.buttonDisabledIconColor#[3]
	OryUIButtonCollection[oryUIButtonID].disabledIconColor#[4] = oryUIDefaults.buttonDisabledIconColor#[4]
	OryUIButtonCollection[oryUIButtonID].disabledIconSize#[1] = oryUIDefaults.buttonDisabledIconSize#[1]
	OryUIButtonCollection[oryUIButtonID].disabledIconSize#[2] = oryUIDefaults.buttonDisabledIconSize#[2]
	OryUIButtonCollection[oryUIButtonID].disabledTextAlignment = oryUIDefaults.buttonDisabledTextAlignment
	OryUIButtonCollection[oryUIButtonID].disabledTextBold = oryUIDefaults.buttonDisabledTextBold
	OryUIButtonCollection[oryUIButtonID].disabledTextColor#[1] = oryUIDefaults.buttonDisabledTextColor#[1]
	OryUIButtonCollection[oryUIButtonID].disabledTextColor#[2] = oryUIDefaults.buttonDisabledTextColor#[2]
	OryUIButtonCollection[oryUIButtonID].disabledTextColor#[3] = oryUIDefaults.buttonDisabledTextColor#[3]
	OryUIButtonCollection[oryUIButtonID].disabledTextColor#[4] = oryUIDefaults.buttonDisabledTextColor#[4]
	OryUIButtonCollection[oryUIButtonID].disabledTextSize# = oryUIDefaults.buttonDisabledTextSize#
	OryUIButtonCollection[oryUIButtonID].enabled = 1
	OryUIButtonCollection[oryUIButtonID].enabledColor#[1] = oryUIDefaults.buttonEnabledColor#[1]
	OryUIButtonCollection[oryUIButtonID].enabledColor#[2] = oryUIDefaults.buttonEnabledColor#[2]
	OryUIButtonCollection[oryUIButtonID].enabledColor#[3] = oryUIDefaults.buttonEnabledColor#[3]
	OryUIButtonCollection[oryUIButtonID].enabledColor#[4] = oryUIDefaults.buttonEnabledColor#[4]
	OryUIButtonCollection[oryUIButtonID].enabledIconColor#[1] = oryUIDefaults.buttonEnabledIconColor#[1]
	OryUIButtonCollection[oryUIButtonID].enabledIconColor#[2] = oryUIDefaults.buttonEnabledIconColor#[2]
	OryUIButtonCollection[oryUIButtonID].enabledIconColor#[3] = oryUIDefaults.buttonEnabledIconColor#[3]
	OryUIButtonCollection[oryUIButtonID].enabledIconColor#[4] = oryUIDefaults.buttonEnabledIconColor#[4]
	OryUIButtonCollection[oryUIButtonID].enabledIconSize#[1] = oryUIDefaults.buttonEnabledIconSize#[1]
	OryUIButtonCollection[oryUIButtonID].enabledIconSize#[2] = oryUIDefaults.buttonEnabledIconSize#[2]
	OryUIButtonCollection[oryUIButtonID].enabledTextAlignment = oryUIDefaults.buttonEnabledTextAlignment
	OryUIButtonCollection[oryUIButtonID].enabledTextBold = oryUIDefaults.buttonEnabledTextBold
	OryUIButtonCollection[oryUIButtonID].enabledTextColor#[1] = oryUIDefaults.buttonEnabledTextColor#[1]
	OryUIButtonCollection[oryUIButtonID].enabledTextColor#[2] = oryUIDefaults.buttonEnabledTextColor#[2]
	OryUIButtonCollection[oryUIButtonID].enabledTextColor#[3] = oryUIDefaults.buttonEnabledTextColor#[3]
	OryUIButtonCollection[oryUIButtonID].enabledTextColor#[4] = oryUIDefaults.buttonEnabledTextColor#[4]
	OryUIButtonCollection[oryUIButtonID].enabledTextSize# = oryUIDefaults.buttonEnabledTextSize#
	
	OryUIButtonCollection[oryUIButtonID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprContainer, oryUIDefaults.buttonSize#[1], oryUIDefaults.buttonSize#[2])
	SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIButtonCollection[oryUIButtonID].enabledColor#[1], OryUIButtonCollection[oryUIButtonID].enabledColor#[2], OryUIButtonCollection[oryUIButtonID].enabledColor#[3], OryUIButtonCollection[oryUIButtonID].enabledColor#[4])
	SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
	SetSpritePhysicsOff(OryUIButtonCollection[oryUIButtonID].sprContainer)
	
	OryUIButtonCollection[oryUIButtonID].enabledIcon$ = ""
	OryUIButtonCollection[oryUIButtonID].icon$ = ""
	OryUIButtonCollection[oryUIButtonID].sprIcon = CreateSprite(0)
	SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].enabledIconSize#[1], OryUIButtonCollection[oryUIButtonID].enabledIconSize#[2])
	SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].enabledIconColor#[1], OryUIButtonCollection[oryUIButtonID].enabledIconColor#[2], OryUIButtonCollection[oryUIButtonID].enabledIconColor#[3], OryUIButtonCollection[oryUIButtonID].enabledIconColor#[4])
	SetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprContainer) - 1)
	SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2)
	SetSpritePhysicsOff(OryUIButtonCollection[oryUIButtonID].sprIcon)
	OryUIPinSpriteToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)

	OryUIButtonCollection[oryUIButtonID].txtLabel = CreateText("")
	SetTextSize(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledTextSize#)
	SetTextColor(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledTextColor#[1], OryUIButtonCollection[oryUIButtonID].enabledTextColor#[2], OryUIButtonCollection[oryUIButtonID].enabledTextColor#[3], OryUIButtonCollection[oryUIButtonID].enabledTextColor#[4])
	SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, 1)
	SetTextDepth(OryUIButtonCollection[oryUIButtonID].txtLabel, GetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprContainer) - 1)
	OryUIPinTextToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateButton(oryUIButtonID, oryUIComponentParameters$)
endfunction oryUIButtonID

function OryUIDeleteButton(oryUIButtonID as integer)
	DeleteSprite(OryUIButtonCollection[oryUIButtonID].sprContainer)
	DeleteSprite(OryUIButtonCollection[oryUIButtonID].sprIcon)
	DeleteText(OryUIButtonCollection[oryUIButtonID].txtLabel)
endfunction

function OryUIDisableButton(oryUIButtonID as integer)
	if (OryUIButtonCollection[oryUIButtonID].enabled = 1)
		OryUIButtonCollection[oryUIButtonID].enabled = 0
		OryUIUpdateButton(oryUIButtonID, "enabled:false")
	endif
endfunction

function OryUIEnableButton(oryUIButtonID as integer)
	if (OryUIButtonCollection[oryUIButtonID].enabled = 0)
		OryUIButtonCollection[oryUIButtonID].enabled = 1
		OryUIUpdateButton(oryUIButtonID, "enabled:true")
	endif
endfunction

function OryUIGetButtonHeight(oryUIButtonID as integer)
	local oryUIButtonHeight# as float
	
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		oryUIButtonHeight# = GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprContainer)
	endif
endfunction oryUIButtonHeight#

function OryUIGetButtonHeld(oryUIButtonID as integer)
	OryUIButtonListener(oryUIButtonID)
endfunction OryUIButtonCollection[oryUIButtonID].held

function OryUIGetButtonPressed(oryUIButtonID as integer)
	OryUIButtonListener(oryUIButtonID)
endfunction OryUIButtonCollection[oryUIButtonID].pressed

function OryUIGetButtonReleased(oryUIButtonID as integer)
	OryUIButtonListener(oryUIButtonID)
endfunction OryUIButtonCollection[oryUIButtonID].released

function OryUIGetButtonWidth(oryUIButtonID as integer)
	local oryUIButtonWidth# as float
	
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		oryUIButtonWidth# = GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprContainer)
	endif
endfunction oryUIButtonWidth#

function OryUIGetButtonX(oryUIButtonID as integer)
	local oryUIButtonX# as float
	
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		oryUIButtonX# = GetSpriteX(OryUIButtonCollection[oryUIButtonID].sprContainer)
	endif
endfunction oryUIButtonX#

function OryUIGetButtonY(oryUIButtonID as integer)
	local oryUIButtonY# as float
	
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		oryUIButtonY# = GetSpriteY(OryUIButtonCollection[oryUIButtonID].sprContainer)
	endif
endfunction oryUIButtonY#

function OryUIUpdateButton(oryUIButtonID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	local oryUIIconAndLabelHeight# as float
	local oryUIIconAndLabelOffsetX# as float
	local oryUIIconAndLabelOffsetY# as float
	local oryUIIconAndLabelWidth# as float	
			
	if (GetSpriteExists(OryUIButtonCollection[oryUIButtonID].sprContainer))
		
		// PARAMETERS FOR SINGLE STATE
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledColor#[1] = oryUIParameters.color#[1]
			OryUIButtonCollection[oryUIButtonID].disabledColor#[2] = oryUIParameters.color#[2]
			OryUIButtonCollection[oryUIButtonID].disabledColor#[3] = oryUIParameters.color#[3]
			OryUIButtonCollection[oryUIButtonID].disabledColor#[4] = oryUIParameters.color#[4]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[1] = oryUIParameters.color#[1]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[2] = oryUIParameters.color#[2]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[3] = oryUIParameters.color#[3]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[4] = oryUIParameters.color#[4]
		endif
		if (oryUIParameters.enabled > -999999)
			OryUIButtonCollection[oryUIButtonID].enabled = oryUIParameters.enabled
		endif
		if (oryUIParameters.icon$ <> "" and oryUIParameters.iconID > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIcon$ = oryUIParameters.icon$
			OryUIButtonCollection[oryUIButtonID].disabledIconID = oryUIParameters.iconID
			OryUIButtonCollection[oryUIButtonID].enabledIcon$ = oryUIParameters.icon$
			OryUIButtonCollection[oryUIButtonID].enabledIconID = oryUIParameters.iconID
		elseif (oryUIParameters.iconID > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIcon$ = "custom"
			OryUIButtonCollection[oryUIButtonID].disabledIconID = oryUIParameters.iconID
			OryUIButtonCollection[oryUIButtonID].enabledIcon$ = "custom"
			OryUIButtonCollection[oryUIButtonID].enabledIconID = oryUIParameters.iconID
		endif
		if (oryUIParameters.iconColor#[1] > -999999 or oryUIParameters.iconColor#[2] > -999999 or oryUIParameters.iconColor#[3] > -999999 or oryUIParameters.iconColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[1] = oryUIParameters.iconColor#[1]
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[2] = oryUIParameters.iconColor#[2]
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[3] = oryUIParameters.iconColor#[3]
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[4] = oryUIParameters.iconColor#[4]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[1] = oryUIParameters.iconColor#[1]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[2] = oryUIParameters.iconColor#[2]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[3] = oryUIParameters.iconColor#[3]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[4] = oryUIParameters.iconColor#[4]
		endif
		if (oryUIParameters.iconPlacement$ <> "")
			OryUIButtonCollection[oryUIButtonID].disabledIconPlacement$ = oryUIParameters.iconPlacement$
			OryUIButtonCollection[oryUIButtonID].enabledIconPlacement$ = oryUIParameters.iconPlacement$
		endif
		if (oryUIParameters.iconSize#[1] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIconSize#[1] = oryUIParameters.iconSize#[1]
			OryUIButtonCollection[oryUIButtonID].enabledIconSize#[1] = oryUIParameters.iconSize#[1]
		endif
		if (oryUIParameters.iconSize#[2] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIconSize#[2] = oryUIParameters.iconSize#[2]
			OryUIButtonCollection[oryUIButtonID].enabledIconSize#[2] = oryUIParameters.iconSize#[2]
		endif
		if (oryUIParameters.imageID > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledImageID = oryUIParameters.imageID
			OryUIButtonCollection[oryUIButtonID].enabledImageID = oryUIParameters.imageID
		endif
		if (oryUIParameters.text$ <> "")
			if (lower(oryUIParameters.text$) = "null") then oryUIParameters.text$ = ""
			OryUIButtonCollection[oryUIButtonID].disabledText$ = oryUIParameters.text$
			OryUIButtonCollection[oryUIButtonID].enabledText$ = oryUIParameters.text$
		endif
		if (oryUIParameters.textAlignment > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextAlignment = oryUIParameters.textAlignment
			OryUIButtonCollection[oryUIButtonID].enabledTextAlignment = oryUIParameters.textAlignment
		endif
		if (oryUIParameters.textBold > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextBold = oryUIParameters.textBold
			OryUIButtonCollection[oryUIButtonID].enabledTextBold = oryUIParameters.textBold
		endif
		if (oryUIParameters.textColor#[1] > -999999 or oryUIParameters.textColor#[2] > -999999 or oryUIParameters.textColor#[3] > -999999 or oryUIParameters.textColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[1] = oryUIParameters.textColor#[1]
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[2] = oryUIParameters.textColor#[2]
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[3] = oryUIParameters.textColor#[3]
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[4] = oryUIParameters.textColor#[4]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[1] = oryUIParameters.textColor#[1]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[2] = oryUIParameters.textColor#[2]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[3] = oryUIParameters.textColor#[3]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[4] = oryUIParameters.textColor#[4]
		endif
		if (oryUIParameters.textSize# > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextSize# = oryUIParameters.textSize#
			OryUIButtonCollection[oryUIButtonID].enabledTextSize# = oryUIParameters.textSize#
		endif
		
		// PARAMETERS FOR DISABLED STATE
		if (oryUIParameters.disabledColor#[1] > -999999 or oryUIParameters.disabledColor#[2] > -999999 or oryUIParameters.disabledColor#[3] > -999999 or oryUIParameters.disabledColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledColor#[1] = oryUIParameters.disabledColor#[1]
			OryUIButtonCollection[oryUIButtonID].disabledColor#[2] = oryUIParameters.disabledColor#[2]
			OryUIButtonCollection[oryUIButtonID].disabledColor#[3] = oryUIParameters.disabledColor#[3]
			OryUIButtonCollection[oryUIButtonID].disabledColor#[4] = oryUIParameters.disabledColor#[4]
		endif
		if (oryUIParameters.disabledIconColor#[1] > -999999 or oryUIParameters.disabledIconColor#[2] > -999999 or oryUIParameters.disabledIconColor#[3] > -999999 or oryUIParameters.disabledIconColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[1] = oryUIParameters.disabledIconColor#[1]
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[2] = oryUIParameters.disabledIconColor#[2]
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[3] = oryUIParameters.disabledIconColor#[3]
			OryUIButtonCollection[oryUIButtonID].disabledIconColor#[4] = oryUIParameters.disabledIconColor#[4]
		endif
		if (oryUIParameters.disabledIcon$ <> "" and oryUIParameters.disabledIconID > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIcon$ = oryUIParameters.disabledIcon$
			OryUIButtonCollection[oryUIButtonID].disabledIconID = oryUIParameters.disabledIconID
		elseif (oryUIParameters.disabledIconID > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIcon$ = "custom"
			OryUIButtonCollection[oryUIButtonID].disabledIconID = oryUIParameters.disabledIconID
		endif
		if (oryUIParameters.disabledIconPlacement$ <> "")
			OryUIButtonCollection[oryUIButtonID].disabledIconPlacement$ = oryUIParameters.disabledIconPlacement$
		endif
		if (oryUIParameters.disabledIconSize#[1] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIconSize#[1] = oryUIParameters.disabledIconSize#[1]
		endif
		if (oryUIParameters.disabledIconSize#[2] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledIconSize#[2] = oryUIParameters.disabledIconSize#[2]
		endif
		if (oryUIParameters.disabledImageID > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledImageID = oryUIParameters.disabledImageID
		endif
		if (oryUIParameters.disabledText$ <> "")
			if (lower(oryUIParameters.disabledText$) = "null") then oryUIParameters.disabledText$ = ""
			OryUIButtonCollection[oryUIButtonID].disabledText$ = oryUIParameters.disabledText$
		endif
		if (oryUIParameters.disabledTextAlignment > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextAlignment = oryUIParameters.disabledTextAlignment
		endif
		if (oryUIParameters.disabledTextBold > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextBold = oryUIParameters.disabledTextBold
		endif
		if (oryUIParameters.disabledTextColor#[1] > -999999 or oryUIParameters.disabledTextColor#[2] > -999999 or oryUIParameters.disabledTextColor#[3] > -999999 or oryUIParameters.disabledTextColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[1] = oryUIParameters.disabledTextColor#[1]
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[2] = oryUIParameters.disabledTextColor#[2]
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[3] = oryUIParameters.disabledTextColor#[3]
			OryUIButtonCollection[oryUIButtonID].disabledTextColor#[4] = oryUIParameters.disabledTextColor#[4]
		endif
		if (oryUIParameters.disabledTextSize# > -999999)
			OryUIButtonCollection[oryUIButtonID].disabledTextSize# = oryUIParameters.disabledTextSize#
		endif
		
		// PARAMETERS FOR ENABLED STATE
		if (oryUIParameters.enabledColor#[1] > -999999 or oryUIParameters.enabledColor#[2] > -999999 or oryUIParameters.enabledColor#[3] > -999999 or oryUIParameters.enabledColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledColor#[1] = oryUIParameters.enabledColor#[1]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[2] = oryUIParameters.enabledColor#[2]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[3] = oryUIParameters.enabledColor#[3]
			OryUIButtonCollection[oryUIButtonID].enabledColor#[4] = oryUIParameters.enabledColor#[4]
		endif
		if (oryUIParameters.enabledIconColor#[1] > -999999 or oryUIParameters.enabledIconColor#[2] > -999999 or oryUIParameters.enabledIconColor#[3] > -999999 or oryUIParameters.enabledIconColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[1] = oryUIParameters.enabledIconColor#[1]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[2] = oryUIParameters.enabledIconColor#[2]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[3] = oryUIParameters.enabledIconColor#[3]
			OryUIButtonCollection[oryUIButtonID].enabledIconColor#[4] = oryUIParameters.enabledIconColor#[4]
		endif
		if (oryUIParameters.enabledIcon$ <> "" and oryUIParameters.enabledIconID > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledIcon$ = oryUIParameters.enabledIcon$
			OryUIButtonCollection[oryUIButtonID].enabledIconID = oryUIParameters.enabledIconID
		elseif (oryUIParameters.enabledIconID > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledIcon$ = "custom"
			OryUIButtonCollection[oryUIButtonID].enabledIconID = oryUIParameters.enabledIconID
		endif
		if (oryUIParameters.enabledIconPlacement$ <> "")
			OryUIButtonCollection[oryUIButtonID].enabledIconPlacement$ = oryUIParameters.enabledIconPlacement$
		endif
		if (oryUIParameters.enabledIconSize#[1] > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledIconSize#[1] = oryUIParameters.enabledIconSize#[1]
		endif
		if (oryUIParameters.enabledIconSize#[2] > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledIconSize#[2] = oryUIParameters.enabledIconSize#[2]
		endif
		if (oryUIParameters.enabledImageID > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledImageID = oryUIParameters.enabledImageID
		endif
		if (oryUIParameters.enabledText$ <> "")
			if (lower(oryUIParameters.enabledText$) = "null") then oryUIParameters.enabledText$ = ""
			OryUIButtonCollection[oryUIButtonID].enabledText$ = oryUIParameters.enabledText$
		endif
		if (oryUIParameters.enabledTextAlignment > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledTextAlignment = oryUIParameters.enabledTextAlignment
		endif
		if (oryUIParameters.enabledTextBold > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledTextBold = oryUIParameters.enabledTextBold
		endif
		if (oryUIParameters.enabledTextColor#[1] > -999999 or oryUIParameters.enabledTextColor#[2] > -999999 or oryUIParameters.enabledTextColor#[3] > -999999 or oryUIParameters.enabledTextColor#[4] > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[1] = oryUIParameters.enabledTextColor#[1]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[2] = oryUIParameters.enabledTextColor#[2]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[3] = oryUIParameters.enabledTextColor#[3]
			OryUIButtonCollection[oryUIButtonID].enabledTextColor#[4] = oryUIParameters.enabledTextColor#[4]
		endif
		if (oryUIParameters.enabledTextSize# > -999999)
			OryUIButtonCollection[oryUIButtonID].enabledTextSize# = oryUIParameters.enabledTextSize#
		endif
		
		// IMPORTANT PARAMETERS WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprContainer, oryUIParameters.size#[1], oryUIParameters.size#[2])
		elseif (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprContainer, oryUIParameters.size#[1], GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprContainer))
		elseif (oryUIParameters.size#[1] = -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprContainer, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprContainer), oryUIParameters.size#[2])
		endif
		if (oryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprContainer) / 2, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprContainer) / 2)
		else
			if (oryUIParameters.offset#[1] > -999999 or oryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, oryUIParameters.offset#[1], oryUIParameters.offset#[2])
			endif
		endif
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, oryUIParameters.position#[1], GetSpriteYByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer))
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer, GetSpriteXByOffset(OryUIButtonCollection[oryUIButtonID].sprContainer), oryUIParameters.position#[2])
		endif
		
		// DISABLED STATE
		if (OryUIButtonCollection[oryUIButtonID].enabled = 0)
			SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIButtonCollection[oryUIButtonID].disabledColor#[1], OryUIButtonCollection[oryUIButtonID].disabledColor#[2], OryUIButtonCollection[oryUIButtonID].disabledColor#[3], OryUIButtonCollection[oryUIButtonID].disabledColor#[4])
			if (OryUIButtonCollection[oryUIButtonID].disabledImageID > 0) then SetSpriteImage(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIButtonCollection[oryUIButtonID].disabledImageID)
			SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].disabledIconColor#[1], OryUIButtonCollection[oryUIButtonID].disabledIconColor#[2], OryUIButtonCollection[oryUIButtonID].disabledIconColor#[3], OryUIButtonCollection[oryUIButtonID].disabledIconColor#[4])
			SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].disabledIconSize#[1], OryUIButtonCollection[oryUIButtonID].disabledIconSize#[2])
			if (OryUIButtonCollection[oryUIButtonID].disabledIconID > 0) then SetSpriteImage(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].disabledIconID)
			SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].disabledTextAlignment)
			SetTextBold(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].disabledTextBold)
			SetTextColor(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].disabledTextColor#[1], OryUIButtonCollection[oryUIButtonID].disabledTextColor#[2], OryUIButtonCollection[oryUIButtonID].disabledTextColor#[3], OryUIButtonCollection[oryUIButtonID].disabledTextColor#[4])
			SetTextSize(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].disabledTextSize#)
			SetTextString(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].disabledText$)
			OryUIButtonCollection[oryUIButtonID].icon$ = OryUIButtonCollection[oryUIButtonID].disabledIcon$
			OryUIButtonCollection[oryUIButtonID].iconPlacement$ = OryUIButtonCollection[oryUIButtonID].disabledIconPlacement$
		endif
		
		// ENABLED STATE
		if (OryUIButtonCollection[oryUIButtonID].enabled = 1)
			SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIButtonCollection[oryUIButtonID].enabledColor#[1], OryUIButtonCollection[oryUIButtonID].enabledColor#[2], OryUIButtonCollection[oryUIButtonID].enabledColor#[3], OryUIButtonCollection[oryUIButtonID].enabledColor#[4])
			if (OryUIButtonCollection[oryUIButtonID].enabledImageID > 0) then SetSpriteImage(OryUIButtonCollection[oryUIButtonID].sprContainer, OryUIButtonCollection[oryUIButtonID].enabledImageID)
			SetSpriteColor(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].enabledIconColor#[1], OryUIButtonCollection[oryUIButtonID].enabledIconColor#[2], OryUIButtonCollection[oryUIButtonID].enabledIconColor#[3], OryUIButtonCollection[oryUIButtonID].enabledIconColor#[4])
			SetSpriteSize(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].enabledIconSize#[1], OryUIButtonCollection[oryUIButtonID].enabledIconSize#[2])
			if (OryUIButtonCollection[oryUIButtonID].enabledIconID > 0) then SetSpriteImage(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].enabledIconID)
			SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledTextAlignment)
			SetTextBold(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledTextBold)
			SetTextColor(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledTextColor#[1], OryUIButtonCollection[oryUIButtonID].enabledTextColor#[2], OryUIButtonCollection[oryUIButtonID].enabledTextColor#[3], OryUIButtonCollection[oryUIButtonID].enabledTextColor#[4])
			SetTextSize(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledTextSize#)
			SetTextString(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].enabledText$)
			OryUIButtonCollection[oryUIButtonID].icon$ = OryUIButtonCollection[oryUIButtonID].enabledIcon$
			OryUIButtonCollection[oryUIButtonID].iconPlacement$ = OryUIButtonCollection[oryUIButtonID].enabledIconPlacement$
		endif
		
		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.angle# > -999999)
			SetSpriteAngle(OryUIButtonCollection[oryUIButtonID].sprContainer, oryUIParameters.angle#)
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprContainer, oryUIParameters.depth)
			SetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprIcon, oryUIParameters.depth - 1)
			SetTextDepth(OryUIButtonCollection[oryUIButtonID].txtLabel, oryUIParameters.depth - 1)
		endif
		if (oryUIParameters.fixToScreen = 1)
			FixSpriteToScreen(OryUIButtonCollection[oryUIButtonID].sprContainer, 1)
		endif

		// POSITION EVERYTHING INSIDE CONTAINER
		if (GetTextString(OryUIButtonCollection[oryUIButtonID].txtLabel) = "" and OryUIButtonCollection[oryUIButtonID].icon$ = "")
		
		elseif (GetTextString(OryUIButtonCollection[oryUIButtonID].txtLabel) <> "" and OryUIButtonCollection[oryUIButtonID].icon$ = "")
			OryUIPinSpriteToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
			if (GetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel) = 0)
				OryUIPinTextToCentreLeftOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, 2, 0)
			elseif (GetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel)  = 1)
				OryUIPinTextToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
			elseif (GetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel)  = 2)
				OryUIPinTextToCentreRightOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprContainer, -2, 0)
			endif
			OryUIPinSpriteToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
			SetSpriteColorAlpha(OryUIButtonCollection[oryUIButtonID].sprIcon, 0)
		elseif (OryUIButtonCollection[oryUIButtonID].icon$ <> "" and GetTextString(OryUIButtonCollection[oryUIButtonID].txtLabel) = "")
			SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2)
			OryUIPinSpriteToCentreOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, 0)
			//SetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteDepth(OryUIButtonCollection[oryUIButtonID].sprContainer) - 1)		
		else
			oryUIIconAndLabelWidth# = GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprIcon) + 1 + GetTextTotalWidth(OryUIButtonCollection[oryUIButtonID].txtLabel)
			oryUIIconAndLabelOffsetX# = (GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprContainer) - oryUIIconAndLabelWidth#) / 2
			oryUIIconAndLabelHeight# = GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon) + 1 + GetTextTotalHeight(OryUIButtonCollection[oryUIButtonID].txtLabel)
			oryUIIconAndLabelOffsetY# = (GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprContainer) - oryUIIconAndLabelHeight#) / 2
			if (lower(OryUIButtonCollection[oryUIButtonID].iconPlacement$) = "left")
				SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprIcon, 0, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon))
				OryUIPinSpriteToCentreLeftOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, oryUIIconAndLabelOffsetX#, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2)
				OryUIPinTextToCentreRightOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprIcon, 1, 0)
				SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, 0)
			elseif (lower(OryUIButtonCollection[oryUIButtonID].iconPlacement$) = "right")
				SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprIcon), GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon))
				OryUIPinSpriteToCentreRightOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, -oryUIIconAndLabelOffsetX#, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2)
				OryUIPinTextToCentreLeftOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprIcon, -1, 0)
				SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, 2)
			elseif (lower(OryUIButtonCollection[oryUIButtonID].iconPlacement$) = "top")
				SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2, 0)
				OryUIPinSpriteToTopCentreOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, oryUIIconAndLabelOffsetY#)
				OryUIPinTextToBottomCentreOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprIcon, 0, 1 + GetTextTotalHeight(OryUIButtonCollection[oryUIButtonID].txtLabel))
				SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, 1)
			elseif (lower(OryUIButtonCollection[oryUIButtonID].iconPlacement$) = "bottom")
				SetSpriteOffset(OryUIButtonCollection[oryUIButtonID].sprIcon, GetSpriteWidth(OryUIButtonCollection[oryUIButtonID].sprIcon) / 2, GetSpriteHeight(OryUIButtonCollection[oryUIButtonID].sprIcon))
				OryUIPinSpriteToBottomCentreOfSprite(OryUIButtonCollection[oryUIButtonID].sprIcon, OryUIButtonCollection[oryUIButtonID].sprContainer, 0, oryUIIconAndLabelOffsetY#)
				OryUIPinTextToTopCentreOfSprite(OryUIButtonCollection[oryUIButtonID].txtLabel, OryUIButtonCollection[oryUIButtonID].sprIcon, 0, -(1 + GetTextTotalHeight(OryUIButtonCollection[oryUIButtonID].txtLabel)))
				SetTextAlignment(OryUIButtonCollection[oryUIButtonID].txtLabel, 1)
			endif
		endif
	endif
endfunction

foldend
