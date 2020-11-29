
foldstart // OryUIList Component (Updated 07/07/2020)

type typeOryUIList
	id as integer
	itemID as integer[]
	btnRight as integer[]
	itemNoOfLeftLines as integer[]
	itemNoOfRightLines as integer[]
	itemRightButtonReleased as integer
	itemRightIconReleased as integer
	itemSize# as float[2]
	noOfLeftLines as integer
	noOfRightLines as integer
	rightIconPressed as integer[]
	rightIconType$ as string[]
	showItemDivider as integer
	showLeftThumbnail as integer
	showRightButton as integer
	showRightIcon as integer
	sprContainer as integer
	sprItemContainer as integer[]
	sprItemDivider as integer[]
	sprItemLeftThumbnail as integer[]
	sprItemRightIcon as integer[]
	txtItemLeftLine1 as integer[]
	txtItemLeftLine2 as integer[]
	txtItemRightLine1 as integer[]
	txtItemRightLine2 as integer[]
	wrapList as integer
	wrapListBottomY# as float
	wrapListTopY# as float
endtype

global OryUIListCollection as typeOryUIList[]
OryUIListCollection.length = 1

function OryUICreateList(oryUIComponentParameters$ as string)
	local oryUIListID as integer
	OryUIListCollection.length = OryUIListCollection.length + 1
	oryUIListID = OryUIListCollection.length
	OryUIListCollection[oryUIListID].id = oryUIListID

	// DEFAULT SETTINGS
	OryUIListCollection[oryUIListID].itemSize#[1] = 100
	OryUIListCollection[oryUIListID].itemSize#[2] = 7
	OryUIListCollection[oryUIListID].noOfLeftLines = 1
	OryUIListCollection[oryUIListID].noOfRightLines = 0
	OryUIListCollection[oryUIListID].showItemDivider = 1
	OryUIListCollection[oryUIListID].showLeftThumbnail = 0
	OryUIListCollection[oryUIListID].showRightButton = 0
	OryUIListCollection[oryUIListID].showRightIcon = 0
	OryUIListCollection[oryUIListID].wrapList = 0
	OryUIListCollection[oryUIListID].wrapListBottomY# = 0
	OryUIListCollection[oryUIListID].wrapListTopY# = 0

	OryUIListCollection[oryUIListID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIListCollection[oryUIListID].sprContainer, OryUIListCollection[oryUIListID].itemSize#[1], 0)
	SetSpriteColor(OryUIListCollection[oryUIListID].sprContainer, 204, 204, 204, 255)
	SetSpriteOffset(OryUIListCollection[oryUIListID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIListCollection[oryUIListID].sprContainer, 0, 0)
	SetSpritePhysicsOff(OryUIListCollection[oryUIListID].sprContainer)

	if (oryUIComponentParameters$ <> "") then OryUIUpdateList(oryUIListID, oryUIComponentParameters$)
endfunction oryUIListID

function OryUIDeleteList(oryUIListID as integer)
	DeleteSprite(OryUIListCollection[oryUIListID].sprContainer)
	while (OryUIListCollection[oryUIListID].itemID.length > 0)
		OryUIDeleteListItem(oryUIListID, 0)
	endwhile
endfunction

function OryUIDeleteListItem(oryUIListID as integer, oryUIListItemID as integer)
	OryUIDeleteButton(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID])
	DeleteSprite(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID])
	DeleteSprite(OryUIListCollection[oryUIListID].sprItemDivider[oryUIListItemID])
	DeleteSprite(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID])
	DeleteSprite(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID])
	DeleteText(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID])
	DeleteText(OryUIListCollection[oryUIListID].txtItemLeftLine2[oryUIListItemID])
	DeleteText(OryUIListCollection[oryUIListID].txtItemRightLine1[oryUIListItemID])
	DeleteText(OryUIListCollection[oryUIListID].txtItemRightLine2[oryUIListItemID])
	OryUIListCollection[oryUIListID].btnRight.remove(oryUIListItemID)
	OryUIListCollection[oryUIListID].itemID.remove(oryUIListItemID)
	OryUIListCollection[oryUIListID].rightIconType$.remove(oryUIListItemID)
	OryUIListCollection[oryUIListID].sprItemContainer.remove(oryUIListItemID)
	OryUIListCollection[oryUIListID].sprItemDivider.remove(oryUIListItemID)
	OryUIListCollection[oryUIListID].sprItemLeftThumbnail.remove(oryUIListItemID)
	OryUIListCollection[oryUIListID].sprItemRightIcon.remove(oryUIListItemID)
	OryUIListCollection[oryUIListID].txtItemLeftLine1.remove(oryUIListItemID)
	OryUIListCollection[oryUIListID].txtItemLeftLine2.remove(oryUIListItemID)
	OryUIListCollection[oryUIListID].txtItemRightLine1.remove(oryUIListItemID)
	OryUIListCollection[oryUIListID].txtItemRightLine2.remove(oryUIListItemID)
endfunction

function OryUIGetListHeight(oryUIListID as integer)
	local oryUIForI as integer
	local oryUIListEndY# as float
	local oryUIListHeight# as float
	local oryUIListStartY# as float
	oryUIListStartY# = GetSpriteY(OryUIListCollection[oryUIListID].sprContainer)
	for oryUIForI = OryUIGetListItemCount(oryUIListID) - 1 to 0 step -1
		if (GetSpriteExists(OryUIListCollection[oryUIListID].sprItemContainer[oryUIForI]))
			oryUIListEndY# = GetSpriteY(OryUIListCollection[oryUIListID].sprItemContainer[oryUIForI]) + GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemContainer[oryUIForI])
			exit
		endif
	next
	oryUIListHeight# = oryUIListEndY# - oryUIListStartY#
	if (oryUIListHeight# < 0) then oryUIListHeight# = 0
endfunction oryUIListHeight#

function OryUIGetListItemCount(oryUIListID as integer)
	local oryUIListItemCount as integer
	oryUIListItemCount = OryUIListCollection[oryUIListID].itemID.length + 1
endfunction oryUIListItemCount

function OryUIGetListItemRightButtonReleased(oryUIListID as integer)

endfunction OryUIListCollection[oryUIListID].itemRightButtonReleased

function OryUIGetListItemRightIconReleased(oryUIListID as integer)
	
endfunction OryUIListCollection[oryUIListID].itemRightIconReleased

function OryUIGetListItemRightIconReleasedType(oryUIListID as integer)
	local oryUIListItemRightIconType$ as string
	if (OryUIListCollection[oryUIListID].itemRightIconReleased > -1)
		oryUIListItemRightIconType$ = OryUIListCollection[oryUIListID].rightIconType$[OryUIListCollection[oryUIListID].itemRightIconReleased]
	endif
endfunction oryUIListItemRightIconType$

function OryUIGetListX(oryUIListID as integer)
	local oryUIListX# as float
	oryUIListX# = GetSpriteX(OryUIListCollection[oryUIListID].sprContainer)
endfunction oryUIListX#

function OryUIGetListY(oryUIListID as integer)
	local oryUIListY# as float
	oryUIListY# = GetSpriteY(OryUIListCollection[oryUIListID].sprContainer)
endfunction oryUIListY#

function OryUIInsertListItem(oryUIListID as integer, oryUIListIndex as integer, oryUIComponentParameters$ as string)
	local oryUIListItemID as integer
	
	if (oryUIListIndex = -1)
		OryUIListCollection[oryUIListID].btnRight.length = OryUIListCollection[oryUIListID].btnRight.length + 1
		OryUIListCollection[oryUIListID].itemID.length = OryUIListCollection[oryUIListID].itemID.length + 1
		OryUIListCollection[oryUIListID].itemNoOfLeftLines.length = OryUIListCollection[oryUIListID].itemNoOfLeftLines.length + 1
		OryUIListCollection[oryUIListID].itemNoOfRightLines.length = OryUIListCollection[oryUIListID].itemNoOfRightLines.length + 1
		OryUIListCollection[oryUIListID].rightIconPressed.length = OryUIListCollection[oryUIListID].rightIconPressed.length + 1
		OryUIListCollection[oryUIListID].rightIconType$.length = OryUIListCollection[oryUIListID].rightIconType$.length + 1
		OryUIListCollection[oryUIListID].sprItemContainer.length = OryUIListCollection[oryUIListID].sprItemContainer.length + 1
		OryUIListCollection[oryUIListID].sprItemDivider.length = OryUIListCollection[oryUIListID].sprItemDivider.length + 1
		OryUIListCollection[oryUIListID].sprItemLeftThumbnail.length = OryUIListCollection[oryUIListID].sprItemLeftThumbnail.length + 1
		OryUIListCollection[oryUIListID].sprItemRightIcon.length = OryUIListCollection[oryUIListID].sprItemRightIcon.length + 1
		OryUIListCollection[oryUIListID].txtItemLeftLine1.length = OryUIListCollection[oryUIListID].txtItemLeftLine1.length + 1
		OryUIListCollection[oryUIListID].txtItemLeftLine2.length = OryUIListCollection[oryUIListID].txtItemLeftLine2.length + 1
		OryUIListCollection[oryUIListID].txtItemRightLine1.length = OryUIListCollection[oryUIListID].txtItemRightLine1.length + 1
		OryUIListCollection[oryUIListID].txtItemRightLine2.length = OryUIListCollection[oryUIListID].txtItemRightLine2.length + 1
		oryUIListItemID = OryUIListCollection[oryUIListID].sprItemContainer.length
		OryUIListCollection[oryUIListID].itemID[oryUIListItemID] = oryUIListItemID
	endif

	// DEFAULT SETTINGS
	OryUIListCollection[oryUIListID].rightIconType$[oryUIListItemID] = "Delete"
	OryUIListCollection[oryUIListID].itemNoOfLeftLines[oryUIListItemID] = OryUIListCollection[oryUIListID].noOfLeftLines
	OryUIListCollection[oryUIListID].itemNoOfRightLines[oryUIListItemID] = OryUIListCollection[oryUIListID].noOfRightLines
	
	OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID] = CreateSprite(0)
	SetSpriteSize(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID], OryUIListCollection[oryUIListID].itemSize#[1], OryUIListCollection[oryUIListID].itemSize#[2])
	SetSpriteDepth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID], GetSpriteDepth(OryUIListCollection[oryUIListID].sprContainer) - 1)
	SetSpriteColor(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID], 255, 255, 255, 255)
	SetSpriteOffset(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID], 0, 0)
	SetSpritePositionByOffset(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID], GetSpriteXByOffset(OryUIListCollection[oryUIListID].sprContainer), GetSpriteYByOffset(OryUIListCollection[oryUIListID].sprContainer) + 0.1 + (oryUIListItemID * OryUIListCollection[oryUIListID].itemSize#[2]))
	SetSpritePhysicsOff(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID])
	
	OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID] = CreateText("Left Line 1")
	SetTextSize(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID], 3)
	SetTextColor(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID], 0, 0, 0, 255)
	SetTextAlignment(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID], 0)
	SetTextDepth(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID], GetSpriteDepth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) - 1)

	OryUIListCollection[oryUIListID].txtItemLeftLine2[oryUIListItemID] = CreateText("Left Line 2")
	SetTextSize(OryUIListCollection[oryUIListID].txtItemLeftLine2[oryUIListItemID], 2.6)
	SetTextColor(OryUIListCollection[oryUIListID].txtItemLeftLine2[oryUIListItemID], 0, 0, 0, 255)
	SetTextAlignment(OryUIListCollection[oryUIListID].txtItemLeftLine2[oryUIListItemID], 0)
	SetTextDepth(OryUIListCollection[oryUIListID].txtItemLeftLine2[oryUIListItemID], GetSpriteDepth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) - 1)

	OryUIListCollection[oryUIListID].txtItemRightLine1[oryUIListItemID] = CreateText("Right Line 1")
	SetTextSize(OryUIListCollection[oryUIListID].txtItemRightLine1[oryUIListItemID], 3)
	SetTextColor(OryUIListCollection[oryUIListID].txtItemRightLine1[oryUIListItemID], 0, 0, 0, 255)
	SetTextAlignment(OryUIListCollection[oryUIListID].txtItemRightLine1[oryUIListItemID], 2)
	SetTextDepth(OryUIListCollection[oryUIListID].txtItemRightLine1[oryUIListItemID], GetSpriteDepth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) - 1)

	OryUIListCollection[oryUIListID].txtItemRightLine2[oryUIListItemID] = CreateText("Right Line 2")
	SetTextSize(OryUIListCollection[oryUIListID].txtItemRightLine2[oryUIListItemID], 2.6)
	SetTextColor(OryUIListCollection[oryUIListID].txtItemRightLine2[oryUIListItemID], 0, 0, 0, 255)
	SetTextAlignment(OryUIListCollection[oryUIListID].txtItemRightLine2[oryUIListItemID], 2)
	SetTextDepth(OryUIListCollection[oryUIListID].txtItemRightLine2[oryUIListItemID], GetSpriteDepth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) - 1)

	OryUIListCollection[oryUIListID].sprItemDivider[oryUIListItemID] = CreateSprite(0)
	SetSpriteSize(OryUIListCollection[oryUIListID].sprItemDivider[oryUIListItemID], 100, 0.1)
	SetSpriteDepth(OryUIListCollection[oryUIListID].sprItemDivider[oryUIListItemID], GetSpriteDepth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) - 1)
	SetSpriteColor(OryUIListCollection[oryUIListID].sprItemDivider[oryUIListItemID], 204, 204, 204, 255)
	SetSpriteOffset(OryUIListCollection[oryUIListID].sprItemDivider[oryUIListItemID], 0, 0.05)
	SetSpritePhysicsOff(OryUIListCollection[oryUIListID].sprItemDivider[oryUIListItemID])

	OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID] = CreateSprite(0)
	SetSpriteSize(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], -1, 4)
	SetSpriteDepth(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], GetSpriteDepth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) - 1)
	SetSpriteColor(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], 255, 255, 255, 255)
	SetSpriteOffset(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID]) / 2, GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID]) / 2)
	SetSpritePhysicsOff(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID])
	
	OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID] = CreateSprite(0)
	SetSpriteSize(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], -1, 3)
	SetSpriteImage(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], oryUIIconDeleteImage)
	SetSpriteDepth(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], GetSpriteDepth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) - 1)
	SetSpriteColor(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], 0, 0, 0, 255)
	SetSpriteOffset(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID]) / 2, GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID]) / 2)
	SetSpritePhysicsOff(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID])
	
	OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID] = CreateSprite(0)
	SetSpriteSize(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], -1, 3)
	SetSpriteImage(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], oryUIIconDeleteImage)
	SetSpriteDepth(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], GetSpriteDepth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) - 1)
	SetSpriteColor(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], 0, 0, 0, 255)
	SetSpriteOffset(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID]) / 2, GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID]) / 2)
	SetSpritePhysicsOff(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID])
	
	OryUIListCollection[oryUIListID].btnRight[oryUIListItemID] = OryUICreateButton("text:Button;size:10,3;depth:" + str(GetSpriteDepth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) - 1))

	OryUIUpdateListItem(oryUIListID, oryUIListItemID, oryUIComponentParameters$)
endfunction

function OryUIInsertListListener(oryUIListID as integer)
	if (oryUIScrimVisible = 1) then exitfunction

	local oryUIForI as integer
	local oryUIListItemRightIconReleased as integer
	local oryUIListItemRightIconSprite as integer

	OryUIListCollection[oryUIListID].itemRightButtonReleased = -1
	OryUIListCollection[oryUIListID].itemRightIconReleased = -1
	
	for oryUIForI = 0 to OryUIGetListItemCount(oryUIListID)
		if (oryUIForI <= OryUIListCollection[oryUIListID].itemID.length)
			if (GetSpriteExists(OryUIListCollection[oryUIListID].sprItemContainer[oryUIForI]))
				if (GetSpriteY(OryUIListCollection[oryUIListID].sprItemContainer[oryUIForI]) >= GetViewOffsetY() and GetSpriteY(OryUIListCollection[oryUIListID].sprItemContainer[oryUIForI]) <= GetViewOffsetY() + GetScreenBoundsBottom())
					OryUIUpdateListItem(oryUIListID, oryUIForI, "")
					if (OryUIGetSwipingVertically() = 0)
						if (OryUIListCollection[oryUIListID].showRightButton = 1 and OryUIGetButtonReleased(OryUIListCollection[oryUIListID].btnRight[oryUIForI]))
							OryUIListCollection[oryUIListID].itemRightButtonReleased = oryUIForI
						else
							if (GetPointerPressed())
								oryUIListItemRightIconSprite = GetSpriteHitTest(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIForI], ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
								if (oryUIListItemRightIconSprite = 1)
									OryUIListCollection[oryUIListID].rightIconPressed[oryUIForI] = 1
								endif
							else
								if (GetPointerState())
									oryUIListItemRightIconSprite = GetSpriteHitTest(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIForI], ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
									if (OryUIListCollection[oryUIListID].rightIconPressed[oryUIForI])
										if (oryUIListItemRightIconSprite = 0)
											OryUIListCollection[oryUIListID].rightIconPressed[oryUIForI] = 0
										endif
									endif
								endif
								if (GetPointerReleased())
									oryUIListItemRightIconSprite = GetSpriteHitTest(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIForI], ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
									if (OryUIListCollection[oryUIListID].rightIconPressed[oryUIForI])
										if (oryUIListItemRightIconSprite = 1)
											OryUIListCollection[oryUIListID].itemRightIconReleased = oryUIForI
										endif
									endif
									OryUIListCollection[oryUIListID].rightIconPressed[oryUIForI] = 0
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	next
endfunction

function OryUISetListItemCount(oryUIListID as integer, oryUINewListItemCount as integer)
	local oryUIForI as integer
	local oryUIOldListItemCount as integer
	
	if (oryUINewListItemCount > 0)
		oryUIOldListItemCount = OryUIGetListItemCount(oryUIListID) - 1
		while (OryUIGetListItemCount(oryUIListID) - 1 > oryUINewListItemCount - 1)
			OryUIDeleteListItem(oryUIListID, OryUIGetListItemCount(oryUIListID) - 1)
		endwhile
		for oryUIForI = 0 to oryUINewListItemCount - 1
			if (oryUIForI > oryUIOldListItemCount)
				OryUIInsertListItem(oryUIListID, -1, "")
			endif
		next
	else
		for oryUIForI = OryUIGetListItemCount(oryUIListID) - 1 to 0 step - 1
			OryUIDeleteListItem(oryUIListID, oryUIForI)
		next
	endif
endfunction

function OryUIUpdateList(oryUIListID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIListCollection[oryUIListID].sprContainer))
		
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (oryUIParameters.size#[1] > -999999)
			SetSpriteSize(OryUIListCollection[oryUIListID].sprContainer, oryUIParameters.size#[1], 0)
		endif
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIListCollection[oryUIListID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUIListCollection[oryUIListID].sprContainer, oryUIParameters.position#[1], GetSpriteYByOffset(OryUIListCollection[oryUIListID].sprContainer))
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIListCollection[oryUIListID].sprContainer, GetSpriteXByOffset(OryUIListCollection[oryUIListID].sprContainer), oryUIParameters.position#[2])
		endif

		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIListCollection[oryUIListID].sprContainer, oryUIParameters.depth)
		endif
		if (oryUIParameters.itemSize#[1] > -999999 and oryUIParameters.itemSize#[2] > -999999)
			OryUIListCollection[oryUIListID].itemSize#[1] = oryUIParameters.itemSize#[1]
			OryUIListCollection[oryUIListID].itemSize#[2] = oryUIParameters.itemSize#[2]
		endif
		if (oryUIParameters.noOfLeftLines > -999999)
			OryUIListCollection[oryUIListID].noOfLeftLines = oryUIParameters.noOfLeftLines
		endif
		if (oryUIParameters.noOfRightLines > -999999)
			OryUIListCollection[oryUIListID].noOfRightLines = oryUIParameters.noOfRightLines
		endif
		if (oryUIParameters.showItemDivider > -999999)
			OryUIListCollection[oryUIListID].showItemDivider = oryUIParameters.showItemDivider
		endif
		if (oryUIParameters.showLeftThumbnail > -999999)
			OryUIListCollection[oryUIListID].showLeftThumbnail = oryUIParameters.showLeftThumbnail
		endif
		if (oryUIParameters.showRightButton > -999999)
			OryUIListCollection[oryUIListID].showRightButton = oryUIParameters.showRightButton
		endif
		if (oryUIParameters.showRightIcon > -999999)
			OryUIListCollection[oryUIListID].showRightIcon = oryUIParameters.showRightIcon
		endif
		if (oryUIParameters.wrapList > -999999)
			OryUIListCollection[oryUIListID].wrapList = oryUIParameters.wrapList
		endif
		if (oryUIParameters.wrapListBottomY# > -999999)
			OryUIListCollection[oryUIListID].wrapListBottomY# = oryUIParameters.wrapListBottomY#
		endif
		if (oryUIParameters.wrapListTopY# > -999999)
			OryUIListCollection[oryUIListID].wrapListTopY# = oryUIParameters.wrapListTopY#
		endif
	endif
endfunction

function OryUIUpdateListItem(oryUIListID as integer, oryUIListItemID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (oryUIListItemID <= OryUIListCollection[oryUIListID].itemID.length)
		if (GetSpriteExists(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]))
			// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
			SetSpritePositionByOffset(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID], GetSpriteXByOffset(OryUIListCollection[oryUIListID].sprContainer), GetSpriteYByOffset(OryUIListCollection[oryUIListID].sprContainer) + 0.1 + (oryUIListItemID * OryUIListCollection[oryUIListID].itemSize#[2]))
		
			if (OryUIListCollection[oryUIListID].showItemDivider = 1)
				SetSpriteColor(OryUIListCollection[oryUIListID].sprItemDivider[oryUIListItemID], 0, 0, 0, 50)
			else
				SetSpriteColor(OryUIListCollection[oryUIListID].sprItemDivider[oryUIListItemID], 0, 0, 0, 0)
			endif
			if (OryUIListCollection[oryUIListID].showLeftThumbnail = 1)
				if (oryUIParameters.leftThumbnailImageID > 0)
					SetSpriteImage(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], oryUIParameters.leftThumbnailImageID)
				endif
				if (GetSpriteImageID(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID]) > 0)
					//SetSpriteImage(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], oryUIParameters.leftThumbnailImageID)
					SetSpriteColor(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], 255, 255, 255, 255)
					//SetSpriteSize(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], -1, 4)
				else
					//SetSpriteImage(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], 0)
					SetSpriteColor(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], 204, 204, 204, 255)
					//SetSpriteSize(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], -1, 4)
				endif
				SetSpriteSize(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], -1, 4)
				OryUIPinSpriteToCentreLeftOfSprite(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID], 2 + (GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID]) / 2), 0)
			elseif (OryUIListCollection[oryUIListID].showLeftThumbnail = 0)
				SetSpriteSize(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID], 0, 0)
			endif
			if (OryUIListCollection[oryUIListID].showRightIcon = 1)
				if (oryUIParameters.rightIcon$ <> "") then OryUIListCollection[oryUIListID].rightIconType$[oryUIListItemID] = oryUIParameters.rightIcon$
				if (oryUIParameters.rightIconID > -999999)
					OryUIListCollection[oryUIListID].rightIconType$[oryUIListItemID] = "custom"
					SetSpriteImage(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], oryUIParameters.rightIconID)
				endif
				OryUIPinSpriteToCentreRightOfSprite(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID], -(2 + (GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID]) / 2)), 0)
			elseif (OryUIListCollection[oryUIListID].showRightIcon = 0)
				SetSpriteSize(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], 0, 0)
			endif
			if (oryUIParameters.leftLine1Text$ <> "")
				if (lower(oryUIParameters.leftLine1Text$) = "null") then oryUIParameters.leftLine1Text$ = ""
				SetTextString(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID], oryUIParameters.leftLine1Text$)
			endif
			if (oryUIParameters.leftLine1TextBold > -999999)
				SetTextBold(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID], oryUIParameters.leftLine1TextBold)
			endif
			if (oryUIParameters.leftLine1TextSize# > -999999)
				SetTextSize(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID], oryUIParameters.leftLine1TextSize#)
			endif
			if (oryUIParameters.leftLine2Text$ <> "")
				if (lower(oryUIParameters.leftLine2Text$) = "null") then oryUIParameters.leftLine2Text$ = ""
				SetTextString(OryUIListCollection[oryUIListID].txtItemLeftLine2[oryUIListItemID], oryUIParameters.leftLine2Text$)
			endif
			if (oryUIParameters.leftLine2TextBold > -999999)
				SetTextBold(OryUIListCollection[oryUIListID].txtItemLeftLine2[oryUIListItemID], oryUIParameters.leftLine2TextBold)
			endif
			if (oryUIParameters.leftLine2TextSize# > -999999)
				SetTextSize(OryUIListCollection[oryUIListID].txtItemLeftLine2[oryUIListItemID], oryUIParameters.leftLine2TextSize#)
			endif
			if (oryUIParameters.rightLine1Text$ <> "")
				if (lower(oryUIParameters.rightLine1Text$) = "null") then oryUIParameters.rightLine1Text$ = ""
				SetTextString(OryUIListCollection[oryUIListID].txtItemRightLine1[oryUIListItemID], oryUIParameters.rightLine1Text$)
			endif
			if (oryUIParameters.rightLine1TextBold > -999999)
				SetTextBold(OryUIListCollection[oryUIListID].txtItemRightLine1[oryUIListItemID], oryUIParameters.rightLine1TextBold)
			endif
			if (oryUIParameters.rightLine1TextSize# > -999999)
				SetTextSize(OryUIListCollection[oryUIListID].txtItemRightLine1[oryUIListItemID], oryUIParameters.rightLine1TextSize#)
			endif
			if (oryUIParameters.rightLine2Text$ <> "")
				if (lower(oryUIParameters.rightLine2Text$) = "null") then oryUIParameters.rightLine2Text$ = ""
				SetTextString(OryUIListCollection[oryUIListID].txtItemRightLine2[oryUIListItemID], oryUIParameters.rightLine2Text$)
			endif
			if (oryUIParameters.rightLine2TextBold > -999999)
				SetTextBold(OryUIListCollection[oryUIListID].txtItemRightLine2[oryUIListItemID], oryUIParameters.rightLine2TextBold)
			endif
			if (oryUIParameters.rightLine2TextSize# > -999999)
				SetTextSize(OryUIListCollection[oryUIListID].txtItemRightLine2[oryUIListItemID], oryUIParameters.rightLine2TextSize#)
			endif
			if (oryUIParameters.noOfLeftLines > -999999)
				OryUIListCollection[oryUIListID].itemNoOfLeftLines[oryUIListItemID] = oryUIParameters.noOfLeftLines
			endif
			if (OryUIListCollection[oryUIListID].itemNoOfLeftLines[oryUIListItemID] = 0)
				SetTextPosition(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID], -10000, -10000)
				SetTextPosition(OryUIListCollection[oryUIListID].txtItemLeftLine2[oryUIListItemID], -10000, -10000)
			elseif (OryUIListCollection[oryUIListID].itemNoOfLeftLines[oryUIListItemID] = 1)
				SetTextPosition(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID], GetSpriteX(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + 4 + GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID]), (GetSpriteY(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + (GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) / 2.0)) - (GetTextTotalHeight(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID]) / 2.0))
				SetTextPosition(OryUIListCollection[oryUIListID].txtItemLeftLine2[oryUIListItemID], -10000, -10000)
			else
				SetTextPosition(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID], GetSpriteX(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + 4 + GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID]), (GetSpriteY(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + (GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) / 2.0)) - GetTextTotalHeight(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID]) - 0.1)
				SetTextPosition(OryUIListCollection[oryUIListID].txtItemLeftLine2[oryUIListItemID], GetSpriteX(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + 4 + GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemLeftThumbnail[oryUIListItemID]), GetSpriteY(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + (GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) / 2.0) + 0.1)
			endif
			if (oryUIParameters.noOfRightLines > -999999)
				OryUIListCollection[oryUIListID].itemNoOfRightLines[oryUIListItemID] = oryUIParameters.noOfRightLines
			endif
			if (OryUIListCollection[oryUIListID].itemNoOfRightLines[oryUIListItemID] = 0)
				SetTextPosition(OryUIListCollection[oryUIListID].txtItemRightLine1[oryUIListItemID], -10000, -10000)
				SetTextPosition(OryUIListCollection[oryUIListID].txtItemRightLine2[oryUIListItemID], -10000, -10000)
			elseif (OryUIListCollection[oryUIListID].itemNoOfRightLines[oryUIListItemID] = 1)
				SetTextPosition(OryUIListCollection[oryUIListID].txtItemRightLine1[oryUIListItemID], (GetSpriteX(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID])) - 2, (GetSpriteY(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + (GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) / 2.0)) - (GetTextTotalHeight(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID]) / 2.0))
				SetTextPosition(OryUIListCollection[oryUIListID].txtItemRightLine2[oryUIListItemID], -10000, -10000)
			else
				SetTextPosition(OryUIListCollection[oryUIListID].txtItemRightLine1[oryUIListItemID], (GetSpriteX(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID])) - 2, (GetSpriteY(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + (GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) / 2.0)) - GetTextTotalHeight(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID]) - 0.1)
				SetTextPosition(OryUIListCollection[oryUIListID].txtItemRightLine2[oryUIListItemID], (GetSpriteX(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID])) - 2, GetSpriteY(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + (GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) / 2.0) + 0.1)
			endif
			// THE REST OF THE PARAMETERS NEXT
			if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
				SetSpriteColor(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID], oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
			endif
			if (oryUIParameters.leftLine1TextColor#[1] > -999999 or oryUIParameters.leftLine1TextColor#[2] > -999999 or oryUIParameters.leftLine1TextColor#[3] > -999999 or oryUIParameters.leftLine1TextColor#[4] > -999999)
				SetTextColor(OryUIListCollection[oryUIListID].txtItemLeftLine1[oryUIListItemID], oryUIParameters.leftLine1TextColor#[1], oryUIParameters.leftLine1TextColor#[2], oryUIParameters.leftLine1TextColor#[3], oryUIParameters.leftLine1TextColor#[4])
			endif
			if (oryUIParameters.leftLine2TextColor#[1] > -999999 or oryUIParameters.leftLine2TextColor#[2] > -999999 or oryUIParameters.leftLine2TextColor#[3] > -999999 or oryUIParameters.leftLine2TextColor#[4] > -999999)
				SetTextColor(OryUIListCollection[oryUIListID].txtItemLeftLine2[oryUIListItemID], oryUIParameters.leftLine2TextColor#[1], oryUIParameters.leftLine2TextColor#[2], oryUIParameters.leftLine2TextColor#[3], oryUIParameters.leftLine2TextColor#[4])
			endif
			if (oryUIParameters.rightIconColor#[1] > -999999 or oryUIParameters.rightIconColor#[2] > -999999 or oryUIParameters.rightIconColor#[3] > -999999 or oryUIParameters.rightIconColor#[4] > -999999)
				SetSpriteColor(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID], oryUIParameters.rightIconColor#[1], oryUIParameters.rightIconColor#[2], oryUIParameters.rightIconColor#[3], oryUIParameters.rightIconColor#[4])
			endif
			if (oryUIParameters.rightLine1TextColor#[1] > -999999 or oryUIParameters.rightLine1TextColor#[2] > -999999 or oryUIParameters.rightLine1TextColor#[3] > -999999 or oryUIParameters.rightLine1TextColor#[4] > -999999)
				SetTextColor(OryUIListCollection[oryUIListID].txtItemRightLine1[oryUIListItemID], oryUIParameters.rightLine1TextColor#[1], oryUIParameters.rightLine1TextColor#[2], oryUIParameters.rightLine1TextColor#[3], oryUIParameters.rightLine1TextColor#[4])
			endif
			if (oryUIParameters.rightLine2TextColor#[1] > -999999 or oryUIParameters.rightLine2TextColor#[2] > -999999 or oryUIParameters.rightLine2TextColor#[3] > -999999 or oryUIParameters.rightLine2TextColor#[4] > -999999)
				SetTextColor(OryUIListCollection[oryUIListID].txtItemRightLine2[oryUIListItemID], oryUIParameters.rightLine2TextColor#[1], oryUIParameters.rightLine2TextColor#[2], oryUIParameters.rightLine2TextColor#[3], oryUIParameters.rightLine2TextColor#[4])
			endif
			SetSpriteSize(OryUIListCollection[oryUIListID].sprItemDivider[oryUIListItemID], GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]), 0.05)
			SetSpritePositionByOffset(OryUIListCollection[oryUIListID].sprItemDivider[oryUIListItemID], GetSpriteXByOffset(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]), GetSpriteYByOffset(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]))
		
			if (OryUIListCollection[oryUIListID].showRightButton = 1)
				if (OryUIListCollection[oryUIListID].showRightIcon = 0)
					OryUIUpdateButton(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID], "offset:" + str(OryUIGetButtonWidth(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID])) + "," + str(OryUIGetButtonHeight(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID]) / 2) + ";position:" + str(GetSpriteX(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) - 4) + "," + str(GetSpriteY(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + (GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) / 2)))
				else
					OryUIUpdateButton(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID], "offset:" + str(OryUIGetButtonWidth(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID])) + "," + str(OryUIGetButtonHeight(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID]) / 2) + ";position:" + str(GetSpriteX(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) - 4 - GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID]) - 2) + "," + str(GetSpriteY(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + (GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) / 2)))
				endif	
			elseif (OryUIListCollection[oryUIListID].showRightButton = 0)
				OryUIUpdateButton(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID], "position:-10000,-10000")
			endif
			
		endif
	endif
endfunction

function OryUIUpdateListItemRightButton(oryUIListID as integer, oryUIListItemID as integer, oryUIComponentParameters$ as string)
	if (oryUIListItemID <= OryUIListCollection[oryUIListID].itemID.length)
		if (GetSpriteExists(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]))
			OryUIUpdateButton(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID], oryUIComponentParameters$)
			if (OryUIListCollection[oryUIListID].showRightButton = 1)
				if (OryUIListCollection[oryUIListID].showRightIcon = 0)
					OryUIUpdateButton(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID], "offset:" + str(OryUIGetButtonWidth(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID])) + "," + str(OryUIGetButtonHeight(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID]) / 2) + ";position:" + str(GetSpriteX(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) - 4) + "," + str(GetSpriteY(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + (GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) / 2)))
				else
					OryUIUpdateButton(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID], "offset:" + str(OryUIGetButtonWidth(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID])) + "," + str(OryUIGetButtonHeight(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID]) / 2) + ";position:" + str(GetSpriteX(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) - 4 - GetSpriteWidth(OryUIListCollection[oryUIListID].sprItemRightIcon[oryUIListItemID]) - 2) + "," + str(GetSpriteY(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) + (GetSpriteHeight(OryUIListCollection[oryUIListID].sprItemContainer[oryUIListItemID]) / 2)))
				endif	
			elseif (OryUIListCollection[oryUIListID].showRightButton = 0)
				OryUIUpdateButton(OryUIListCollection[oryUIListID].btnRight[oryUIListItemID], "position:-10000,-10000")
			endif
		endif
	endif
endfunction

foldend
