
foldstart // OryUIScrollBar Component (Updated 07/07/2020)

type typeOryUIScrollBar
	id as integer
	alwaysVisible as integer
	autoResize as integer
	contentSize# as float[2]
	direction$ as string
	draggable as integer
	dragging as integer
	dragPosition# as float[2]
	dragStartPosition# as float[2]
	gripColor# as float[4]
	gripIcon$ as string
	gripIconColor# as float[4]
	gripIconID as integer
	gripIconSize# as float[2]
	gripImageID as integer
	gripPosition# as float[2]
	gripPositionRatio# as float[2]
	gripSize# as float[2]
	gripTimeLastVisible# as float
	gripVisible as integer
	invisibleGripSize# as float[2]
	justCreated as integer
	minGripSize# as float[2]
	scrollType$ as string
	showGripIcon as integer
	sprGrip as integer
	sprGripIcon as integer
	sprInvisibleGrip as integer
	//sprTrack as integer
	//trackClickable as integer
	//trackColor# as float[4]
	trackPosition# as float[2]
	trackPositionRatio# as float[2]
	trackScrollAreaSize# as float[2]
	trackSize# as float[2]
	windowContentRatio# as float[2]
	windowPosition# as float[2]
	windowPositionRatio# as float[2]
	windowScrollAreaSize# as float[2]
	windowSize# as float[2]
endtype

global OryUIScrollBarCollection as typeOryUIScrollBar[]
OryUIScrollBarCollection.length = 1

remstart
function OryUICalculateScrollBarWindowVariables(oryUIScrollBarID as integer)
	if (OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "horizontal")
		OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[1] = GetScreenBoundsRight()
		OryUIScrollBarCollection[oryUIScrollBarID].windowContentRatio#[1] = OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[1] / OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[1]
		
		OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[1] = OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[1] - OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[1]
		OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[1] = GetViewOffsetX()
		OryUIScrollBarCollection[oryUIScrollBarID].windowPositionRatio#[1] = OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[1] / OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[1]
	endif
	if (OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "vertical")
		OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[2] = GetScreenBoundsBottom()
		OryUIScrollBarCollection[oryUIScrollBarID].windowContentRatio#[2] = OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[2] / OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[2]
		
		OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[2] = OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[2] - OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[2]
		OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[2] = GetViewOffsetY()
		OryUIScrollBarCollection[oryUIScrollBarID].windowPositionRatio#[2] = OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[2] / OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[2]
	endif
endfunction
remend

function OryUICreateScrollBar(oryUIComponentParameters$ as string)
	local oryUIScrollBarID as integer
	OryUIScrollBarCollection.length = OryUIScrollBarCollection.length + 1
	oryUIScrollBarID = OryUIScrollBarCollection.length
	OryUIScrollBarCollection[oryUIScrollBarID].id = oryUIScrollBarID

	// DEFAULT SETTINGS
	OryUIScrollBarCollection[oryUIScrollBarID].alwaysVisible = 0
	OryUIScrollBarCollection[oryUIScrollBarID].autoResize = 1
	OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "vertical"
	OryUIScrollBarCollection[oryUIScrollBarID].draggable = 0
	OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[1] = oryUIDefaults.scrollBarGripColor#[1]
	OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[2] = oryUIDefaults.scrollBarGripColor#[2]
	OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[3] = oryUIDefaults.scrollBarGripColor#[3]
	OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[4] = oryUIDefaults.scrollBarGripColor#[4]
	OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[1] = oryUIDefaults.scrollBarGripIconColor#[1]
	OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[2] = oryUIDefaults.scrollBarGripIconColor#[2]
	OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[3] = oryUIDefaults.scrollBarGripIconColor#[3]
	OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[4] = oryUIDefaults.scrollBarGripIconColor#[4]
	OryUIScrollBarCollection[oryUIScrollBarID].minGripSize#[1] = 10
	OryUIScrollBarCollection[oryUIScrollBarID].minGripSize#[2] = 10
	OryUIScrollBarCollection[oryUIScrollBarID].scrollType$ = "standard"
	OryUIScrollBarCollection[oryUIScrollBarID].showGripIcon = 0
	//OryUIScrollBarCollection[oryUIScrollBarID].trackClickable = 0
	//OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[1] = oryUIDefaults.scrollBarTrackColor#[1]
	//OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[2] = oryUIDefaults.scrollBarTrackColor#[2]
	//OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[3] = oryUIDefaults.scrollBarTrackColor#[3]
	//OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[4] = oryUIDefaults.scrollBarTrackColor#[4]

	//OryUIScrollBarCollection[oryUIScrollBarID].sprTrack = CreateSprite(0)
	//SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, 1, 10)
	//SetSpriteDepth(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, 1)
	//SetSpriteColor(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[1], OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[2], OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[3], OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[4])
	//SetSpriteOffset(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, 0, 0)
	//SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, -10000, -10000)
	//SetSpritePhysicsOff(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack)
	//FixSpriteToScreen(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, 1)
	
	OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip = CreateSprite(0)
	SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, 1, 5)
	SetSpriteDepth(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, 1)
	SetSpriteColor(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, 255, 255, 0, 0)
	SetSpriteOffset(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, 0, 0)
	SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, -10000, -10000)
	SetSpritePhysicsOff(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip)
	FixSpriteToScreen(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, 1)
	
	OryUIScrollBarCollection[oryUIScrollBarID].sprGrip = CreateSprite(0)
	SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 1, 5)
	SetSpriteDepth(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 1)
	SetSpriteColor(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[1], OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[2], OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[3], OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[4])
	SetSpriteOffset(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 0, 0)
	SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, -10000, -10000)
	SetSpritePhysicsOff(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)
	FixSpriteToScreen(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 1)
	
	OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon = CreateSprite(0)
	SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, 1, 5)
	SetSpriteColor(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[1], OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[2], OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[3], OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[4])
	SetSpriteDepth(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, 1)
	SetSpriteOffset(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon) / 2, GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon) / 2)
	SetSpritePhysicsOff(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon)
	FixSpriteToScreen(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, 1)
	OryUIPinSpriteToCentreOfSprite(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 0, 0)

	OryUIScrollBarCollection[oryUIScrollBarID].justCreated = 1
	
	if (oryUIComponentParameters$ <> "")
		OryUIUpdateScrollBar(oryUIScrollBarID, oryUIComponentParameters$)
	else
		OryUIScrollBarCollection[oryUIScrollBarID].justCreated = 0
	endif
endfunction oryUIScrollBarID

function OryUIDeleteScrollBar(oryUIScrollBarID as integer)
	if (oryUIScrollBarID <= OryUIScrollBarCollection.length)
		//DeleteSprite(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack)
		DeleteSprite(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)
		DeleteSprite(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon)
		DeleteSprite(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip)
	endif
endfunction

function OryUIGetScrollBarGripHeight(oryUIScrollBarID as integer)
	local oryUIScrollBarGripHeight# as float
	if (GetSpriteExists(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip))
		oryUIScrollBarGripHeight# = GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)
	endif
endfunction oryUIScrollBarGripHeight#

function OryUIGetScrollBarGripVisible(oryUIScrollBarID as integer)
	
endfunction OryUIScrollBarCollection[oryUIScrollBarID].gripVisible

function OryUIGetScrollBarGripWidth(oryUIScrollBarID as integer)
	local oryUIScrollBarGripWidth# as float
	if (GetSpriteExists(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip))
		oryUIScrollBarGripWidth# = GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)
	endif
endfunction oryUIScrollBarGripWidth#

function OryUIGetScrollBarGripX(oryUIScrollBarID as integer)
	local oryUIScrollBarGripX# as float
	if (GetSpriteExists(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip))
		oryUIScrollBarGripX# = GetSpriteX(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)
	endif
endfunction oryUIScrollBarGripX#

function OryUIGetScrollBarGripY(oryUIScrollBarID as integer)
	local oryUIScrollBarGripY# as float
	if (GetSpriteExists(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip))
		oryUIScrollBarGripY# = GetSpriteY(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)
	endif
endfunction oryUIScrollBarGripY#

//function OryUIGetScrollBarTrackHeight(oryUIScrollBarID as integer)
//	local oryUIScrollBarTrackHeight#
//	if (GetSpriteExists(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack))
//		oryUIScrollBarTrackHeight# = GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack)
//	endif
//endfunction oryUIScrollBarTrackHeight#

function OryUIGetScrollBarTrackHeight(oryUIScrollBarID as integer)
	
endfunction OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2]

//function OryUIGetScrollBarTrackWidth(oryUIScrollBarID as integer)
//	local oryUIScrollBarTrackWidth#
//	if (GetSpriteExists(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack))
//		oryUIScrollBarTrackWidth# = GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack)
//	endif
//endfunction oryUIScrollBarTrackWidth#

function OryUIGetScrollBarTrackWidth(oryUIScrollBarID as integer)
	
endfunction OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1]

//function OryUIGetScrollBarTrackX(oryUIScrollBarID as integer)
//	local oryUIScrollBarTrackX# as float
//	if (GetSpriteExists(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack))
//		oryUIScrollBarTrackX# = GetSpriteX(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack)
//	endif
//endfunction oryUIScrollBarTrackX#

function OryUIGetScrollBarTrackX(oryUIScrollBarID as integer)
	
endfunction OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1]

//function OryUIGetScrollBarTrackY(oryUIScrollBarID as integer)
//	local oryUIScrollBarTrackY# as float
//	if (GetSpriteExists(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack))
//		oryUIScrollBarTrackY# = GetSpriteY(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack)
//	endif
//endfunction oryUIScrollBarTrackY#

function OryUIGetScrollBarTrackY(oryUIScrollBarID as integer)
	
endfunction OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2]

function OryUIHideScrollBar(oryUIScrollBarID as integer)
	//SetSpriteColorAlpha(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, 0)
	SetSpriteColorAlpha(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 0)
	SetSpriteColorAlpha(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, 0)
	SetSpriteColorAlpha(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, 0)
	//SetSpriteShapeBox(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 0, 0, 0, 0, 0, 0)
	//SetSpriteShapeBox(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, 0, 0, 0, 0, 0, 0)
	SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, -10000, -10000)
	SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, -10000, -10000)
	SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, -10000, -10000)
	OryUIScrollBarCollection[oryUIScrollBarID].gripVisible = 0
endfunction

function OryUIInsertScrollBarListener(oryUIScrollBarID as integer)
	if (oryUIScrimVisible = 1)
		OryUIHideScrollBar(oryUIScrollBarID)
		exitfunction
	endif

	local oryUIScrollBarGripSprite as integer
	local oryUIScrollBarGripIconSprite as integer
	local oryUIScrollBarInvisibleGripSprite as integer
	
	if (GetSpriteExists(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip))
		if (OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "horizontal" and OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[1] < OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[1])
			OryUIHideScrollBar(oryUIScrollBarID)
			exitfunction
		endif
		if (OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "vertical" and OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[2] < OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[2])
			OryUIHideScrollBar(oryUIScrollBarID)
			exitfunction
		endif
		if (OryUIScrollBarCollection[oryUIScrollBarID].alwaysVisible = 0)
			if ((OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "horizontal" and OryUIGetSwipingHorizontally()) or (OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "vertical" and OryUIGetSwipingVertically()))
				OryUIShowScrollBar(oryUIScrollBarID)
				OryUIScrollBarCollection[oryUIScrollBarID].gripTimeLastVisible# = timer()
			else
				if (timer() - OryUIScrollBarCollection[oryUIScrollBarID].gripTimeLastVisible# > 1)
					OryUIHideScrollBar(oryUIScrollBarID)
				endif
			endif
		else
			//SetSpriteColorAlpha(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[4])
			SetSpriteColorAlpha(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[4])
			SetSpriteColorAlpha(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[4])
			SetSpriteColorAlpha(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, 0)
			OryUIScrollBarCollection[oryUIScrollBarID].gripVisible = 1
		endif
		//if (OryUIScrollBarCollection[oryUIScrollBarID].gripVisible = 1)
			if (GetPointerPressed())
				if (OryUIScrollBarCollection[oryUIScrollBarID].draggable = 1)
					oryUIScrollBarGripSprite = GetSpriteHitTest(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIScrollBarGripIconSprite = GetSpriteHitTest(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					oryUIScrollBarInvisibleGripSprite = GetSpriteHitTest(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
					if (OryUIScrollBarCollection[oryUIScrollBarID].gripVisible = 1 and (oryUIScrollBarInvisibleGripSprite = 1 or oryUIScrollBarGripSprite = 1 or oryUIScrollBarGripIconSprite = 1))
						if (OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "horizontal") then OryUIScrollBarCollection[oryUIScrollBarID].dragStartPosition#[1] = GetPointerX() - GetSpriteX(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)
						if (OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "vertical") then OryUIScrollBarCollection[oryUIScrollBarID].dragStartPosition#[2] = GetPointerY() - GetSpriteY(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)
						OryUIScrollBarCollection[oryUIScrollBarID].dragging = 1
					else
						OryUIScrollBarCollection[oryUIScrollBarID].dragging = 0
					endif
				else
					OryUIScrollBarCollection[oryUIScrollBarID].dragging = 0
				endif
			else
				if (GetPointerState())
					if (OryUIScrollBarCollection[oryUIScrollBarID].dragging = 1)
						if (OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "horizontal")
							OryUIScrollBarCollection[oryUIScrollBarID].dragPosition#[1] = GetPointerX() - OryUIScrollBarCollection[oryUIScrollBarID].dragStartPosition#[1]
							
							if (OryUIScrollBarCollection[oryUIScrollBarID].gripVisible = 1)
								SetSpriteX(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, OryUIScrollBarCollection[oryUIScrollBarID].dragPosition#[1])
								if (GetSpriteX(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip) < OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1]) then SetSpriteX(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1])
								if (GetSpriteX(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip) > (OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1] + OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1]) - GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)) then SetSpriteX(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, (OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1] + OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1]) - GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip))
								OryUIPinSpriteToCentreOfSprite(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 0, 0)
								if (OryUIScrollBarCollection[oryUIScrollBarID].showGripIcon = 1)
									OryUIPinSpriteToCentreOfSprite(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 0, 0)
								else
									SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, -10000, -10000)
								endif
							endif
							
							OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[1] = OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1] + OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1] //GetScreenBoundsRight()
							//OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1] = OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[1] - OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1]
							OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[1] = GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)
							OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[1] = OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[1] - OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[1]
							OryUIScrollBarCollection[oryUIScrollBarID].trackScrollAreaSize#[1] = OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1] - OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[1]
								
							OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[1] = GetSpriteX(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip) - OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1]
							if (OryUIScrollBarCollection[oryUIScrollBarID].trackScrollAreaSize#[1] > 0)
								OryUIScrollBarCollection[oryUIScrollBarID].gripPositionRatio#[1] = OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[1] / OryUIScrollBarCollection[oryUIScrollBarID].trackScrollAreaSize#[1]
							else
								OryUIScrollBarCollection[oryUIScrollBarID].gripPositionRatio#[1] = 0
							endif
							OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[1] = OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[1] * OryUIScrollBarCollection[oryUIScrollBarID].gripPositionRatio#[1]
							
							// THIS IF LINE STOPS IT FROM GOING TO VIEW OFFSET X WHEN THE VALUE IS NAN
							if (OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[1] <= 0 or OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[1] >= 0)
								if (OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[1] > 0) then SetViewOffset(OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[1], GetViewOffsetY())
							endif
						endif
						if (OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "vertical")
							OryUIScrollBarCollection[oryUIScrollBarID].dragPosition#[2] = GetPointerY() - OryUIScrollBarCollection[oryUIScrollBarID].dragStartPosition#[2]
							
							if (OryUIScrollBarCollection[oryUIScrollBarID].gripVisible = 1)
								SetSpriteY(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, OryUIScrollBarCollection[oryUIScrollBarID].dragPosition#[2])
								if (GetSpriteY(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip) < OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2]) then SetSpriteY(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2])
								if (GetSpriteY(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip) > (OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2] + OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2]) - GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)) then SetSpriteY(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, (OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2] + OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2]) - GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip))
								OryUIPinSpriteToCentreOfSprite(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 0, 0)
								if (OryUIScrollBarCollection[oryUIScrollBarID].showGripIcon = 1)
									OryUIPinSpriteToCentreOfSprite(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 0, 0)
								else
									SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, -10000, -10000)
								endif
							endif
							
							OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[2] = OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2] + OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2] //GetScreenBoundsBottom()
							//OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2] = OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[2] - OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2]
							OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[2] = GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)
							OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[2] = OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[2] - OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[2]
							OryUIScrollBarCollection[oryUIScrollBarID].trackScrollAreaSize#[2] = OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2] - OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[2]
								
							OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[2] = GetSpriteY(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip) - OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2]
							if (OryUIScrollBarCollection[oryUIScrollBarID].trackScrollAreaSize#[2] > 0)
								OryUIScrollBarCollection[oryUIScrollBarID].gripPositionRatio#[2] = OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[2] / OryUIScrollBarCollection[oryUIScrollBarID].trackScrollAreaSize#[2]
							else
								OryUIScrollBarCollection[oryUIScrollBarID].gripPositionRatio#[2] = 0
							endif
							OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[2] = OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[2] * OryUIScrollBarCollection[oryUIScrollBarID].gripPositionRatio#[2]
							
							// THIS IF LINE STOPS IT FROM GOING TO VIEW OFFSET Y WHEN THE VALUE IS NAN
							if (OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[2] <= 0 or OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[2] >= 0)
								if (OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[2] > 0) then SetViewOffset(GetViewOffsetX(), OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[2])
							endif
						endif
					else
						OryUIPositionScrollBar(oryUIScrollBarID)
					endif
				endif
				if (oryUIBlockFlickScroll = 0 and OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "horizontal" and OryUIGetScrollingHorizontally())
					OryUIPositionScrollBar(oryUIScrollBarID)
				endif
				if (oryUIBlockFlickScroll = 0 and OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "vertical" and OryUIGetScrollingVertically())
					OryUIPositionScrollBar(oryUIScrollBarID)
				endif
				if (GetPointerReleased())
					//OryUIScrollBarCollection[oryUIScrollBarID].dragging = 0
				endif	
			endif
		//endif
	endif
endfunction

function OryUIPositionScrollBar(oryUIScrollBarID as integer)
	if (OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "horizontal")
		OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[1] = OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1] + OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1] //GetScreenBoundsRight()
		OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[1] = OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[1] - OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[1]
		OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[1] = GetViewOffsetX()
		OryUIScrollBarCollection[oryUIScrollBarID].windowPositionRatio#[1] = OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[1] / OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[1]
	
		OryUIScrollBarCollection[oryUIScrollBarID].trackScrollAreaSize#[1] = OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1] - GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)
		OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[1] = (OryUIScrollBarCollection[oryUIScrollBarID].trackScrollAreaSize#[1] * OryUIScrollBarCollection[oryUIScrollBarID].windowPositionRatio#[1]) + OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1]
		OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[2] = OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2] //GetSpriteY(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack)
		
		if (OryUIScrollBarCollection[oryUIScrollBarID].gripVisible = 1)					
			SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[1], OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[2])
			OryUIPinSpriteToCentreOfSprite(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 0, 0)
			if (OryUIScrollBarCollection[oryUIScrollBarID].showGripIcon = 1)
				OryUIPinSpriteToCentreOfSprite(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 0, 0)
			else
				SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, -10000, -10000)
			endif
		endif
	endif
	if (OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "vertical")
		OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[2] = OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2] + OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2] //GetScreenBoundsBottom()
		OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[2] = OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[2] - OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[2]
		OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[2] = GetViewOffsetY()
		OryUIScrollBarCollection[oryUIScrollBarID].windowPositionRatio#[2] = OryUIScrollBarCollection[oryUIScrollBarID].windowPosition#[2] / OryUIScrollBarCollection[oryUIScrollBarID].windowScrollAreaSize#[2]
	
		OryUIScrollBarCollection[oryUIScrollBarID].trackScrollAreaSize#[2] = OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2] - GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip)
		OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[1] = OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1] //GetSpriteX(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack)
		OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[2] = (OryUIScrollBarCollection[oryUIScrollBarID].trackScrollAreaSize#[2] * OryUIScrollBarCollection[oryUIScrollBarID].windowPositionRatio#[2]) + OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2]
		
		if (OryUIScrollBarCollection[oryUIScrollBarID].gripVisible = 1)					
			SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[1], OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[2])
			OryUIPinSpriteToCentreOfSprite(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 0, 0)
			if (OryUIScrollBarCollection[oryUIScrollBarID].showGripIcon = 1)
				OryUIPinSpriteToCentreOfSprite(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 0, 0)
			else
				SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, -10000, -10000)
			endif
		endif
	endif
endfunction

function OryUIResizeScrollBar(oryUIScrollBarID as integer)
	if (OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "horizontal")
		OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[1] = OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1] + OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1] //GetScreenBoundsRight()
		OryUIScrollBarCollection[oryUIScrollBarID].windowContentRatio#[1] = OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[1] / OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[1]
		
		if (OryUIScrollBarCollection[oryUIScrollBarID].autoResize = 1)
			OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[1] = (OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1] * OryUIScrollBarCollection[oryUIScrollBarID].windowContentRatio#[1]) / GetViewZoom()
			OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[2] = OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2]
			if (OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[1] < OryUIScrollBarCollection[oryUIScrollBarID].minGripSize#[1]) then OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[1] = OryUIScrollBarCollection[oryUIScrollBarID].minGripSize#[1]
			if (OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[1] > OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1]) then OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[1] = OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1]
			SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[1], OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[2])
			SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, OryUIScrollBarCollection[oryUIScrollBarID].invisibleGripSize#[1], OryUIScrollBarCollection[oryUIScrollBarID].invisibleGripSize#[2])
		endif
	endif
	if (OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "vertical")
		OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[2] = OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2] + OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2] //GetScreenBoundsBottom()
		OryUIScrollBarCollection[oryUIScrollBarID].windowContentRatio#[2] = OryUIScrollBarCollection[oryUIScrollBarID].windowSize#[2] / OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[2]
		
		if (OryUIScrollBarCollection[oryUIScrollBarID].autoResize = 1)
			OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[1] = OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1]
			OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[2] = (OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2] * OryUIScrollBarCollection[oryUIScrollBarID].windowContentRatio#[2]) / GetViewZoom()
			if (OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[2] < OryUIScrollBarCollection[oryUIScrollBarID].minGripSize#[2]) then OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[2] = OryUIScrollBarCollection[oryUIScrollBarID].minGripSize#[2]
			if (OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[2] > OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2]) then OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[2] = OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2]
			SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[1], OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[2])
			SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, OryUIScrollBarCollection[oryUIScrollBarID].invisibleGripSize#[1], OryUIScrollBarCollection[oryUIScrollBarID].invisibleGripSize#[2])
		endif
	endif
endfunction

function OryUISetScrollBarContentSize(oryUIScrollBarID as integer, oryUIScrollBarContentWidth# as float, oryUIScrollBarContentHeight# as float)
	if (oryUIScrollBarContentWidth# < 0) then oryUIScrollBarContentWidth# = 0
	if (oryUIScrollBarContentHeight# < 0) then oryUIScrollBarContentHeight# = 0
	OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[1] = oryUIScrollBarContentWidth#
	OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[2] = oryUIScrollBarContentHeight#
	OryUIResizeScrollBar(oryUIScrollBarID)
	OryUIPositionScrollBar(oryUIScrollBarID)
endfunction

function OryUIShowScrollBar(oryUIScrollBarID as integer)
	//SetSpriteColorAlpha(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[4])
	SetSpriteColorAlpha(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[4])
	SetSpriteColorAlpha(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[4])
	SetSpriteColorAlpha(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, 0)
	SetSpriteShapeBox(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, 0, 0, GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip), GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip), 0, 0)
	SetSpriteShapeBox(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, 0, 0, GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon), GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon), 0, 0)
	SetSpriteShapeBox(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, -(GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip) / 2), -(GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip) / 2), GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip) / 2, GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip), 0, 0)
	OryUIScrollBarCollection[oryUIScrollBarID].gripVisible = 1
endfunction

function OryUIUpdateScrollBar(oryUIScrollBarID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip))
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (oryUIParameters.gripSize#[1] > -999999 and oryUIParameters.gripSize#[2] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[1] = oryUIParameters.gripSize#[1]
			OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[2] = oryUIParameters.gripSize#[2]
			SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, oryUIParameters.gripSize#[1], oryUIParameters.gripSize#[2])
		elseif (oryUIParameters.gripSize#[1] > -999999 and oryUIParameters.gripSize#[2] = -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[1] = oryUIParameters.gripSize#[1]
			SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, oryUIParameters.gripSize#[1], GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip))
		elseif (oryUIParameters.gripSize#[1] = -999999 and oryUIParameters.gripSize#[2] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].gripSize#[2] = oryUIParameters.gripSize#[2]
			SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip), oryUIParameters.gripSize#[2])
		endif
		if (oryUIParameters.gripPosition#[1] > -999999 and oryUIParameters.gripPosition#[2] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[1] = oryUIParameters.gripPosition#[1]
			OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[2] = oryUIParameters.gripPosition#[2]
			SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, oryUIParameters.gripPosition#[1], oryUIParameters.gripPosition#[2])
		elseif (oryUIParameters.gripPosition#[1] > -999999 and oryUIParameters.gripPosition#[2] = -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[1] = oryUIParameters.gripPosition#[1]
			SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, oryUIParameters.gripPosition#[1], GetSpriteY(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip))
		elseif (oryUIParameters.gripPosition#[1] = -999999 and oryUIParameters.gripPosition#[2] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].gripPosition#[2] = oryUIParameters.gripPosition#[2]
			SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, GetSpriteX(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip), oryUIParameters.gripPosition#[2])
		endif
		if (oryUIParameters.gripIconSize#[1] > -999999 and oryUIParameters.gripIconSize#[2] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].gripIconSize#[1] = oryUIParameters.gripIconSize#[1]
			OryUIScrollBarCollection[oryUIScrollBarID].gripIconSize#[2] = oryUIParameters.gripIconSize#[2]
			SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, oryUIParameters.gripIconSize#[1], oryUIParameters.gripIconSize#[2])
		elseif (oryUIParameters.gripIconSize#[1] > -999999 and oryUIParameters.gripIconSize#[2] = -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].gripIconSize#[1] = oryUIParameters.gripIconSize#[1]
			SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, oryUIParameters.gripIconSize#[1], GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon))
		elseif (oryUIParameters.gripIconSize#[1] = -999999 and oryUIParameters.gripIconSize#[2] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].gripIconSize#[2] = oryUIParameters.gripIconSize#[2]
			SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon), oryUIParameters.gripIconSize#[2])
		endif
		if (oryUIParameters.invisibleGripSize#[1] > -999999 and oryUIParameters.invisibleGripSize#[2] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].invisibleGripSize#[1] = oryUIParameters.invisibleGripSize#[1]
			OryUIScrollBarCollection[oryUIScrollBarID].invisibleGripSize#[2] = oryUIParameters.invisibleGripSize#[2]
			SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, oryUIParameters.invisibleGripSize#[1], oryUIParameters.invisibleGripSize#[2])
			SetSpriteOffset(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, oryUIParameters.invisibleGripSize#[1] / 2, oryUIParameters.invisibleGripSize#[2] / 2)
		elseif (oryUIParameters.invisibleGripSize#[1] > -999999 and oryUIParameters.invisibleGripSize#[2] = -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].invisibleGripSize#[1] = oryUIParameters.invisibleGripSize#[1]
			SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, oryUIParameters.invisibleGripSize#[1], GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip))
			SetSpriteOffset(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, oryUIParameters.invisibleGripSize#[1] / 2, GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip) / 2)
		elseif (oryUIParameters.invisibleGripSize#[1] = -999999 and oryUIParameters.invisibleGripSize#[2] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].invisibleGripSize#[2] = oryUIParameters.invisibleGripSize#[2]
			SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip), oryUIParameters.invisibleGripSize#[2])
			SetSpriteOffset(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip) / 2, oryUIParameters.invisibleGripSize#[2] / 2)
		endif
		//if (oryUIParameters.trackSize#[1] > -999999 and oryUIParameters.trackSize#[2] > -999999)
		//	OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1] = oryUIParameters.trackSize#[1]
		//	OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2] = oryUIParameters.trackSize#[2]
		//	SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, oryUIParameters.trackSize#[1], oryUIParameters.trackSize#[2])
		//elseif (oryUIParameters.trackSize#[1] > -999999 and oryUIParameters.trackSize#[2] = -999999)
		//	OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1] = oryUIParameters.trackSize#[1]
		//	SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, oryUIParameters.trackSize#[1], GetSpriteHeight(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack))
		//elseif (oryUIParameters.trackSize#[1] = -999999 and oryUIParameters.trackSize#[2] > -999999)
		//	OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2] = oryUIParameters.trackSize#[2]
		//	SetSpriteSize(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, GetSpriteWidth(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack), oryUIParameters.trackSize#[2])
		//endif
		if (oryUIParameters.trackSize#[1] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[1] = oryUIParameters.trackSize#[1]
		endif
		if (oryUIParameters.trackSize#[2] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].trackSize#[2] = oryUIParameters.trackSize#[2]
		endif
		//if (oryUIParameters.trackPosition#[1] > -999999 and oryUIParameters.trackPosition#[2] > -999999)
		//	OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1] = oryUIParameters.trackPosition#[1]
		//	OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2] = oryUIParameters.trackPosition#[2]
		//	SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, oryUIParameters.trackPosition#[1], oryUIParameters.trackPosition#[2])
		//elseif (oryUIParameters.trackPosition#[1] > -999999 and oryUIParameters.trackPosition#[2] = -999999)
		//	OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1] = oryUIParameters.trackPosition#[1]
		//	SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, oryUIParameters.trackPosition#[1], GetSpriteY(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack))
		//elseif (oryUIParameters.trackPosition#[1] = -999999 and oryUIParameters.trackPosition#[2] > -999999)
		//	OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2] = oryUIParameters.trackPosition#[2]
		//	SetSpritePosition(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, GetSpriteX(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack), oryUIParameters.trackPosition#[2])
		//endif
		if (oryUIParameters.trackPosition#[1] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[1] = oryUIParameters.trackPosition#[1]
		endif
		if (oryUIParameters.trackPosition#[2] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].trackPosition#[2] = oryUIParameters.trackPosition#[2]
		endif

		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.alwaysVisible > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].alwaysVisible = oryUIParameters.alwaysVisible
		endif
		if (oryUIParameters.autoResize > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].autoResize = oryUIParameters.autoResize
		endif
		if (oryUIParameters.contentSize#[1] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[1] = oryUIParameters.contentSize#[1]
		endif
		if (oryUIParameters.contentSize#[2] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].contentSize#[2] = oryUIParameters.contentSize#[2]
		endif
		if (oryUIParameters.depth > -999999)
			//SetSpriteDepth(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, oryUIParameters.depth)
			SetSpriteDepth(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, oryUIParameters.depth)
			SetSpriteDepth(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, oryUIParameters.depth)
			SetSpriteDepth(OryUIScrollBarCollection[oryUIScrollBarID].sprInvisibleGrip, oryUIParameters.depth)
			
		endif
		if (lower(oryUIParameters.direction$) = "horizontal" or lower(oryUIParameters.direction$) = "horiz")
			OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "horizontal"
		endif
		if (lower(oryUIParameters.direction$) = "vertical" or lower(oryUIParameters.direction$) = "vert")
			OryUIScrollBarCollection[oryUIScrollBarID].direction$ = "vertical"
		endif
		if (oryUIParameters.draggable > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].draggable = oryUIParameters.draggable
		endif
		if (oryUIParameters.gripColor#[1] > -999999 or oryUIParameters.gripColor#[2] > -999999 or oryUIParameters.gripColor#[3] > -999999 or oryUIParameters.gripColor#[4] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[1] = oryUIParameters.gripColor#[1]
			OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[2] = oryUIParameters.gripColor#[2]
			OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[3] = oryUIParameters.gripColor#[3]
			OryUIScrollBarCollection[oryUIScrollBarID].gripColor#[4] = oryUIParameters.gripColor#[4]
			SetSpriteColor(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, oryUIParameters.gripColor#[1], oryUIParameters.gripColor#[2], oryUIParameters.gripColor#[3], oryUIParameters.gripColor#[4])
		endif
		if (oryUIParameters.gripIcon$ <> "" and oryUIParameters.gripIconID > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].gripIcon$ = oryUIParameters.gripIcon$
			OryUIScrollBarCollection[oryUIScrollBarID].gripIconID = oryUIParameters.gripIconID
			SetSpriteImage(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, OryUIScrollBarCollection[oryUIScrollBarID].gripIconID)
		elseif (oryUIParameters.gripIconID > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].gripIcon$ = "custom"
			OryUIScrollBarCollection[oryUIScrollBarID].gripIconID = oryUIParameters.gripIconID
			SetSpriteImage(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, OryUIScrollBarCollection[oryUIScrollBarID].gripIconID)
		endif
		if (oryUIParameters.gripIconColor#[1] > -999999 or oryUIParameters.gripIconColor#[2] > -999999 or oryUIParameters.gripIconColor#[3] > -999999 or oryUIParameters.gripIconColor#[4] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[1] = oryUIParameters.gripIconColor#[1]
			OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[2] = oryUIParameters.gripIconColor#[2]
			OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[3] = oryUIParameters.gripIconColor#[3]
			OryUIScrollBarCollection[oryUIScrollBarID].gripIconColor#[4] = oryUIParameters.gripIconColor#[4]
			SetSpriteColor(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, oryUIParameters.gripIconColor#[1], oryUIParameters.gripIconColor#[2], oryUIParameters.gripIconColor#[3], oryUIParameters.gripIconColor#[4])
		endif
		if (oryUIParameters.minGripSize#[1] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].minGripSize#[1] = oryUIParameters.minGripSize#[1]
		endif
		if (oryUIParameters.minGripSize#[2] > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].minGripSize#[2] = oryUIParameters.minGripSize#[2]
		endif
		if (lower(oryUIParameters.scrollType$) = "standard")
			OryUIScrollBarCollection[oryUIScrollBarID].scrollType$ = "standard"
		endif
		if (lower(oryUIParameters.scrollType$) = "fastscroll")
			OryUIScrollBarCollection[oryUIScrollBarID].draggable = 1
			OryUIScrollBarCollection[oryUIScrollBarID].scrollType$ = "fastscroll"
			if (GetSpriteImageID(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip) = 0)
				OryUIScrollBarCollection[oryUIScrollBarID].gripImageID = oryUIScrollFastButtonImage
				SetSpriteImage(OryUIScrollBarCollection[oryUIScrollBarID].sprGrip, OryUIScrollBarCollection[oryUIScrollBarID].gripImageID)
			endif
			if (GetSpriteImageID(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon) = 0)
				OryUIScrollBarCollection[oryUIScrollBarID].gripIcon$ = "custom"
				OryUIScrollBarCollection[oryUIScrollBarID].gripIconID = oryUIScrollFastButtonIconImage
				SetSpriteImage(OryUIScrollBarCollection[oryUIScrollBarID].sprGripIcon, OryUIScrollBarCollection[oryUIScrollBarID].gripIconID)
			endif
		endif
		if (oryUIParameters.showGripIcon > -999999)
			OryUIScrollBarCollection[oryUIScrollBarID].showGripIcon = oryUIParameters.showGripIcon
		endif
		//if (oryUIParameters.trackColor#[1] > -999999 or oryUIParameters.trackColor#[2] > -999999 or oryUIParameters.trackColor#[3] > -999999 or oryUIParameters.trackColor#[4] > -999999)
		//	OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[1] = oryUIParameters.trackColor#[1]
		//	OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[2] = oryUIParameters.trackColor#[2]
		//	OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[3] = oryUIParameters.trackColor#[3]
		//	OryUIScrollBarCollection[oryUIScrollBarID].trackColor#[4] = oryUIParameters.trackColor#[4]
		//	SetSpriteColor(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, oryUIParameters.trackColor#[1], oryUIParameters.trackColor#[2], oryUIParameters.trackColor#[3], oryUIParameters.trackColor#[4])
		//endif
		
		//if (OryUIScrollBarCollection[oryUIScrollBarID].trackClickable = 0)
			//SetSpriteShape(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, 0)
		//else
		//	SetSpriteShape(OryUIScrollBarCollection[oryUIScrollBarID].sprTrack, 2)
		//endif
		
		if (OryUIScrollBarCollection[oryUIScrollBarID].justCreated = 0)
			OryUIResizeScrollBar(oryUIScrollBarID)
			OryUIPositionScrollBar(oryUIScrollBarID)
		endif
		OryUIScrollBarCollection[oryUIScrollBarID].justCreated = 0
	endif
endfunction

foldend
