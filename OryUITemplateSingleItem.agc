// This is a template file to use for future single item widgets

foldstart // OryUITemplateSingleItem Widget

type typeOryUITemplateSingleItem
	id as integer
	color# as float[4]
	held as integer
	pressed as integer
	released as integer
	size# as float[2]
	sprContainer as integer
	timePressed# as float
	visible as integer
endtype

global OryUITemplateSingleItemCollection as typeOryUITemplateSingleItem[]
OryUITemplateSingleItemCollection.length = 1

function OryUICreateTemplateSingleItem(oryUIWidgetParameters$ as string)
	local oryUITemplateSingleItemID as integer
	OryUITemplateSingleItemCollection.length = OryUITemplateSingleItemCollection.length + 1
	oryUITemplateSingleItemID = OryUITemplateSingleItemCollection.length
	OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].id = oryUITemplateSingleItemID

	oryUICreatedWidgets.insert(OryUIAddCreatedWidget(oryUITemplateSingleItemID, "TemplateSingleItem"))

	// DEFAULT SETTINGS
	OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].color#[1] = oryUIDefaults.templateColor#[1]
	OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].color#[2] = oryUIDefaults.templateColor#[2]
	OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].color#[3] = oryUIDefaults.templateColor#[3]
	OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].color#[4] = oryUIDefaults.templateColor#[4]
	OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].pressed = 0
	OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].released = 0
	OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].size#[1] = oryUIDefaults.templateWidth#
	OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].size#[2] = oryUIDefaults.templateHeight#
	OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].visible = 1

	OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, oryUIDefaults.templateWidth#, oryUIDefaults.templateHeight#)
	SetSpriteDepth(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, oryUIDefaults.templateDepth)
	SetSpriteColor(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, oryUIDefaults.templateColor#[1], oryUIDefaults.templateColor#[2], oryUIDefaults.templateColor#[3], oryUIDefaults.templateColor#[4])
	SetSpriteOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, 0, 0)
	SetSpritePhysicsOff(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer)

	if (oryUIWidgetParameters$ <> "") then OryUIUpdateTemplateSingleItem(oryUITemplateSingleItemID, oryUIWidgetParameters$)
endfunction oryUITemplateSingleItemID

function OryUIDeleteTemplateSingleItem(oryUITemplateSingleItemID as integer)
	DeleteSprite(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer)
endfunction

function OryUIGetTemplateSingleItemHeight(oryUITemplateSingleItemID as integer)
	local oryUITemplateSingleItemHeight# as float

	if (GetSpriteExists(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer))
		oryUITemplateSingleItemHeight# = GetSpriteHeight(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer)
	endif
endfunction oryUITemplateSingleItemHeight#

function OryUIGetTemplateSingleItemVisible(oryUITemplateSingleItemID as integer)

endfunction OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].visible

function OryUIGetTemplateSingleItemWidth(oryUITemplateSingleItemID as integer)
	local oryUITemplateSingleItemWidth# as float

	if (GetSpriteExists(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer))
		oryUITemplateSingleItemWidth# = GetSpriteWidth(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer)
	endif
endfunction oryUITemplateSingleItemWidth#

function OryUIGetTemplateSingleItemX(oryUITemplateSingleItemID as integer)
	local oryUITemplateSingleItemX# as float
	if (OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].visible = 1)
		oryUITemplateSingleItemX# = GetSpriteX(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer)
	endif
endfunction oryUITemplateSingleItemX#

function OryUIGetTemplateSingleItemY(oryUITemplateSingleItemID as integer)
	local oryUITemplateSingleItemY# as float
	if (OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].visible = 1)
		oryUITemplateSingleItemY# = GetSpriteY(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer)
	endif
endfunction oryUITemplateSingleItemY#

function OryUIInsertTemplateSingleItemListener(oryUITemplateSingleItemID as integer)
	OryUITemplateSingleItemListener(oryUITemplateSingleItemID)
endfunction

function OryUITemplateSingleItemListener(oryUITemplateSingleItemID as integer)
	local oryUITemplateSingleItemContainerSprite as integer

	if (GetSpriteExists(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer))
		if (OryUIGetSwipingVertically() = 0 and OryUIGetSwipingHorizontally() = 0 )
			oryUITemplateSingleItemContainerSprite = GetSpriteHitTest(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].released = 0	
			if (GetPointerPressed())
				OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].held = 0
				OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].pressed = 0
				if (oryUITemplateSingleItemContainerSprite = 1)
					OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].pressed = 1
					OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].timePressed# = timer()
				endif
			elseif (OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].pressed)
				if (GetPointerState())
					if (timer() - OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].timePressed# >= 0.4 and oryUITemplateSingleItemContainerSprite = 1)
						OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].held = 1
					endif
				endif
				if (GetPointerReleased())
					OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].held = 0
					if (oryUITemplateSingleItemContainerSprite = 1)
						OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].released = 1
					else
						OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].released = 0
					endif
				endif
			endif
		else
			OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].pressed = 0
			OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].held = 0
			OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].released = 0
		endif

		if ((oryUIScrimVisible = 1 and GetSpriteDepth(OryUISwitchCollection[oryUITemplateSingleItemID].sprContainer) >= oryUIScrimDepth) or oryUITouchingTopBar = 1 or oryUITouchingTabs = 1)
			OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].pressed = 0
			OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].held = 0
			OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].released = 0
		endif
	endif
endfunction

function OryUIUpdateTemplateSingleItem(oryUITemplateSingleItemID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	if (GetSpriteExists(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer))
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE WIDGET
		if (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, oryUIParameters.size#[1], oryUIParameters.size#[2])
		elseif (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, oryUIParameters.size#[1], GetSpriteHeight(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer))
		elseif (oryUIParameters.size#[1] = -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, GetSpriteWidth(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer), oryUIParameters.size#[2])
		endif

		if (oryUIParameters.offsetTopLeft = 1)
			SetSpriteOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, 0, 0)
		elseif (oryUIParameters.offsetTopCenter = 1)
			SetSpriteOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, GetSpriteWidth(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer) / 2.0, 0)
		elseif (oryUIParameters.offsetTopRight = 1)
			SetSpriteOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, GetSpriteWidth(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer), 0)
		elseif (oryUIParameters.offsetCenterLeft = 1)
			SetSpriteOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, 0, GetSpriteHeight(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer) / 2.0)
		elseif (oryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, GetSpriteWidth(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer) / 2.0, GetSpriteHeight(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer) / 2.0)
		elseif (oryUIParameters.offsetCenterRight = 1)
			SetSpriteOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, GetSpriteWidth(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer), GetSpriteHeight(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer) / 2.0)
		elseif (oryUIParameters.offsetBottomLeft = 1)
			SetSpriteOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, 0, GetSpriteHeight(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer))
		elseif (oryUIParameters.offsetBottomCenter = 1)
			SetSpriteOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, GetSpriteWidth(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer) / 2.0, GetSpriteHeight(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer))
		elseif (oryUIParameters.offsetBottomRight = 1)
			SetSpriteOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, GetSpriteWidth(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer), GetSpriteHeight(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer))
		else
			if (oryUIParameters.offset#[1] > -999999 or oryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, oryUIParameters.offset#[1], oryUIParameters.offset#[2])
			endif
		endif
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, oryUIParameters.position#[1], GetSpriteYByOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer))
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, GetSpriteXByOffset(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer), oryUIParameters.position#[2])
		endif
		
		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, oryUIParameters.depth)
		endif
		if (oryUIParameters.fixToScreen = 1)
			FixSpriteToScreen(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, 1)
		endif
		if (oryUIParameters.imageID > -999999)
			SetSpriteImage(OryUITemplateSingleItemCollection[oryUITemplateSingleItemID].sprContainer, oryUIParameters.imageID)
		endif
	endif
endfunction

foldend
