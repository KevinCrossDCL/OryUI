// This is a template file to use for future components

foldstart // OryUITemplate Component (Updated 07/07/2020)

type typeOryUITemplate
	id as integer
	itemColor# as float[4]
	itemPressed as integer
	itemReleased as integer
	items as typeOryUITemplateItems[]
	itemSize# as float[2]
	selected as integer
	selectedChange as integer
	sprContainer as integer
	visible as integer
endtype

type typeOryUITemplateItems
	id as integer
	itemReleased as integer
	name$ as string
	pressed as integer
	released as integer
	selected as integer
	sprContainer as integer
endtype

global OryUITemplateCollection as typeOryUITemplate[]
OryUITemplateCollection.length = 1

function OryUICreateTemplate(oryUIComponentParameters$ as string)
	local oryUITemplateID as integer
	OryUITemplateCollection.length = OryUITemplateCollection.length + 1
	oryUITemplateID = OryUITemplateCollection.length
	OryUITemplateCollection[oryUITemplateID].id = oryUITemplateID

	oryUICreatedComponents.insert(OryUIAddCreatedComponent(oryUITemplateID, "Template"))

	// DEFAULT SETTINGS
	OryUITemplateCollection[oryUITemplateID].itemColor#[1] = oryUIDefaults.templateItemColor#[1]
	OryUITemplateCollection[oryUITemplateID].itemColor#[2] = oryUIDefaults.templateItemColor#[2]
	OryUITemplateCollection[oryUITemplateID].itemColor#[3] = oryUIDefaults.templateItemColor#[3]
	OryUITemplateCollection[oryUITemplateID].itemColor#[4] = oryUIDefaults.templateItemColor#[4]
	OryUITemplateCollection[oryUITemplateID].itemPressed = -1
	OryUITemplateCollection[oryUITemplateID].itemReleased = -1
	OryUITemplateCollection[oryUITemplateID].itemSize#[1] = oryUIDefaults.templateItemWidth#
	OryUITemplateCollection[oryUITemplateID].itemSize#[2] = oryUIDefaults.templateItemHeight#
	OryUITemplateCollection[oryUITemplateID].visible = 1

	OryUITemplateCollection[oryUITemplateID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUITemplateCollection[oryUITemplateID].sprContainer, oryUIDefaults.templateWidth#, oryUIDefaults.templateHeight#)
	SetSpriteDepth(OryUITemplateCollection[oryUITemplateID].sprContainer, oryUIDefaults.templateDepth)
	SetSpriteColor(OryUITemplateCollection[oryUITemplateID].sprContainer, oryUIDefaults.templateColor#[1], oryUIDefaults.templateColor#[2], oryUIDefaults.templateColor#[3], oryUIDefaults.templateColor#[4])
	SetSpriteOffset(OryUITemplateCollection[oryUITemplateID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUITemplateCollection[oryUITemplateID].sprContainer, 0, 0)
	SetSpritePhysicsOff(OryUITemplateCollection[oryUITemplateID].sprContainer)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateTemplate(oryUITemplateID, oryUIComponentParameters$)
endfunction oryUITemplateID

function OryUIDeleteTemplate(oryUITemplateID as integer)
	if (oryUITemplateID <= OryUITemplateCollection.length)
		DeleteSprite(OryUITemplateCollection[oryUITemplateID].sprContainer)
	endif
	while (OryUITemplateCollection[oryUITemplateID].items.length >= 0)
		OryUIDeleteTemplateItem(oryUITemplateID, 0)
	endwhile
endfunction

function OryUIDeleteTemplateItem(oryUITemplateID as integer, oryUITemplateItemID as integer)
	DeleteSprite(OryUITemplateCollection[oryUITemplateID].items[oryUITemplateItemID].sprContainer)
	OryUITemplateCollection[oryUITemplateID].items.remove(oryUITemplateItemID)
endfunction

function OryUIGetTemplateHeight(oryUITemplateID as integer)
	local oryUITemplateHeight# as float

	oryUITemplateHeight# = 0
	for oryUIForI = 0 to OryUIGetTemplateItemCount(oryUITemplateID) - 1
		if (GetSpriteExists(OryUITemplateCollection[oryUITemplateID].items[oryUIForI].sprContainer))
			oryUITemplateHeight# = oryUITemplateHeight# + GetSpriteHeight(OryUITemplateCollection[oryUITemplateID].items[oryUIForI].sprContainer)
		endif
	next
endfunction oryUITemplateHeight#

function OryUIGetTemplateItemCount(oryUITemplateID as integer)
	local oryUITemplateItemCount as integer
	
	oryUITemplateItemCount = OryUITemplateCollection[oryUITemplateID].items.length + 1
endfunction oryUITemplateItemCount

function OryUIGetTemplateItemReleasedByIndex(oryUITemplateID as integer, oryUITemplateItemIndex as integer)
	local oryUITemplateItemReleased as integer
	oryUITemplateItemReleased = 0
	if (OryUITemplateCollection[oryUITemplateID].itemReleased = oryUITemplateItemIndex) then oryUITemplateItemReleased = 1
endfunction oryUITemplateItemReleased

function OryUIGetTemplateItemReleasedByName(oryUITemplateID as integer, oryUITemplateItemName$ as string)
	local oryUITemplateItemReleased as integer
	oryUITemplateItemReleased = 0
	if (OryUITemplateCollection[oryUITemplateID].itemReleased > 0)
		if (lower(OryUITemplateCollection[oryUITemplateID].items[OryUITemplateCollection[oryUITemplateID].itemReleased - 1].name$) = lower(oryUITemplateItemName$)) then oryUITemplateItemReleased = 1
	endif
endfunction oryUITemplateItemReleased

function OryUIGetTemplateItemReleasedIndex(oryUITemplateID as integer)
	local oryUITemplateItemReleasedIndex as integer
	oryUITemplateItemReleasedIndex = OryUITemplateCollection[oryUITemplateID].itemReleased
endfunction oryUITemplateItemReleasedIndex

function OryUIGetTemplateItemReleasedName(oryUITemplateID as integer)
	local oryUITemplateItemReleasedName$ as string
	if (OryUITemplateCollection[oryUITemplateID].itemReleased > 0)
		oryUITemplateItemReleasedName$ = OryUITemplateCollection[oryUITemplateID].items[OryUITemplateCollection[oryUITemplateID].itemReleased - 1].name$
	endif
endfunction oryUITemplateItemReleasedName$

function OryUIGetTemplateVisible(oryUITemplateID as integer)

endfunction OryUITemplateCollection[oryUITemplateID].visible

function OryUIGetTemplateX(oryUITemplateID as integer)
	local oryUITemplateX# as float
	if (OryUITemplateCollection[oryUITemplateID].visible = 1)
		oryUITemplateX# = GetSpriteX(OryUITemplateCollection[oryUITemplateID].sprContainer)
	endif
endfunction oryUITemplateX#

function OryUIGetTemplateY(oryUITemplateID as integer)
	local oryUITemplateY# as float
	if (OryUITemplateCollection[oryUITemplateID].visible = 1)
		oryUITemplateY# = GetSpriteY(OryUITemplateCollection[oryUITemplateID].sprContainer)
	endif
endfunction oryUITemplateY#

function OryUIHideTemplate(oryUITemplateID as integer)
	//oryUIBlockScreenScrolling = 0
	OryUITemplateCollection[oryUITemplateID].visible = 0
	SetSpritePositionByOffset(OryUITemplateCollection[oryUITemplateID].sprContainer, -999999, -999999)
	for oryUIForI = 0 to OryUIGetTemplateItemCount(oryUITemplateID) - 1
		if (GetSpriteExists(OryUITemplateCollection[oryUITemplateID].items[oryUIForI].sprContainer))
			SetSpritePositionByOffset(OryUITemplateCollection[oryUITemplateID].items[oryUIForI].sprContainer, -999999, -999999)
		endif
	next
endfunction

function OryUIInsertTemplateItem(oryUITemplateID as integer, oryUITemplateIndex as integer, oryUIComponentParameters$ as string)
	local oryUITemplateItemID as integer
	if (oryUITemplateIndex = -1)
		OryUITemplateCollection[oryUITemplateID].items.length = OryUITemplateCollection[oryUITemplateID].items.length + 1
		oryUITemplateItemID = OryUITemplateCollection[oryUITemplateID].items.length
		OryUITemplateCollection[oryUITemplateID].items[oryUITemplateItemID].id = oryUITemplateItemID + 1
	endif

	OryUITemplateCollection[oryUITemplateID].items[oryUITemplateItemID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUITemplateCollection[oryUITemplateID].items[oryUITemplateItemID].sprContainer, OryUITemplateCollection[oryUITemplateID].itemSize#[1], OryUITemplateCollection[oryUITemplateID].itemSize#[1])
	SetSpriteDepth(OryUITemplateCollection[oryUITemplateID].items[oryUITemplateItemID].sprContainer, GetSpriteDepth(OryUITemplateCollection[oryUITemplateID].sprContainer) - 1)
	SetSpriteColor(OryUITemplateCollection[oryUITemplateID].items[oryUITemplateItemID].sprContainer, OryUITemplateCollection[oryUITemplateID].itemColor#[1], OryUITemplateCollection[oryUITemplateID].itemColor#[2], OryUITemplateCollection[oryUITemplateID].itemColor#[3], OryUITemplateCollection[oryUITemplateID].itemColor#[4])
	SetSpriteOffset(OryUITemplateCollection[oryUITemplateID].items[oryUITemplateItemID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUITemplateCollection[oryUITemplateID].items[oryUITemplateItemID].sprContainer, -999999, -999999)
	SetSpritePhysicsOff(OryUITemplateCollection[oryUITemplateID].items[oryUITemplateItemID].sprContainer)

	OryUIUpdateTemplateItem(oryUITemplateID, oryUITemplateItemID + 1, oryUIComponentParameters$)
endfunction

function OryUIInsertTemplateListener(oryUITemplateID as integer)
	//if (oryUIScrimVisible = 1)
	//	if (OryUITemplateCollection[oryUITemplateID].visible = 1)
	//		OryUIHideTemplate(oryUITemplateID)
	//	endif
	//	exitfunction
	//endif

	local oryUITemplateContainerSprite as integer
	local oryUITemplateItemSprite as integer

	OryUITemplateCollection[oryUITemplateID].itemPressed = -1
	OryUITemplateCollection[oryUITemplateID].itemReleased = -1
	if (OryUITemplateCollection[oryUITemplateID].visible = 1)
		for oryUIForI = 0 to OryUIGetTemplateItemCount(oryUITemplateID) - 1
			if (GetSpriteExists(OryUITemplateCollection[oryUITemplateID].items[oryUIForI].sprContainer))
				if (OryUIGetSwipingVertically() = 0 and OryUIGetSwipingHorizontally() = 0 )
					if (GetPointerPressed())
						oryUITemplateItemSprite = GetSpriteHitTest(OryUITemplateCollection[oryUITemplateID].items[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (oryUITemplateItemSprite = 1)
							OryUITemplateCollection[oryUITemplateID].itemPressed = oryUIForI + 1
							OryUITemplateCollection[oryUITemplateID].items[oryUIForI].pressed = 1
						endif
					else
						if (GetPointerState())
							oryUITemplateItemSprite = GetSpriteHitTest(OryUITemplateCollection[oryUITemplateID].items[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUITemplateCollection[oryUITemplateID].items[oryUIForI].pressed)
								if (oryUITemplateItemSprite = 0)
									OryUITemplateCollection[oryUITemplateID].itemPressed = -1
									OryUITemplateCollection[oryUITemplateID].items[oryUIForI].pressed = 0
								endif
							endif
						endif
						if (GetPointerReleased())
							oryUITemplateItemSprite = GetSpriteHitTest(OryUITemplateCollection[oryUITemplateID].items[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUITemplateCollection[oryUITemplateID].items[oryUIForI].pressed)
								if (oryUITemplateItemSprite = 1)
									OryUITemplateCollection[oryUITemplateID].itemReleased = oryUIForI + 1
									OryUITemplateCollection[oryUITemplateID].items[oryUIForI].released = 1
								endif
								//OryUIHideTemplate(oryUITemplateID)
							endif
							OryUITemplateCollection[oryUITemplateID].itemPressed = -1
							OryUITemplateCollection[oryUITemplateID].items[oryUIForI].pressed = 0
						endif
					endif
				else
					OryUITemplateCollection[oryUITemplateID].itemPressed = -1
					OryUITemplateCollection[oryUITemplateID].itemReleased = -1
					OryUITemplateCollection[oryUITemplateID].items[oryUIForI].pressed = 0
					OryUITemplateCollection[oryUITemplateID].items[oryUIForI].released = 0
				endif
			endif
		next
	endif
endfunction

function OryUISetTemplateItemCount(oryUITemplateID as integer, oryUINewTemplateItemCount as integer)
	local oryUIOldTemplateItemCount
	oryUIOldTemplateItemCount = OryUIGetTemplateItemCount(oryUITemplateID) - 1
	while (OryUIGetTemplateItemCount(oryUITemplateID) - 1 > oryUINewTemplateItemCount - 1)
		OryUIDeleteTemplateItem(oryUITemplateID, OryUIGetTemplateItemCount(oryUITemplateID) - 1)
	endwhile
	for oryUIForI = 0 to oryUINewTemplateItemCount - 1
		if (oryUIForI > oryUIOldTemplateItemCount)
			OryUIInsertTemplateItem(oryUITemplateID, -1, "")
		endif
	next
endfunction

function OryUISetTemplateItemSelectedByIndex(oryUITemplateID as integer, oryUIItemID as integer)
	OryUITemplateCollection[oryUITemplateID].selected = oryUIItemID
	OryUITemplateCollection[oryUITemplateID].selectedChange = 1
endfunction

function OryUISetTemplateItemSelectedByName(oryUITemplateID as integer, oryUIItemName$ as string)
	for oryUIForI = 0 to OryUIGetTemplateItemCount(oryUITemplateID) - 1
		if (lower(OryUITemplateCollection[oryUITemplateID].items[oryUIForI].name$) = lower(oryUIItemName$))
			OryUITemplateCollection[oryUITemplateID].selected = oryUIForI + 1
			OryUITemplateCollection[oryUITemplateID].selectedChange = 1
		endif
	next
endfunction

//function OryUIShowTemplate(oryUITemplateID as integer, oryUITemplateX#, oryUITemplateY#)
function OryUIShowTemplate(oryUITemplateID as integer)
	//oryUIBlockScreenScrolling = 1
	OryUITemplateCollection[oryUITemplateID].visible = 1

	oryUITemplateHeight# = OryUIGetTemplateHeight(oryUITemplateID)
	SetSpriteSize(OryUITemplateCollection[oryUITemplateID].sprContainer, GetSpriteWidth(OryUITemplateCollection[oryUITemplateID].sprContainer), oryUITemplateHeight#)

	//if (oryUITemplateX# + GetSpriteWidth(OryUITemplateCollection[oryUITemplateID].sprContainer) + (2.46 / GetDisplayAspect()) > GetViewOffsetX() + 100)
	//	oryUITemplateX# = GetViewOffsetX() + 100 - (2.46 / GetDisplayAspect()) - GetSpriteWidth(OryUITemplateCollection[oryUITemplateID].sprContainer)
	//endif
	//if (oryUITemplateY# + GetSpriteHeight(OryUITemplateCollection[oryUITemplateID].sprContainer) + OryUITemplateCollection[oryUITemplateID].itemSize#[2] > GetViewOffsetY() + GetScreenBoundsTop() + 100)
	//	oryUITemplateY# = GetViewOffsetY() + GetScreenBoundsTop() + 100 - OryUITemplateCollection[oryUITemplateID].itemSize#[2] - GetSpriteHeight(OryUITemplateCollection[oryUITemplateID].sprContainer)
	//endif
	//SetSpritePositionByOffset(OryUITemplateCollection[oryUITemplateID].sprContainer, oryUITemplateX#, oryUITemplateY#)
	
	for oryUIForI = 0 to OryUIGetTemplateItemCount(oryUITemplateID) - 1
		if (GetSpriteExists(OryUITemplateCollection[oryUITemplateID].items[oryUIForI].sprContainer))
			//SetSpritePositionByOffset(OryUITemplateCollection[oryUITemplateID].items[oryUIForI].sprContainer, oryUITemplateX#, oryUITemplateY# + (oryUIForI * OryUITemplateCollection[oryUITemplateID].itemSize#[2]))
		endif
	next
endfunction

function OryUIUpdateTemplate(oryUITemplateID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUITemplateCollection[oryUITemplateID].sprContainer))
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUITemplateCollection[oryUITemplateID].sprContainer, oryUIParameters.size#[1], oryUIParameters.size#[2])
		elseif (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUITemplateCollection[oryUITemplateID].sprContainer, oryUIParameters.size#[1], GetSpriteHeight(OryUITemplateCollection[oryUITemplateID].sprContainer))
		elseif (oryUIParameters.size#[1] = -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUITemplateCollection[oryUITemplateID].sprContainer, GetSpriteWidth(OryUITemplateCollection[oryUITemplateID].sprContainer), oryUIParameters.size#[2])
		endif
		if (oryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUITemplateCollection[oryUITemplateID].sprContainer, GetSpriteWidth(OryUITemplateCollection[oryUITemplateID].sprContainer) / 2, GetSpriteHeight(OryUITemplateCollection[oryUITemplateID].sprContainer) / 2)
		else
			if (oryUIParameters.offset#[1] > -999999 or oryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(OryUITemplateCollection[oryUITemplateID].sprContainer, oryUIParameters.offset#[1], oryUIParameters.offset#[2])
			endif
		endif
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITemplateCollection[oryUITemplateID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUITemplateCollection[oryUITemplateID].sprContainer, oryUIParameters.position#[1], GetSpriteYByOffset(OryUITemplateCollection[oryUITemplateID].sprContainer))
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITemplateCollection[oryUITemplateID].sprContainer, GetSpriteXByOffset(OryUITemplateCollection[oryUITemplateID].sprContainer), oryUIParameters.position#[2])
		endif
		
		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUITemplateCollection[oryUITemplateID].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUITemplateCollection[oryUITemplateID].sprContainer, oryUIParameters.depth)
		endif
		if (oryUIParameters.fixToScreen = 1)
			FixSpriteToScreen(OryUITemplateCollection[oryUITemplateID].sprContainer, 1)
		endif
		if (oryUIParameters.imageID > -999999)
			SetSpriteImage(OryUITemplateCollection[oryUITemplateID].sprContainer, oryUIParameters.imageID)
		endif
	endif
endfunction

function OryUIUpdateTemplateItem(oryUITemplateID as integer, oryUITemplateItemID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUITemplateCollection[oryUITemplateID].items[oryUITemplateItemID - 1].sprContainer))
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUITemplateCollection[oryUITemplateID].items[oryUITemplateItemID - 1].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
		endif
		if (oryUIParameters.name$ <> "")
			if (lower(oryUIParameters.name$) = "null") then oryUIParameters.name$ = ""
			OryUITemplateCollection[oryUITemplateID].items[oryUITemplateItemID - 1].name$ = oryUIParameters.name$
		endif
	endif
endfunction

foldend
