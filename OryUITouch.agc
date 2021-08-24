
foldstart // OryUITouch

SetRawTouchMoveSensitivity(1)
SetViewZoomMode(1)

type typeOryUIVec2
	x	as float
	y	as float
endtype

type typeOryUIInertia
	amount as typeOryUIVec2
	average as typeOryUIVec2[]
	friction# as float
endtype

type typeOryUITouch
	currentDistance# as float
	currentDistanceX# as float
	currentDistanceY# as float
	currentMovedX# as float
	currentMovedY# as float
	currentSpriteHit as integer
	currentViewX# as float
	currentViewY# as float
	currentZoom# as float
	currentX# as float
	currentY# as float
	distanceMovedX# as float
	distanceMovedY# as float
	firstSpriteHit as integer
	inertia as typeOryUIInertia
	maxViewX# as float
	maxViewY# as float
	maxViewZoom# as float
	minViewX# as float
	minViewY# as float
	minViewZoom# as float
	panHorizontallyAllowed as integer
	panVerticallyAllowed as integer
	pinchToZoomAllowed as integer
	previousTouchCount as integer
	scrollingHorizontally as integer
	scrollingVertically as integer
	spritePressed as integer
	spriteReleased as integer
	spriteToPan as integer
	spriteToScale as integer
	startDistance# as float
	startDistanceX# as float
	startDistanceY# as float
	startMovedX# as float
	startMovedY# as float
	startViewX# as float
	startViewY# as float
	startZoom# as float
	startX# as float
	startY# as float
	swipingDown as integer
	swipingDistanceX# as float
	swipingDistanceY# as float
	swipingLeft as integer
	swipingHorizontally as integer
	swipingRight as integer
	swipingUp as integer
	swipingVertically as integer
	touchCount as integer
	touchTime# as float
	viewX# as float
	viewY# as float
	viewZoom# as float
endtype

#constant ORYUI_SCROLL_INITIALIZE 	1
#constant ORYUI_SCROLL_STEP			2
#constant ORYUI_SCROLL_INERTIA		3
#constant ORYUI_SCROLL_DAMP			0.1
#constant ORYUI_SCROLL_SAMPLES		4

global OryUITouchCollection as typeOryUITouch[10]
global oryUITouchCount as integer
OryUISetScreenZoomLimits(1, 1)
OryUISetScreenScrollLimits(0, 0, 0, 0)

function OryUIDisableFlickScroll()
	oryUIBlockFlickScroll = 1
endfunction

function OryUIDisableScreenScrolling()
	oryUIBlockScreenScrolling = 1
endfunction

function OryUIEnableFlickScroll()
	oryUIBlockFlickScroll = 0
endfunction

function OryUIEnableScreenScrolling()
	oryUIBlockScreenScrolling = 0
endfunction

function OryUIEndTrackingTouch()
	if (GetMultiTouchExists() = 1)
		if (GetRawTouchCount(1) = 0)
			OryUITouchCollection[1].currentSpriteHit = 0
			OryUITouchCollection[1].firstSpriteHit = 0
			OryUITouchCollection[0].previousTouchCount = 0
			OryUITouchCollection[0].scrollingHorizontally = 0
			OryUITouchCollection[0].scrollingVertically = 0
			OryUITouchCollection[1].spritePressed = 0
			OryUITouchCollection[1].spriteReleased = 0
			OryUITouchCollection[0].swipingDistanceX# = 0
			OryUITouchCollection[0].swipingDistanceY# = 0
			OryUITouchCollection[0].swipingDown = 0
			OryUITouchCollection[0].swipingHorizontally = 0
			OryUITouchCollection[0].swipingLeft = 0
			OryUITouchCollection[0].swipingRight = 0
			OryUITouchCollection[0].swipingUp = 0			
			OryUITouchCollection[0].swipingVertically = 0
			OryUITouchCollection[0].touchCount = 0
		endif
	else
		if (GetPointerReleased())
			OryUITouchCollection[1].currentSpriteHit = 0
			OryUITouchCollection[1].firstSpriteHit = 0
			OryUITouchCollection[0].scrollingHorizontally = 0
			OryUITouchCollection[0].scrollingVertically = 0
			OryUITouchCollection[1].spritePressed = 0
			OryUITouchCollection[1].spriteReleased = 0
			OryUITouchCollection[0].swipingDistanceX# = 0
			OryUITouchCollection[0].swipingDistanceY# = 0
			OryUITouchCollection[0].swipingDown = 0
			OryUITouchCollection[0].swipingHorizontally = 0
			OryUITouchCollection[0].swipingLeft = 0
			OryUITouchCollection[0].swipingRight = 0
			OryUITouchCollection[0].swipingUp = 0			
			OryUITouchCollection[0].swipingVertically = 0
			OryUITouchCollection[0].touchCount = 0
		endif
	endif
endfunction

function OryUIGetScrollingHorizontally()

endfunction OryUITouchCollection[0].scrollingHorizontally

function OryUIGetScrollingVertically()

endfunction OryUITouchCollection[0].scrollingVertically

function OryUIGetSpritePressed()
	
endfunction OryUITouchCollection[1].firstSpriteHit

function OryUIGetSpriteReleased()
	local oryUISpriteReleased as integer : oryUISpriteReleased = 0
	if (OryUITouchCollection[1].firstSpriteHit = OryUITouchCollection[1].currentSpriteHit)
		if (GetMultiTouchExists() = 1)
			if (GetRawTouchCount(1) = 0)
				oryUISpriteReleased = OryUITouchCollection[1].currentSpriteHit
			endif
		else
			if (GetPointerReleased())
				oryUISpriteReleased = OryUITouchCollection[1].currentSpriteHit
			endif
		endif
	endif
endfunction oryUISpriteReleased

function OryUIGetSpriteTouching()

endfunction OryUITouchCollection[1].currentSpriteHit

function OryUIGetSwipingDistanceX()
	
endfunction OryUITouchCollection[0].swipingDistanceX#

function OryUIGetSwipingDistanceY()
	
endfunction OryUITouchCollection[0].swipingDistanceY#

function OryUIGetSwipingDown()

endfunction OryUITouchCollection[0].swipingDown

function OryUIGetSwipingHorizontally()

endfunction OryUITouchCollection[0].swipingHorizontally

function OryUIGetSwipingLeft()

endfunction OryUITouchCollection[0].swipingLeft

function OryUIGetSwipingRight()

endfunction OryUITouchCollection[0].swipingRight

function OryUIGetSwipingUp()

endfunction OryUITouchCollection[0].swipingUp

function OryUIGetSwipingVertically()

endfunction OryUITouchCollection[0].swipingVertically

function OryUIGetTouchCurrentX()
	
endfunction OryUITouchCollection[OryUITouchCollection[0].touchCount].currentX#

function OryUIGetTouchCurrentY()
	
endfunction OryUITouchCollection[OryUITouchCollection[0].touchCount].currentY#

function OryUIGetTouchStartX()

endfunction OryUITouchCollection[OryUITouchCollection[0].touchCount].startX#

function OryUIGetTouchStartY()

endfunction OryUITouchCollection[OryUITouchCollection[0].touchCount].startY#

function OryUISetScreenScrollLimits(oryUIMinX# as float, oryUIMaxX# as float, oryUIMinY# as float, oryUIMaxY# as float)
	if (oryUIMaxX# < oryUIMinX#) then oryUIMaxX# = oryUIMinX#
	if (oryUIMaxY# < oryUIMinY#) then oryUIMaxY# = oryUIMinY#
	OryUITouchCollection[0].minViewX# = oryUIMinX#
	OryUITouchCollection[0].maxViewX# = oryUIMaxX#
	OryUITouchCollection[0].minViewY# = oryUIMinY#
	OryUITouchCollection[0].maxViewY# = oryUIMaxY#
endfunction

function OryUISetScreenZoomLimits(oryUIMinZoom# as float, oryUIMaxZoom# as float)
	OryUITouchCollection[0].minViewZoom# = oryUIMinZoom#
	OryUITouchCollection[0].maxViewZoom# = oryUIMaxZoom#
endfunction

function OryUISetSpriteToPan(oryUISpriteToPan as integer)
	OryUITouchCollection[0].spriteToPan = oryUISpriteToPan
endfunction

// The OryUISetViewOffset inertia code in the below function was written by @BlinkOk
function OryUISetViewOffset(oryUIMode as integer)
	local oryUIForI as integer
	select oryUIMode
		case ORYUI_SCROLL_INITIALIZE
			SetViewOffset(OryUITouchCollection[0].viewX#, OryUITouchCollection[0].viewY#)	
			OryUITouchCollection[0].inertia.amount.x = 0
			OryUITouchCollection[0].inertia.amount.y = 0
		endcase
		case ORYUI_SCROLL_STEP
			OryUITouchCollection[0].inertia.amount.x = OryUITouchCollection[0].viewX# - GetViewOffsetX()
			OryUITouchCollection[0].inertia.amount.y = OryUITouchCollection[0].viewY# - GetViewOffsetY()				
			SetViewOffset(OryUITouchCollection[0].viewX#, OryUITouchCollection[0].viewY#)	
			if (GetDeviceBaseName() = "mac")
				OryUITouchCollection[0].startViewX# = OryUITouchCollection[0].viewX#
				OryUITouchCollection[0].startViewY# = OryUITouchCollection[0].viewY#
			endif
			OryUITouchCollection[0].inertia.average.insert(OryUITouchCollection[0].inertia.amount)
			if (OryUITouchCollection[0].inertia.average.length > ORYUI_SCROLL_SAMPLES)
				OryUITouchCollection[0].inertia.average.remove(0)
			endif
		endcase
		case ORYUI_SCROLL_INERTIA
			if (oryUIBlockFlickScroll = 0 and abs(OryUITouchCollection[0].inertia.amount.x) + abs(OryUITouchCollection[0].inertia.amount.y) > 0)
				if (abs(OryUITouchCollection[0].inertia.amount.x) > 0)
					OryUITouchCollection[0].scrollingHorizontally = 1
				else
					OryUITouchCollection[0].scrollingHorizontally = 0
				endif
				if (abs(OryUITouchCollection[0].inertia.amount.y) > 0)
					OryUITouchCollection[0].scrollingVertically = 1
				else
					OryUITouchCollection[0].scrollingVertically = 0
				endif
				if (abs(OryUITouchCollection[0].inertia.amount.x) > 0) then OryUITouchCollection[0].scrollingHorizontally = 1
				if (OryUITouchCollection[0].inertia.average.length > -1)
					OryUITouchCollection[0].inertia.amount.x = 0
					OryUITouchCollection[0].inertia.amount.y = 0					
					for oryUIForI = 0 to OryUITouchCollection[0].inertia.average.length 
						OryUITouchCollection[0].inertia.amount.x = OryUITouchCollection[0].inertia.amount.x + OryUITouchCollection[0].inertia.average[oryUIForI].x												
						OryUITouchCollection[0].inertia.amount.y = OryUITouchCollection[0].inertia.amount.y + OryUITouchCollection[0].inertia.average[oryUIForI].y
					next
					OryUITouchCollection[0].inertia.amount.x = OryUITouchCollection[0].inertia.amount.x / (OryUITouchCollection[0].inertia.average.length + 1)
					OryUITouchCollection[0].inertia.amount.y = OryUITouchCollection[0].inertia.amount.y / (OryUITouchCollection[0].inertia.average.length + 1)					
					OryUITouchCollection[0].inertia.average.length = -1
					OryUITouchCollection[0].inertia.friction# = OryUILerp(0.8, 0.95, OryUIMinFloat(ScreenFPS(), oryUIMaxSyncRate#) / oryUIMaxSyncRate#)
				endif
				
				OryUITouchCollection[0].viewX# = OryUITouchCollection[0].viewX# + OryUITouchCollection[0].inertia.amount.x
				OryUITouchCollection[0].viewY# = OryUITouchCollection[0].viewY# + OryUITouchCollection[0].inertia.amount.y				

			    if (OryUITouchCollection[0].viewX# < OryUITouchCollection[0].minViewX#)
			    	OryUITouchCollection[0].viewX# = OryUITouchCollection[0].minViewX#
			    	OryUITouchCollection[0].inertia.amount.x = 0
			    endif
			    if (OryUITouchCollection[0].viewX# > OryUITouchCollection[0].maxViewX#)
			    	OryUITouchCollection[0].viewX# = OryUITouchCollection[0].maxViewX#
			    	OryUITouchCollection[0].inertia.amount.x = 0
			    endif
			    if (OryUITouchCollection[0].viewY# < OryUITouchCollection[0].minViewY#)
			    	OryUITouchCollection[0].viewY# = OryUITouchCollection[0].minViewY#
			    	OryUITouchCollection[0].inertia.amount.y = 0
			    endif
			    if (OryUITouchCollection[0].viewY# > OryUITouchCollection[0].maxViewY#)
			    	OryUITouchCollection[0].viewY# = OryUITouchCollection[0].maxViewY#
			    	OryUITouchCollection[0].inertia.amount.y = 0
			    endif			    
			    
				SetViewOffset(OryUITouchCollection[0].viewX#, OryUITouchCollection[0].viewY#)
				
				OryUITouchCollection[0].inertia.amount.x = OryUITouchCollection[0].inertia.amount.x * OryUITouchCollection[0].inertia.friction#
				OryUITouchCollection[0].inertia.amount.y = OryUITouchCollection[0].inertia.amount.y * OryUITouchCollection[0].inertia.friction#
				
				if (abs(OryUITouchCollection[0].inertia.amount.x) < ORYUI_SCROLL_DAMP)
					OryUITouchCollection[0].inertia.amount.x = 0
				endif
				if (abs(OryUITouchCollection[0].inertia.amount.y) < ORYUI_SCROLL_DAMP)
					OryUITouchCollection[0].inertia.amount.y = 0
				endif
			endif
		endcase
	endselect
endfunction

// The GetRawTouch code in the below function is based on @baxslash's PinchZoom function he shared on the AGK forum
// https://forum.thegamecreators.com/thread/205033
function OryUIStartTrackingTouch()
	local oryUITouchEvent as integer
	
	OryUITouchCollection[0].previousTouchCount = OryUITouchCollection[0].touchCount
	OryUITouchCollection[0].touchCount = 0
		
	if (GetMultiTouchExists() = 1)
		oryUITouchEvent = GetRawFirstTouchEvent(1)
		while (oryUITouchEvent > 0)
			inc OryUITouchCollection[0].touchCount
			OryUITouchCollection[OryUITouchCollection[0].touchCount].startX# = GetRawTouchStartX(oryUITouchEvent)
			OryUITouchCollection[OryUITouchCollection[0].touchCount].startY# = GetRawTouchStartY(oryUITouchEvent)
			OryUITouchCollection[OryUITouchCollection[0].touchCount].currentX# = GetRawTouchCurrentX(oryUITouchEvent)
			OryUITouchCollection[OryUITouchCollection[0].touchCount].currentY# = GetRawTouchCurrentY(oryUITouchEvent)
			OryUITouchCollection[OryUITouchCollection[0].touchCount].currentSpriteHit = GetSpriteHit(ScreenToWorldX(GetRawTouchCurrentX(oryUITouchEvent)), ScreenToWorldY(GetRawTouchCurrentY(oryUITouchEvent)))
			OryUITouchCollection[OryUITouchCollection[0].touchCount].firstSpriteHit = GetSpriteHit(ScreenToWorldX(GetRawTouchStartX(oryUITouchEvent)), ScreenToWorldY(GetRawTouchStartY(oryUITouchEvent)))
			oryUITouchEvent = GetRawNextTouchEvent()
		endwhile

		if (OryUITouchCollection[0].touchCount > 0)
			OryUITouchCollection[0].currentZoom# = GetViewZoom()
			OryUITouchCollection[0].currentViewX# = GetViewOffsetX()
			OryUITouchCollection[0].currentViewY# = GetViewOffsetY()
			if (OryUITouchCollection[0].previousTouchCount <> OryUITouchCollection[0].touchCount)
				OryUITouchCollection[0].startZoom# = OryUITouchCollection[0].currentZoom#
				OryUITouchCollection[0].startViewX# = OryUITouchCollection[0].currentViewX#
				OryUITouchCollection[0].startViewY# = OryUITouchCollection[0].currentViewY#
				OryUITouchCollection[1].startX# = OryUITouchCollection[1].currentX#
				OryUITouchCollection[1].startY# = OryUITouchCollection[1].currentY#
				OryUITouchCollection[2].startX# = OryUITouchCollection[2].currentX#
				OryUITouchCollection[2].startY# = OryUITouchCollection[2].currentY#
			endif
		  
			OryUITouchCollection[0].startDistanceX# = OryUITouchCollection[1].startX# - OryUITouchCollection[2].startX#
			OryUITouchCollection[0].startDistanceY# = OryUITouchCollection[1].startY# - OryUITouchCollection[2].startY#
			OryUITouchCollection[0].startDistance# = sqrt(OryUITouchCollection[0].startDistanceX# * OryUITouchCollection[0].startDistanceX# + OryUITouchCollection[0].startDistanceY# * OryUITouchCollection[0].startDistanceY#)
			OryUITouchCollection[0].currentDistanceX# = OryUITouchCollection[1].currentX# - OryUITouchCollection[2].currentX#
			OryUITouchCollection[0].currentDistanceY# = OryUITouchCollection[1].currentY# - OryUITouchCollection[2].currentY#
			OryUITouchCollection[0].currentDistance# = sqrt(OryUITouchCollection[0].currentDistanceX# * OryUITouchCollection[0].currentDistanceX# + OryUITouchCollection[0].currentDistanceY# * OryUITouchCollection[0].currentDistanceY#)

			OryUITouchCollection[0].viewZoom# = OryUITouchCollection[0].startZoom# + (OryUITouchCollection[0].currentDistance# - OryUITouchCollection[0].startDistance#) * OryUITouchCollection[0].currentZoom# * 0.02
			if (OryUITouchCollection[0].viewZoom# < OryUITouchCollection[0].minViewZoom#) then OryUITouchCollection[0].viewZoom# = OryUITouchCollection[0].minViewZoom#
			if (OryUITouchCollection[0].viewZoom# > OryUITouchCollection[0].maxViewZoom#) then OryUITouchCollection[0].viewZoom# = OryUITouchCollection[0].maxViewZoom#
			if (OryUITouchCollection[0].touchCount = 2)
				SetViewZoom(OryUITouchCollection[0].viewZoom#)
			endif

			OryUITouchCollection[0].startMovedX# = (OryUITouchCollection[2].startX# + OryUITouchCollection[1].startX#) * 1
			OryUITouchCollection[0].startMovedY# = (OryUITouchCollection[2].startY# + OryUITouchCollection[1].startY#) * 1
			OryUITouchCollection[0].currentMovedX# = (OryUITouchCollection[2].currentX# + OryUITouchCollection[1].currentX#) * 1
			OryUITouchCollection[0].currentMovedY# = (OryUITouchCollection[2].currentY# + OryUITouchCollection[1].currentY#) * 1
			OryUITouchCollection[0].distanceMovedX# = (OryUITouchCollection[0].startMovedX# - OryUITouchCollection[0].currentMovedX#) / OryUITouchCollection[0].currentZoom#
			OryUITouchCollection[0].distanceMovedY# = (OryUITouchCollection[0].startMovedY# - OryUITouchCollection[0].currentMovedY#) / OryUITouchCollection[0].currentZoom#

			if (abs(OryUITouchCollection[0].distanceMovedX#) > 1)
				OryUITouchCollection[0].swipingDistanceX# = abs(OryUITouchCollection[0].distanceMovedX#)
				OryUITouchCollection[0].swipingHorizontally = 1
				if (OryUITouchCollection[0].distanceMovedX# < 0)
					OryUITouchCollection[0].swipingRight = 1
				endif
				if (OryUITouchCollection[0].distanceMovedX# > 0)
					OryUITouchCollection[0].swipingLeft = 1
				endif
			endif
			if (abs(OryUITouchCollection[0].distanceMovedY#) > 1)
				OryUITouchCollection[0].swipingDistanceY# = abs(OryUITouchCollection[0].distanceMovedY#)
				OryUITouchCollection[0].swipingVertically = 1
				if (OryUITouchCollection[0].distanceMovedY# < 0)
					OryUITouchCollection[0].swipingDown = 1
				endif
				if (OryUITouchCollection[0].distanceMovedY# > 0)
					OryUITouchCollection[0].swipingUp = 1
				endif
			endif

			OryUITouchCollection[0].viewX# = OryUITouchCollection[0].startViewX# + OryUITouchCollection[0].distanceMovedX#
			if (OryUITouchCollection[0].viewX# < OryUITouchCollection[0].minViewX#) then OryUITouchCollection[0].viewX# = OryUITouchCollection[0].minViewX#
			if (OryUITouchCollection[0].viewX# > OryUITouchCollection[0].maxViewX#) then OryUITouchCollection[0].viewX# = OryUITouchCollection[0].maxViewX#
			OryUITouchCollection[0].viewY# = OryUITouchCollection[0].startViewY# + OryUITouchCollection[0].distanceMovedY#
			if (OryUITouchCollection[0].viewY# < OryUITouchCollection[0].minViewY#) then OryUITouchCollection[0].viewY# = OryUITouchCollection[0].minViewY#
			if (OryUITouchCollection[0].viewY# > OryUITouchCollection[0].maxViewY#) then OryUITouchCollection[0].viewY# = OryUITouchCollection[0].maxViewY#
			if (oryUIBlockScreenScrolling = 0 and (OryUITouchCollection[0].minViewX# > 0 or OryUITouchCollection[0].maxViewX# > 0 or OryUITouchCollection[0].minViewY# > 0 or OryUITouchCollection[0].maxViewY# > 0)) then OryUISetViewOffset(ORYUI_SCROLL_STEP)
		endif
		if (GetRawTouchCount(1) = 0)
			OryUISetViewOffset(ORYUI_SCROLL_INERTIA)
		endif
	else
		if (GetPointerPressed())
			OryUITouchCollection[0].startX# = ScreenToWorldX(GetPointerX())
			OryUITouchCollection[0].startY# = ScreenToWorldY(GetPointerY())
			OryUITouchCollection[1].firstSpriteHit = GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			OryUITouchCollection[0].touchTime# = timer()
			OryUITouchCollection[0].startViewX# = GetViewOffsetX()
			OryUITouchCollection[0].startViewY# = GetViewOffsetY()
		else
			if (GetPointerState())
				OryUITouchCollection[1].currentSpriteHit = GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (timer() - OryUITouchCollection[0].touchTime# > 0.1)
					OryUITouchCollection[0].currentX# = ScreenToWorldX(GetPointerX())
					OryUITouchCollection[0].currentY# = ScreenToWorldY(GetPointerY())
					OryUITouchCollection[0].currentDistanceX# = OryUITouchCollection[0].startX# - OryUITouchCollection[0].currentX#
					OryUITouchCollection[0].currentDistanceY# = OryUITouchCollection[0].startY# - OryUITouchCollection[0].currentY#
					OryUITouchCollection[0].viewX# = OryUITouchCollection[0].startViewX# + OryUITouchCollection[0].currentDistanceX#
					OryUITouchCollection[0].viewY# = OryUITouchCollection[0].startViewY# + OryUITouchCollection[0].currentDistanceY#
					//if (ScreenToWorldX(startX#) > contentStartX#)
						//if (contentWidth# < 100)
						//	OryUITouchCollection[0].viewX# = contentStartX#
						//elseif (OryUITouchCollection[0].viewX# > contentStartX# + (contentWidth# - 100))
						//	OryUITouchCollection[0].viewX# = contentStartX# + (contentWidth# - 100)
						//endif
						//if (OryUITouchCollection[0].viewX# < contentStartX#) then OryUITouchCollection[0].viewX# = contentStartX#
						//SetViewOffset(OryUITouchCollection[0].viewX#, GetViewOffsetY() + GetScreenBoundsTop())
						if (abs(OryUITouchCollection[0].currentDistanceX#) > 0.5)
							OryUITouchCollection[0].swipingDistanceX# = abs(OryUITouchCollection[0].currentDistanceX#)
							OryUITouchCollection[0].swipingHorizontally = 1
							if (OryUITouchCollection[0].currentDistanceX# < 0)
								OryUITouchCollection[0].swipingRight = 1
							endif
							if (OryUITouchCollection[0].currentDistanceX# > 0)
								OryUITouchCollection[0].swipingLeft = 1
							endif
						endif
					//endif
					//if (startY# > contentStartY#)
						//if (contentHeight# < 100)
						//	OryUITouchCollection[0].viewY# = 0
						//elseif (OryUITouchCollection[0].viewY# > contentHeight# - 100)
						//	OryUITouchCollection[0].viewY# = contentHeight# - 100
						//endif
						//if (OryUITouchCollection[0].viewY# < 0) then OryUITouchCollection[0].viewY# = 0
						//SetViewOffset(GetViewOffsetX(), OryUITouchCollection[0].viewY#)
						if (abs(OryUITouchCollection[0].currentDistanceY#) > 0.5)
							OryUITouchCollection[0].swipingDistanceY# = abs(OryUITouchCollection[0].currentDistanceY#)
							OryUITouchCollection[0].swipingVertically = 1
							if (OryUITouchCollection[0].currentDistanceY# < 0)
								OryUITouchCollection[0].swipingDown = 1
							endif
							if (OryUITouchCollection[0].currentDistanceY# > 0)
								OryUITouchCollection[0].swipingUp = 1
							endif
	
							//if (contentHeight# > 100 - contentStartY#)
							//	UpdateSprite(sprScrollBar, "size:1," + str((100 - contentStartY#) * (100 / contentHeight#)) + ";position:" + str((screenNo * 10000) + 99) + "," + str(GetScrollBarY(contentStartY#, 100)) + ";alpha:75")
							//endif
						endif
					//endif
					if (OryUITouchCollection[0].viewX# < OryUITouchCollection[0].minViewX#) then OryUITouchCollection[0].viewX# = OryUITouchCollection[0].minViewX#
					if (OryUITouchCollection[0].viewX# > OryUITouchCollection[0].maxViewX#) then OryUITouchCollection[0].viewX# = OryUITouchCollection[0].maxViewX#
					if (OryUITouchCollection[0].viewY# < OryUITouchCollection[0].minViewY#) then OryUITouchCollection[0].viewY# = OryUITouchCollection[0].minViewY#
					if (OryUITouchCollection[0].viewY# > OryUITouchCollection[0].maxViewY#) then OryUITouchCollection[0].viewY# = OryUITouchCollection[0].maxViewY#
					if (oryUIBlockScreenScrolling = 0 and (OryUITouchCollection[0].minViewX# > 0 or OryUITouchCollection[0].maxViewX# > 0 or OryUITouchCollection[0].minViewY# > 0 or OryUITouchCollection[0].maxViewY# > 0)) then OryUISetViewOffset(ORYUI_SCROLL_STEP)
				endif
			endif
			if (GetPointerReleased())
				OryUISetViewOffset(ORYUI_SCROLL_INERTIA)
			endif
		endif
	endif
endfunction

foldend
