
foldstart // OryUITouch (Updated 24/02/2019)

global oryUISwipingHorizontally as integer
global oryUISwipingVertically as integer
global oryUIDX# as float
global oryUIDY# as float
global oryUIPressedX# as float
global oryUIPressedY# as float
global oryUIScrollStartX# as float
global oryUIScrollStartY# as float
global oryUISpriteHit as integer
global oryUITouchTime# as float
global oryUIViewDX# as float
global oryUIViewDY# as float
global oryUIViewX# as float
global oryUIViewY# as float

function OryUIEndTrackingTouch()
	if (GetPointerReleased())
		oryUISwipingHorizontally = 0
		oryUISwipingVertically = 0
		oryUISpriteHit = 0
	endif
endfunction

function OryUIGetSwipingHorizontally()

endfunction oryUISwipingHorizontally

function OryUIGetSwipingVertically()

endfunction oryUISwipingVertically

function OryUIStartTrackingTouch()
	if (GetPointerPressed())
		oryUIPressedX# = ScreenToWorldX(GetPointerX())
		oryUIPressedY# = ScreenToWorldY(GetPointerY())
		oryUIScrollStartX# = GetPointerX()
		oryUIScrollStartY# = GetPointerY()
		oryUISpriteHit = GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
		oryUITouchTime# = timer()
		oryUIViewX# = GetViewOffsetX()
		oryUIViewY# = GetViewOffsetY()
	else
		if (GetPointerState())
			if (timer() - oryUITouchTime# > 0.1)
				oryUIDX# = oryUIScrollStartX# - GetPointerX()
				oryUIDY# = oryUIScrollStartY# - GetPointerY()
				oryUIViewDX# = oryUIViewX# + oryUIDX#
				oryUIViewDY# = oryUIViewY# + oryUIDY#
				//if (ScreenToWorldX(scrollStartX#) > contentStartX#)
					//if (contentWidth# < 100)
					//	viewDX# = contentStartX#
					//elseif (viewDX# > contentStartX# + (contentWidth# - 100))
					//	viewDX# = contentStartX# + (contentWidth# - 100)
					//endif
					//if (viewDX# < contentStartX#) then viewDX# = contentStartX#
					//SetViewOffset(oryUIViewDX#, GetViewOffsetY())
					if (abs(oryUIDX#) > 0.5)
						oryUISwipingHorizontally = 1
					endif
				//endif
				//if (scrollStartY# > contentStartY#)
					//if (contentHeight# < 100)
					//	viewDY# = 0
					//elseif (viewDY# > contentHeight# - 100)
					//	viewDY# = contentHeight# - 100
					//endif
					//if (viewDY# < 0) then viewDY# = 0
					//SetViewOffset(GetViewOffsetX(), oryUIViewDY#)
					if (abs(oryUIDY#) > 0.5)
						oryUISwipingVertically = 1
						//if (contentHeight# > 100 - contentStartY#)
						//	UpdateSprite(sprScrollBar, "size:1," + str((100 - contentStartY#) * (100 / contentHeight#)) + ";position:" + str((screenNo * 10000) + 99) + "," + str(GetScrollBarY(contentStartY#, 100)) + ";alpha:75")
						//endif
					endif
				//endif
			endif
		endif
	endif
endfunction

foldend
