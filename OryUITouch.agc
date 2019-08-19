
foldstart // OryUITouch (Updated 19/08/2019)

SetRawTouchMoveSensitivity(1)
SetViewZoomMode(1)

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
	swipingHorizontally as integer
	swipingVertically as integer
	touchCount as integer
	touchTime# as float
	viewX# as float
	viewY# as float
	viewZoom# as float
endtype

global OryUITouchCollection as typeOryUITouch[10]
global oryUITouchCount as integer
OryUISetScreenZoomLimits(1, 1)
OryUISetScreenScrollLimits(0, 0, 0, 0)

function OryUIDisableScreenScrolling()
	oryUIBlockScreenScrolling = 1
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
			OryUITouchCollection[1].spritePressed = 0
			OryUITouchCollection[1].spriteReleased = 0
			OryUITouchCollection[0].swipingHorizontally = 0
			OryUITouchCollection[0].swipingVertically = 0
			OryUITouchCollection[0].touchCount = 0
		endif
	else
		if (GetPointerReleased())
			OryUITouchCollection[1].currentSpriteHit = 0
			OryUITouchCollection[1].firstSpriteHit = 0
			OryUITouchCollection[1].spritePressed = 0
			OryUITouchCollection[1].spriteReleased = 0
			OryUITouchCollection[0].swipingHorizontally = 0
			OryUITouchCollection[0].swipingVertically = 0
		endif
	endif
endfunction

function OryUIGetSpritePressed()
	
endfunction OryUITouchCollection[1].firstSpriteHit

function OryUIGetSpriteReleased()
	local oryUISpriteReleased as integer
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

function OryUIGetSwipingHorizontally()

endfunction OryUITouchCollection[0].swipingHorizontally

function OryUIGetSwipingVertically()

endfunction OryUITouchCollection[0].swipingVertically

function OryUISetScreenScrollLimits(oryUIMinX# as float, oryUIMaxX# as float, oryUIMinY# as float, oryUIMaxY# as float)
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

// The GetRawTouch code in the below function is based on @baxslash's PinchZoom function he shared on the AGK forum
// https://forum.thegamecreators.com/thread/205033
function OryUIStartTrackingTouch()
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
				OryUITouchCollection[0].swipingHorizontally = 1
			endif
			if (abs(OryUITouchCollection[0].distanceMovedY#) > 1)
				OryUITouchCollection[0].swipingVertically = 1
			endif

			OryUITouchCollection[0].viewX# = OryUITouchCollection[0].startViewX# + OryUITouchCollection[0].distanceMovedX#
			if (OryUITouchCollection[0].viewX# < OryUITouchCollection[0].minViewX#) then OryUITouchCollection[0].viewX# = OryUITouchCollection[0].minViewX#
			if (OryUITouchCollection[0].viewX# > OryUITouchCollection[0].maxViewX#) then OryUITouchCollection[0].viewX# = OryUITouchCollection[0].maxViewX#
			OryUITouchCollection[0].viewY# = OryUITouchCollection[0].startViewY# + OryUITouchCollection[0].distanceMovedY#
			if (OryUITouchCollection[0].viewY# < OryUITouchCollection[0].minViewY#) then OryUITouchCollection[0].viewY# = OryUITouchCollection[0].minViewY#
			if (OryUITouchCollection[0].viewY# > OryUITouchCollection[0].maxViewY#) then OryUITouchCollection[0].viewY# = OryUITouchCollection[0].maxViewY#
			if (oryUIBlockScreenScrolling = 0 and (OryUITouchCollection[0].minViewX# > 0 or OryUITouchCollection[0].maxViewX# > 0 or OryUITouchCollection[0].minViewY# > 0 or OryUITouchCollection[0].maxViewY# > 0)) then SetViewOffset(OryUITouchCollection[0].viewX#, OryUITouchCollection[0].viewY#)
		endif
	else
		if (GetPointerPressed())
			OryUITouchCollection[0].startX# = GetPointerX()
			OryUITouchCollection[0].startY# = GetPointerY()
			OryUITouchCollection[1].firstSpriteHit = GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			OryUITouchCollection[0].touchTime# = timer()
			OryUITouchCollection[0].startViewX# = GetViewOffsetX()
			OryUITouchCollection[0].startViewY# = GetViewOffsetY()
		else
			if (GetPointerState())
				OryUITouchCollection[1].currentSpriteHit = GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (timer() - OryUITouchCollection[0].touchTime# > 0.1)
					OryUITouchCollection[0].currentDistanceX# = OryUITouchCollection[0].startX# - GetPointerX()
					OryUITouchCollection[0].currentDistanceY# = OryUITouchCollection[0].startY# - GetPointerY()
					OryUITouchCollection[0].viewX# = OryUITouchCollection[0].startViewX# + OryUITouchCollection[0].currentDistanceX#
					OryUITouchCollection[0].viewY# = OryUITouchCollection[0].startViewY# + OryUITouchCollection[0].currentDistanceY#
					//if (ScreenToWorldX(startX#) > contentStartX#)
						//if (contentWidth# < 100)
						//	OryUITouchCollection[0].viewX# = contentStartX#
						//elseif (OryUITouchCollection[0].viewX# > contentStartX# + (contentWidth# - 100))
						//	OryUITouchCollection[0].viewX# = contentStartX# + (contentWidth# - 100)
						//endif
						//if (OryUITouchCollection[0].viewX# < contentStartX#) then OryUITouchCollection[0].viewX# = contentStartX#
						//SetViewOffset(OryUITouchCollection[0].viewX#, GetViewOffsetY())
						if (abs(OryUITouchCollection[0].currentDistanceX#) > 0.5)
							OryUITouchCollection[0].swipingHorizontally = 1
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
							OryUITouchCollection[0].swipingVertically = 1
							//if (contentHeight# > 100 - contentStartY#)
							//	UpdateSprite(sprScrollBar, "size:1," + str((100 - contentStartY#) * (100 / contentHeight#)) + ";position:" + str((screenNo * 10000) + 99) + "," + str(GetScrollBarY(contentStartY#, 100)) + ";alpha:75")
							//endif
						endif
					//endif
					if (OryUITouchCollection[0].viewX# < OryUITouchCollection[0].minViewX#) then OryUITouchCollection[0].viewX# = OryUITouchCollection[0].minViewX#
					if (OryUITouchCollection[0].viewX# > OryUITouchCollection[0].maxViewX#) then OryUITouchCollection[0].viewX# = OryUITouchCollection[0].maxViewX#
					if (OryUITouchCollection[0].viewY# < OryUITouchCollection[0].minViewY#) then OryUITouchCollection[0].viewY# = OryUITouchCollection[0].minViewY#
					if (OryUITouchCollection[0].viewY# > OryUITouchCollection[0].maxViewY#) then OryUITouchCollection[0].viewY# = OryUITouchCollection[0].maxViewY#
					if (oryUIBlockScreenScrolling = 0 and (OryUITouchCollection[0].minViewX# > 0 or OryUITouchCollection[0].maxViewX# > 0 or OryUITouchCollection[0].minViewY# > 0 or OryUITouchCollection[0].maxViewY# > 0)) then SetViewOffset(OryUITouchCollection[0].viewX#, OryUITouchCollection[0].viewY#)
				endif
			endif
		endif
	endif
endfunction

foldend
