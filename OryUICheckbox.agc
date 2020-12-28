
foldstart // OryUICheckbox Widget

type typeOryUICheckbox
	id as integer
	checked as integer
	checkedChange as integer
	checkedColor# as float[4]
	checkedImageID as integer
	held as integer
	pressed as integer
	released as integer
	size# as float[2]
	sprContainer as integer
	sprIcon as integer
	timePressed# as float
	uncheckedColor# as float[4]
	uncheckedImageID as integer
	visible as integer
endtype

global OryUICheckboxCollection as typeOryUICheckbox[]
OryUICheckboxCollection.length = 1

function OryUICheckboxListener(oryUICheckboxID as integer)
	local oryUICheckboxContainerSprite as integer

	if (GetSpriteExists(OryUICheckboxCollection[oryUICheckboxID].sprContainer))
		if (OryUIGetSwipingVertically() = 0 and OryUIGetSwipingHorizontally() = 0 )
			oryUICheckboxContainerSprite = GetSpriteHitTest(OryUICheckboxCollection[oryUICheckboxID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			OryUICheckboxCollection[oryUICheckboxID].released = 0	
			if (GetPointerPressed())
				OryUICheckboxCollection[oryUICheckboxID].held = 0
				OryUICheckboxCollection[oryUICheckboxID].pressed = 0
				if (oryUICheckboxContainerSprite = 1)
					OryUICheckboxCollection[oryUICheckboxID].pressed = 1
					OryUICheckboxCollection[oryUICheckboxID].timePressed# = timer()
				endif
			elseif (OryUICheckboxCollection[oryUICheckboxID].pressed)
				if (GetPointerState())
					if (timer() - OryUICheckboxCollection[oryUICheckboxID].timePressed# >= 0.4 and oryUICheckboxContainerSprite = 1)
						OryUICheckboxCollection[oryUICheckboxID].held = 1
					endif
				endif
				if (GetPointerReleased())
					OryUICheckboxCollection[oryUICheckboxID].held = 0
					if (oryUICheckboxContainerSprite = 1)
						OryUICheckboxCollection[oryUICheckboxID].released = 1
						if (OryUICheckboxCollection[oryUICheckboxID].checked = 0)
							OryUICheckboxCollection[oryUICheckboxID].checked = 1
						else
							OryUICheckboxCollection[oryUICheckboxID].checked = 0
						endif
						OryUICheckboxCollection[oryUICheckboxID].checkedChange = 1
					else
						OryUICheckboxCollection[oryUICheckboxID].released = 0
					endif
				endif
			endif
		else
			OryUICheckboxCollection[oryUICheckboxID].pressed = 0
			OryUICheckboxCollection[oryUICheckboxID].held = 0
			OryUICheckboxCollection[oryUICheckboxID].released = 0
		endif
	
		if ((oryUIScrimVisible = 1 and GetSpriteDepth(OryUICheckboxCollection[oryUICheckboxID].sprContainer) >= oryUIScrimDepth) or oryUITouchingTopBar = 1 or oryUITouchingTabs = 1)
			OryUICheckboxCollection[oryUICheckboxID].pressed = 0
			OryUICheckboxCollection[oryUICheckboxID].held = 0
			OryUICheckboxCollection[oryUICheckboxID].released = 0
		endif

		if (OryUICheckboxCollection[oryUICheckboxID].checked = 0)
			SetSpriteImage(OryUICheckboxCollection[oryUICheckboxID].sprContainer, OryUICheckboxCollection[oryUICheckboxID].uncheckedImageID)
			SetSpriteColor(OryUICheckboxCollection[oryUICheckboxID].sprContainer, OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[1], OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[2], OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[3], OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[4])
		else
			SetSpriteImage(OryUICheckboxCollection[oryUICheckboxID].sprContainer, OryUICheckboxCollection[oryUICheckboxID].checkedImageID)
			SetSpriteColor(OryUICheckboxCollection[oryUICheckboxID].sprContainer, OryUICheckboxCollection[oryUICheckboxID].checkedColor#[1], OryUICheckboxCollection[oryUICheckboxID].checkedColor#[2], OryUICheckboxCollection[oryUICheckboxID].checkedColor#[3], OryUICheckboxCollection[oryUICheckboxID].checkedColor#[4])
		endif
	endif
endfunction

function OryUICreateCheckbox(oryUIWidgetParameters$ as string)
	local oryUICheckboxID as integer
	OryUICheckboxCollection.length = OryUICheckboxCollection.length + 1
	oryUICheckboxID = OryUICheckboxCollection.length
	OryUICheckboxCollection[oryUICheckboxID].id = oryUICheckboxID

	oryUICreatedWidgets.insert(OryUIAddCreatedWidget(oryUICheckboxID, "Checkbox"))

	// DEFAULT SETTINGS
	OryUICheckboxCollection[oryUICheckboxID].checkedColor#[1] = oryUIDefaults.checkboxCheckedColor#[1]
	OryUICheckboxCollection[oryUICheckboxID].checkedColor#[2] = oryUIDefaults.checkboxCheckedColor#[2]
	OryUICheckboxCollection[oryUICheckboxID].checkedColor#[3] = oryUIDefaults.checkboxCheckedColor#[3]
	OryUICheckboxCollection[oryUICheckboxID].checkedColor#[4] = oryUIDefaults.checkboxCheckedColor#[4]
	OryUICheckboxCollection[oryUICheckboxID].checkedImageID = oryUIDefaults.checkboxCheckedImage
	OryUICheckboxCollection[oryUICheckboxID].checked = 0
	OryUICheckboxCollection[oryUICheckboxID].held = 0
	OryUICheckboxCollection[oryUICheckboxID].pressed = 0
	OryUICheckboxCollection[oryUICheckboxID].released = 0
	OryUICheckboxCollection[oryUICheckboxID].size#[1] = oryUIDefaults.checkboxSize#[1]
	OryUICheckboxCollection[oryUICheckboxID].size#[2] = oryUIDefaults.checkboxSize#[2]
	OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[1] = oryUIDefaults.checkboxUncheckedColor#[1]
	OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[2] = oryUIDefaults.checkboxUncheckedColor#[2]
	OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[3] = oryUIDefaults.checkboxUncheckedColor#[3]
	OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[4] = oryUIDefaults.checkboxUncheckedColor#[4]
	OryUICheckboxCollection[oryUICheckboxID].uncheckedImageID = oryUIDefaults.checkboxUncheckedImage
	OryUICheckboxCollection[oryUICheckboxID].visible = 1

	OryUICheckboxCollection[oryUICheckboxID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUICheckboxCollection[oryUICheckboxID].sprContainer, oryUIDefaults.checkboxSize#[1], oryUIDefaults.checkboxSize#[2])
	SetSpriteDepth(OryUICheckboxCollection[oryUICheckboxID].sprContainer, oryUIDefaults.checkboxDepth)
	SetSpriteColor(OryUICheckboxCollection[oryUICheckboxID].sprContainer, 0, 0, 0, 0)
	SetSpriteOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, 0, 0)
	SetSpritePhysicsOff(OryUICheckboxCollection[oryUICheckboxID].sprContainer)

	if (oryUIWidgetParameters$ <> "") then OryUIUpdateCheckbox(oryUICheckboxID, oryUIWidgetParameters$)
endfunction oryUICheckboxID

function OryUIDeleteCheckbox(oryUICheckboxID as integer)
	DeleteSprite(OryUICheckboxCollection[oryUICheckboxID].sprContainer)
endfunction

function OryUIGetCheckboxChecked(oryUICheckboxID as integer)

endfunction OryUICheckboxCollection[oryUICheckboxID].checked

function OryUIGetCheckboxHeight(oryUICheckboxID as integer)
	local oryUICheckboxHeight# as float

	if (GetSpriteExists(OryUICheckboxCollection[oryUICheckboxID].sprContainer))
		oryUICheckboxHeight# = GetSpriteHeight(OryUICheckboxCollection[oryUICheckboxID].sprContainer)
	endif
endfunction oryUICheckboxHeight#

function OryUIGetCheckboxVisible(oryUICheckboxID as integer)

endfunction OryUICheckboxCollection[oryUICheckboxID].visible

function OryUIGetCheckboxWidth(oryUICheckboxID as integer)
	local oryUICheckboxWidth# as float

	if (GetSpriteExists(OryUICheckboxCollection[oryUICheckboxID].sprContainer))
		oryUICheckboxWidth# = GetSpriteWidth(OryUICheckboxCollection[oryUICheckboxID].sprContainer)
	endif
endfunction oryUICheckboxWidth#

function OryUIGetCheckboxX(oryUICheckboxID as integer)
	local oryUICheckboxX# as float
	if (OryUICheckboxCollection[oryUICheckboxID].visible = 1)
		oryUICheckboxX# = GetSpriteX(OryUICheckboxCollection[oryUICheckboxID].sprContainer)
	endif
endfunction oryUICheckboxX#

function OryUIGetCheckboxY(oryUICheckboxID as integer)
	local oryUICheckboxY# as float
	if (OryUICheckboxCollection[oryUICheckboxID].visible = 1)
		oryUICheckboxY# = GetSpriteY(OryUICheckboxCollection[oryUICheckboxID].sprContainer)
	endif
endfunction oryUICheckboxY#

function OryUIInsertCheckboxListener(oryUICheckboxID as integer)
	OryUICheckboxListener(oryUICheckboxID)
endfunction

function OryUIUpdateCheckbox(oryUICheckboxID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	if (GetSpriteExists(OryUICheckboxCollection[oryUICheckboxID].sprContainer))
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE WIDGET
		if (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUICheckboxCollection[oryUICheckboxID].sprContainer, oryUIParameters.size#[1], oryUIParameters.size#[2])
		elseif (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUICheckboxCollection[oryUICheckboxID].sprContainer, oryUIParameters.size#[1], GetSpriteHeight(OryUICheckboxCollection[oryUICheckboxID].sprContainer))
		elseif (oryUIParameters.size#[1] = -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUICheckboxCollection[oryUICheckboxID].sprContainer, GetSpriteWidth(OryUICheckboxCollection[oryUICheckboxID].sprContainer), oryUIParameters.size#[2])
		endif
		if (oryUIParameters.offsetTopLeft = 1)
			SetSpriteOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, 0, 0)
		elseif (oryUIParameters.offsetTopCenter = 1)
			SetSpriteOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, GetSpriteWidth(OryUICheckboxCollection[oryUICheckboxID].sprContainer) / 2.0, 0)
		elseif (oryUIParameters.offsetTopRight = 1)
			SetSpriteOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, GetSpriteWidth(OryUICheckboxCollection[oryUICheckboxID].sprContainer), 0)
		elseif (oryUIParameters.offsetCenterLeft = 1)
			SetSpriteOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, 0, GetSpriteHeight(OryUICheckboxCollection[oryUICheckboxID].sprContainer) / 2.0)
		elseif (oryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, GetSpriteWidth(OryUICheckboxCollection[oryUICheckboxID].sprContainer) / 2.0, GetSpriteHeight(OryUICheckboxCollection[oryUICheckboxID].sprContainer) / 2.0)
		elseif (oryUIParameters.offsetCenterRight = 1)
			SetSpriteOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, GetSpriteWidth(OryUICheckboxCollection[oryUICheckboxID].sprContainer), GetSpriteHeight(OryUICheckboxCollection[oryUICheckboxID].sprContainer) / 2.0)
		elseif (oryUIParameters.offsetBottomLeft = 1)
			SetSpriteOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, 0, GetSpriteHeight(OryUICheckboxCollection[oryUICheckboxID].sprContainer))
		elseif (oryUIParameters.offsetBottomCenter = 1)
			SetSpriteOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, GetSpriteWidth(OryUICheckboxCollection[oryUICheckboxID].sprContainer) / 2.0, GetSpriteHeight(OryUICheckboxCollection[oryUICheckboxID].sprContainer))
		elseif (oryUIParameters.offsetBottomRight = 1)
			SetSpriteOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, GetSpriteWidth(OryUICheckboxCollection[oryUICheckboxID].sprContainer), GetSpriteHeight(OryUICheckboxCollection[oryUICheckboxID].sprContainer))
		else
			if (oryUIParameters.offset#[1] > -999999 or oryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, oryUIParameters.offset#[1], oryUIParameters.offset#[2])
			endif
		endif
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, oryUIParameters.position#[1], GetSpriteYByOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer))
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer, GetSpriteXByOffset(OryUICheckboxCollection[oryUICheckboxID].sprContainer), oryUIParameters.position#[2])
		endif
		
		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.checkedColor#[1] > -999999 or oryUIParameters.checkedColor#[2] > -999999 or oryUIParameters.checkedColor#[3] > -999999 or oryUIParameters.checkedColor#[4] > -999999)
			OryUICheckboxCollection[oryUICheckboxID].checkedColor#[1] = oryUIParameters.checkedColor#[1]
			OryUICheckboxCollection[oryUICheckboxID].checkedColor#[2] = oryUIParameters.checkedColor#[2]
			OryUICheckboxCollection[oryUICheckboxID].checkedColor#[3] = oryUIParameters.checkedColor#[3]
			OryUICheckboxCollection[oryUICheckboxID].checkedColor#[4] = oryUIParameters.checkedColor#[4]
		endif
		if (oryUIParameters.checkedImageID > -999999)
			OryUICheckboxCollection[oryUICheckboxID].checkedImageID = oryUIParameters.checkedImageID
		endif
		if (oryUIParameters.uncheckedColor#[1] > -999999 or oryUIParameters.uncheckedColor#[2] > -999999 or oryUIParameters.uncheckedColor#[3] > -999999 or oryUIParameters.uncheckedColor#[4] > -999999)
			OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[1] = oryUIParameters.uncheckedColor#[1]
			OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[2] = oryUIParameters.uncheckedColor#[2]
			OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[3] = oryUIParameters.uncheckedColor#[3]
			OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[4] = oryUIParameters.uncheckedColor#[4]
		endif
		if (oryUIParameters.uncheckedImageID > -999999)
			OryUICheckboxCollection[oryUICheckboxID].uncheckedImageID = oryUIParameters.uncheckedImageID
		endif

		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUICheckboxCollection[oryUICheckboxID].sprContainer, oryUIParameters.depth)
		endif
		if (oryUIParameters.fixToScreen = 1)
			FixSpriteToScreen(OryUICheckboxCollection[oryUICheckboxID].sprContainer, 1)
		endif

		if (OryUICheckboxCollection[oryUICheckboxID].checked = 0)
			SetSpriteImage(OryUICheckboxCollection[oryUICheckboxID].sprContainer, OryUICheckboxCollection[oryUICheckboxID].uncheckedImageID)
			SetSpriteColor(OryUICheckboxCollection[oryUICheckboxID].sprContainer, OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[1], OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[2], OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[3], OryUICheckboxCollection[oryUICheckboxID].uncheckedColor#[4])
		else
			SetSpriteImage(OryUICheckboxCollection[oryUICheckboxID].sprContainer, OryUICheckboxCollection[oryUICheckboxID].checkedImageID)
			SetSpriteColor(OryUICheckboxCollection[oryUICheckboxID].sprContainer, OryUICheckboxCollection[oryUICheckboxID].checkedColor#[1], OryUICheckboxCollection[oryUICheckboxID].checkedColor#[2], OryUICheckboxCollection[oryUICheckboxID].checkedColor#[3], OryUICheckboxCollection[oryUICheckboxID].checkedColor#[4])
		endif
	endif
endfunction

foldend
