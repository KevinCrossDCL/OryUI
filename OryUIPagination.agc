
foldstart // OryUIPagination Widget

type typeOryUIPagination
	id as integer
	buttonMargin# as float
	buttonPressed as integer
	buttonReleased as integer
	buttons as typeOryUIPaginationButtons[]
	buttonSize# as float[2]
	flexButtons as integer
	iconSize# as float[2]
	inactiveColor# as float[4]
	inactiveIconColor# as float[4]
	inactiveTextBold as integer
	inactiveTextColor# as float[4]
	inactiveTextSize# as float
	maxButtonsToDisplay as integer
	noOfPages as integer
	pageSelected as integer
	selected as integer
	selectedColor# as float[4]
	selectedIconColor# as float[4]
	selectedTextBold as integer
	selectedTextColor# as float[4]
	selectedTextSize# as float
	showSkipToEndButtons as integer
	sprContainer as integer
	unselectedColor# as float[4]
	unselectedIconColor# as float[4]
	unselectedTextBold as integer
	unselectedTextColor# as float[4]
	unselectedTextSize# as float
	visible as integer
endtype

type typeOryUIPaginationButtons
	id as integer
	icon$ as string
	label$ as string
	name$ as string
	page as integer
	pressed as integer
	released as integer
	selected as integer
	sprContainer as integer
	sprIcon as integer
	txtLabel as integer
endtype

global OryUIPaginationCollection as typeOryUIPagination[]
OryUIPaginationCollection.length = 1

function OryUICreatePagination(oryUIWidgetParameters$ as string)
	local oryUIPaginationID as integer
	OryUIPaginationCollection.length = OryUIPaginationCollection.length + 1
	oryUIPaginationID = OryUIPaginationCollection.length
	OryUIPaginationCollection[oryUIPaginationID].id = oryUIPaginationID

	oryUICreatedWidgets.insert(OryUIAddCreatedWidget(oryUIPaginationID, "Pagination"))

	// DEFAULT SETTINGS
	OryUIPaginationCollection[oryUIPaginationID].buttonMargin# = oryUIDefaults.paginationButtonMargin#
	OryUIPaginationCollection[oryUIPaginationID].buttonPressed = -1
	OryUIPaginationCollection[oryUIPaginationID].buttonReleased = -1
	//OryUIPaginationCollection[oryUIPaginationID].buttonSize#[1] = oryUIDefaults.paginationButtonWidth#
	//OryUIPaginationCollection[oryUIPaginationID].buttonSize#[2] = oryUIDefaults.paginationButtonHeight#
	OryUIPaginationCollection[oryUIPaginationID].flexButtons = 1 //oryUIDefaults.paginationFlexButtons
	OryUIPaginationCollection[oryUIPaginationID].iconSize#[1] = oryUIDefaults.paginationIconWidth#
	OryUIPaginationCollection[oryUIPaginationID].iconSize#[2] = oryUIDefaults.paginationIconHeight#
	OryUIPaginationCollection[oryUIPaginationID].inactiveColor#[1] = oryUIDefaults.paginationInactiveColor#[1]
	OryUIPaginationCollection[oryUIPaginationID].inactiveColor#[2] = oryUIDefaults.paginationInactiveColor#[2]
	OryUIPaginationCollection[oryUIPaginationID].inactiveColor#[3] = oryUIDefaults.paginationInactiveColor#[3]
	OryUIPaginationCollection[oryUIPaginationID].inactiveColor#[4] = oryUIDefaults.paginationInactiveColor#[4]
	OryUIPaginationCollection[oryUIPaginationID].inactiveIconColor#[1] = oryUIDefaults.paginationInactiveIconColor#[1]
	OryUIPaginationCollection[oryUIPaginationID].inactiveIconColor#[2] = oryUIDefaults.paginationInactiveIconColor#[2]
	OryUIPaginationCollection[oryUIPaginationID].inactiveIconColor#[3] = oryUIDefaults.paginationInactiveIconColor#[3]
	OryUIPaginationCollection[oryUIPaginationID].inactiveIconColor#[4] = oryUIDefaults.paginationInactiveIconColor#[4]
	OryUIPaginationCollection[oryUIPaginationID].inactiveTextBold = oryUIDefaults.paginationInactiveTextBold
	OryUIPaginationCollection[oryUIPaginationID].inactiveTextColor#[1] = oryUIDefaults.paginationInactiveTextColor#[1]
	OryUIPaginationCollection[oryUIPaginationID].inactiveTextColor#[2] = oryUIDefaults.paginationInactiveTextColor#[2]
	OryUIPaginationCollection[oryUIPaginationID].inactiveTextColor#[3] = oryUIDefaults.paginationInactiveTextColor#[3]
	OryUIPaginationCollection[oryUIPaginationID].inactiveTextColor#[4] = oryUIDefaults.paginationInactiveTextColor#[4]
	OryUIPaginationCollection[oryUIPaginationID].inactiveTextSize# = oryUIDefaults.paginationInactiveTextSize#
	OryUIPaginationCollection[oryUIPaginationID].maxButtonsToDisplay = oryUIDefaults.paginationMaximumButtonsToDisplay
	OryUIPaginationCollection[oryUIPaginationID].pageSelected = 1
	OryUIPaginationCollection[oryUIPaginationID].selected = -1
	OryUIPaginationCollection[oryUIPaginationID].selectedColor#[1] = oryUIDefaults.paginationSelectedColor#[1]
	OryUIPaginationCollection[oryUIPaginationID].selectedColor#[2] = oryUIDefaults.paginationSelectedColor#[2]
	OryUIPaginationCollection[oryUIPaginationID].selectedColor#[3] = oryUIDefaults.paginationSelectedColor#[3]
	OryUIPaginationCollection[oryUIPaginationID].selectedColor#[4] = oryUIDefaults.paginationSelectedColor#[4]
	OryUIPaginationCollection[oryUIPaginationID].selectedIconColor#[1] = oryUIDefaults.paginationSelectedIconColor#[1]
	OryUIPaginationCollection[oryUIPaginationID].selectedIconColor#[2] = oryUIDefaults.paginationSelectedIconColor#[2]
	OryUIPaginationCollection[oryUIPaginationID].selectedIconColor#[3] = oryUIDefaults.paginationSelectedIconColor#[3]
	OryUIPaginationCollection[oryUIPaginationID].selectedIconColor#[4] = oryUIDefaults.paginationSelectedIconColor#[4]
	OryUIPaginationCollection[oryUIPaginationID].selectedTextBold = oryUIDefaults.paginationSelectedTextBold
	OryUIPaginationCollection[oryUIPaginationID].selectedTextColor#[1] = oryUIDefaults.paginationSelectedTextColor#[1]
	OryUIPaginationCollection[oryUIPaginationID].selectedTextColor#[2] = oryUIDefaults.paginationSelectedTextColor#[2]
	OryUIPaginationCollection[oryUIPaginationID].selectedTextColor#[3] = oryUIDefaults.paginationSelectedTextColor#[3]
	OryUIPaginationCollection[oryUIPaginationID].selectedTextColor#[4] = oryUIDefaults.paginationSelectedTextColor#[4]
	OryUIPaginationCollection[oryUIPaginationID].selectedTextSize# = oryUIDefaults.paginationSelectedTextSize#
	OryUIPaginationCollection[oryUIPaginationID].showSkipToEndButtons = oryUIDefaults.paginationShowSkipToEndButtons
	OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[1] = oryUIDefaults.paginationUnselectedColor#[1]
	OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[2] = oryUIDefaults.paginationUnselectedColor#[2]
	OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[3] = oryUIDefaults.paginationUnselectedColor#[3]
	OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[4] = oryUIDefaults.paginationUnselectedColor#[4]
	OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[1] = oryUIDefaults.paginationUnselectedIconColor#[1]
	OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[2] = oryUIDefaults.paginationUnselectedIconColor#[2]
	OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[3] = oryUIDefaults.paginationUnselectedIconColor#[3]
	OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[4] = oryUIDefaults.paginationUnselectedIconColor#[4]
	OryUIPaginationCollection[oryUIPaginationID].unselectedTextBold = oryUIDefaults.paginationUnselectedTextBold
	OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[1] = oryUIDefaults.paginationUnselectedTextColor#[1]
	OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[2] = oryUIDefaults.paginationUnselectedTextColor#[2]
	OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[3] = oryUIDefaults.paginationUnselectedTextColor#[3]
	OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[4] = oryUIDefaults.paginationUnselectedTextColor#[4]
	OryUIPaginationCollection[oryUIPaginationID].unselectedTextSize# = oryUIDefaults.paginationUnselectedTextSize#
	OryUIPaginationCollection[oryUIPaginationID].visible = 1

	OryUIPaginationCollection[oryUIPaginationID].noOfPages = 6

	OryUIPaginationCollection[oryUIPaginationID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIPaginationCollection[oryUIPaginationID].sprContainer, oryUIDefaults.paginationWidth#, oryUIDefaults.paginationHeight#)
	SetSpriteDepth(OryUIPaginationCollection[oryUIPaginationID].sprContainer, oryUIDefaults.paginationDepth)
	SetSpriteColor(OryUIPaginationCollection[oryUIPaginationID].sprContainer, oryUIDefaults.paginationColor#[1], oryUIDefaults.paginationColor#[2], oryUIDefaults.paginationColor#[3], oryUIDefaults.paginationColor#[4])
	SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, 0, 0)
	SetSpritePhysicsOff(OryUIPaginationCollection[oryUIPaginationID].sprContainer)

	if (oryUIWidgetParameters$ <> "") then OryUIUpdatePagination(oryUIPaginationID, oryUIWidgetParameters$)
endfunction oryUIPaginationID

function OryUIDeletePagination(oryUIPaginationID as integer)
	if (oryUIPaginationID <= OryUIPaginationCollection.length)
		DeleteSprite(OryUIPaginationCollection[oryUIPaginationID].sprContainer)
	endif
	while (OryUIPaginationCollection[oryUIPaginationID].buttons.length >= 0)
		OryUIDeletePaginationButton(oryUIPaginationID, 0)
	endwhile
endfunction

function OryUIDeletePaginationButton(oryUIPaginationID as integer, oryUIPaginationButtonID as integer)
	DeleteSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprContainer)
	DeleteSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprIcon)
	DeleteText(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].txtLabel)
	OryUIPaginationCollection[oryUIPaginationID].buttons.remove(oryUIPaginationButtonID)
endfunction

function OryUIGetPaginationHeight(oryUIPaginationID as integer)
	local oryUIPaginationHeight# as float
	
	oryUIPaginationHeight# = 0
	if (GetSpriteExists(OryUIPaginationCollection[oryUIPaginationID].sprContainer))
		oryUIPaginationHeight# = GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].sprContainer)
	endif
endfunction oryUIPaginationHeight#

function OryUIGetPaginationButtonCount(oryUIPaginationID as integer)
	local oryUIPaginationButtonCount as integer
	
	oryUIPaginationButtonCount = OryUIPaginationCollection[oryUIPaginationID].buttons.length + 1
endfunction oryUIPaginationButtonCount

function OryUIGetPaginationButtonHeight(oryUIPaginationID as integer, oryUIButtonID as integer)
	local oryUIPaginationButtonHeight# as float
	
	oryUIPaginationButtonHeight# = 0
	if (GetSpriteExists(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIButtonID - 1].sprContainer))
		oryUIPaginationButtonHeight# = GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIButtonID - 1].sprContainer)
	endif
endfunction oryUIPaginationButtonHeight#

remstart
function OryUIGetPaginationButtonReleasedByIndex(oryUIPaginationID as integer, oryUIPaginationButtonIndex as integer)
	local oryUIPaginationButtonReleased as integer
	oryUIPaginationButtonReleased = 0
	if (OryUIPaginationCollection[oryUIPaginationID].buttonReleased = oryUIPaginationButtonIndex) then oryUIPaginationButtonReleased = 1
endfunction oryUIPaginationButtonReleased

function OryUIGetPaginationButtonReleasedByName(oryUIPaginationID as integer, oryUIPaginationButtonName$ as string)
	local oryUIPaginationButtonReleased as integer
	oryUIPaginationButtonReleased = 0
	if (OryUIPaginationCollection[oryUIPaginationID].buttonReleased > 0)
		if (lower(OryUIPaginationCollection[oryUIPaginationID].buttons[OryUIPaginationCollection[oryUIPaginationID].buttonReleased - 1].name$) = lower(oryUIPaginationButtonName$)) then oryUIPaginationButtonReleased = 1
	endif
endfunction oryUIPaginationButtonReleased

function OryUIGetPaginationButtonReleasedIndex(oryUIPaginationID as integer)
	local oryUIPaginationButtonReleasedIndex as integer
	oryUIPaginationButtonReleasedIndex = OryUIPaginationCollection[oryUIPaginationID].buttonReleased
endfunction oryUIPaginationButtonReleasedIndex

function OryUIGetPaginationButtonReleasedName(oryUIPaginationID as integer)
	local oryUIPaginationButtonReleasedName$ as string
	if (OryUIPaginationCollection[oryUIPaginationID].buttonReleased > 0)
		oryUIPaginationButtonReleasedName$ = OryUIPaginationCollection[oryUIPaginationID].buttons[OryUIPaginationCollection[oryUIPaginationID].buttonReleased - 1].name$
	endif
endfunction oryUIPaginationButtonReleasedName$

function OryUIGetPaginationButtonSelectedIndex(oryUIPaginationID as integer)
	local oryUIPaginationButtonSelectedIndex
	oryUIPaginationButtonSelectedIndex = OryUIPaginationCollection[oryUIPaginationID].selected
endfunction oryUIPaginationButtonSelectedIndex

function OryUIGetPaginationButtonSelectedName(oryUIPaginationID as integer)
	local oryUIPaginationButtonSelectedName$
	if (OryUIPaginationCollection[oryUIPaginationID].selected > 0)
		oryUIPaginationButtonSelectedName$ = OryUIPaginationCollection[oryUIPaginationID].buttons[OryUIPaginationCollection[oryUIPaginationID].selected - 1].name$
	endif
endfunction oryUIPaginationButtonSelectedName$
remend

function OryUIGetPaginationButtonWidth(oryUIPaginationID as integer, oryUIPaginationButtonID as integer)
	local oryUIPaginationButtonWidth# as float
	
	if (GetSpriteExists(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID - 1].sprContainer))
		oryUIPaginationButtonWidth# = GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID - 1].sprContainer)
	endif
endfunction oryUIPaginationButtonWidth#

function OryUIGetPaginationChanged(oryUIPaginationID as integer)
	local oryUIPaginationChanged as integer
	
	if (OryUIPaginationCollection[oryUIPaginationID].buttonReleased > 0) then oryUIPaginationChanged = 1
endfunction oryUIPaginationChanged

function OryUIGetPaginationSelectedPage(oryUIPaginationID as integer)
	local oryUIPaginationSelectedPage as integer
	
	if (OryUIPaginationCollection[oryUIPaginationID].pageSelected > 0) then oryUIPaginationSelectedPage = OryUIPaginationCollection[oryUIPaginationID].pageSelected
endfunction oryUIPaginationSelectedPage

function OryUIGetPaginationWidth(oryUIPaginationID as integer)
	local oryUIPaginationWidth# as float
	
	if (GetSpriteExists(OryUIPaginationCollection[oryUIPaginationID].sprContainer))
		oryUIPaginationWidth# = GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].sprContainer)
	endif
endfunction oryUIPaginationWidth#

function OryUIGetPaginationX(oryUIPaginationID as integer)
	local oryUIPaginationX# as float
	
	if (OryUIPaginationCollection[oryUIPaginationID].visible = 1)
		oryUIPaginationX# = GetSpriteX(OryUIPaginationCollection[oryUIPaginationID].sprContainer)
	endif
endfunction oryUIPaginationX#

function OryUIGetPaginationY(oryUIPaginationID as integer)
	local oryUIPaginationY# as float
	
	if (OryUIPaginationCollection[oryUIPaginationID].visible = 1)
		oryUIPaginationY# = GetSpriteY(OryUIPaginationCollection[oryUIPaginationID].sprContainer)
	endif
endfunction oryUIPaginationY#

function OryUIInsertPaginationButton(oryUIPaginationID as integer, oryUIPaginationIndex as integer, oryUIWidgetParameters$ as string)
	local oryUIPaginationButtonID as integer
	
	if (oryUIPaginationIndex = -1)
		OryUIPaginationCollection[oryUIPaginationID].buttons.length = OryUIPaginationCollection[oryUIPaginationID].buttons.length + 1
		oryUIPaginationButtonID = OryUIPaginationCollection[oryUIPaginationID].buttons.length
		OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].id = oryUIPaginationButtonID + 1
	endif

	OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprContainer, -1, GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].sprContainer) - (OryUIPaginationCollection[oryUIPaginationID].buttonMargin# * 2))
	SetSpriteDepth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprContainer, GetSpriteDepth(OryUIPaginationCollection[oryUIPaginationID].sprContainer) - 1)
	SetSpriteColor(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprContainer, OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[1], OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[2], OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[3], OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[4])
	SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprContainer, -999999, -999999)
	SetSpritePhysicsOff(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprContainer)

	OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].icon$ = ""
	OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprIcon = CreateSprite(0)
	SetSpriteSize(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprIcon, -1, 3) //2.87
	SetSpriteColor(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprIcon, OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[1], OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[2], OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[3], 0)
	SetSpriteDepth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprIcon, GetSpriteDepth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprContainer) - 1)
	SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprIcon, GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprIcon) / 2, GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprIcon) / 2)
	SetSpritePhysicsOff(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprIcon)
	OryUIPinSpriteToCentreOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprIcon, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprContainer, 0, 0)

	OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].txtLabel = CreateText("")
	SetTextSize(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].txtLabel, OryUIPaginationCollection[oryUIPaginationID].unselectedTextSize#)
	SetTextBold(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].txtLabel, OryUIPaginationCollection[oryUIPaginationID].unselectedTextBold)
	SetTextColor(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].txtLabel, OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[1], OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[2], OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[3], OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[4])
	SetTextAlignment(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].txtLabel, 1)
	SetTextDepth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].txtLabel, GetSpriteDepth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprContainer) - 1)
	OryUIPinTextToCentreOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].txtLabel, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIPaginationButtonID].sprContainer, 0, 0)

	//OryUIUpdatePaginationButton(oryUIPaginationID, oryUIPaginationButtonID + 1, oryUIWidgetParameters$)
endfunction

function OryUIInsertPaginationListener(oryUIPaginationID as integer)
	local oryUIForI as integer
	local oryUIPaginationContainerSprite as integer
	local oryUIPaginationButtonSprite as integer

	OryUIPaginationCollection[oryUIPaginationID].buttonPressed = -1
	OryUIPaginationCollection[oryUIPaginationID].buttonReleased = -1
	if (OryUIPaginationCollection[oryUIPaginationID].visible = 1)
		for oryUIForI = 0 to OryUIGetPaginationButtonCount(oryUIPaginationID) - 1
			if (GetSpriteExists(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer))
				if (OryUIGetSwipingVertically() = 0 and OryUIGetSwipingHorizontally() = 0)
					if (GetPointerPressed())
						oryUIPaginationButtonSprite = GetSpriteHitTest(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
						if (oryUIPaginationButtonSprite = 1)
							OryUIPaginationCollection[oryUIPaginationID].buttonPressed = oryUIForI + 1
							OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].pressed = 1
						endif
					else
						if (GetPointerState())
							oryUIPaginationButtonSprite = GetSpriteHitTest(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].pressed)
								if (oryUIPaginationButtonSprite = 0)
									OryUIPaginationCollection[oryUIPaginationID].buttonPressed = -1
									OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].pressed = 0
								endif
							endif
						endif
						if (GetPointerReleased())
							oryUIPaginationButtonSprite = GetSpriteHitTest(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
							if (OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].pressed)
								if (oryUIPaginationButtonSprite = 1)
									OryUIPaginationCollection[oryUIPaginationID].buttonReleased = oryUIForI + 1
									OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].released = 1
									if (OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = "<<")
										OryUIPaginationCollection[oryUIPaginationID].pageSelected = 1
									endif
									if (OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = "<")
										dec OryUIPaginationCollection[oryUIPaginationID].pageSelected
										if (OryUIPaginationCollection[oryUIPaginationID].pageSelected < 1)
											OryUIPaginationCollection[oryUIPaginationID].pageSelected = 1
										endif
									endif
									if (val(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$) > 0)
										OryUIPaginationCollection[oryUIPaginationID].pageSelected = val(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$)
									endif
									if (OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = ">")
										inc OryUIPaginationCollection[oryUIPaginationID].pageSelected
										if (OryUIPaginationCollection[oryUIPaginationID].pageSelected > OryUIPaginationCollection[oryUIPaginationID].noOfPages)
											OryUIPaginationCollection[oryUIPaginationID].pageSelected = OryUIPaginationCollection[oryUIPaginationID].noOfPages
										endif
									endif
									if (OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = ">>")
										OryUIPaginationCollection[oryUIPaginationID].pageSelected = OryUIPaginationCollection[oryUIPaginationID].noOfPages
									endif
									OryUIPaginationCollection[oryUIPaginationID].selected = oryUIForI + 1
									OryUIResizeAndPositionButtonsInPagination(oryUIPaginationID)
								endif
							endif
							OryUIPaginationCollection[oryUIPaginationID].buttonPressed = -1
							OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].pressed = 0
						endif
					endif
				else
					OryUIPaginationCollection[oryUIPaginationID].buttonPressed = -1
					OryUIPaginationCollection[oryUIPaginationID].buttonReleased = -1
					OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].pressed = 0
					OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].released = 0
				endif
			endif
		next
	endif
endfunction

function OryUIResizeAndPositionButtonsInPagination(oryUIPaginationID as integer)
	local oryUIForI as integer
	local oryUIPaginationButtonsWidth# as float
	local oryUIPaginationMax as integer
	local oryUIPaginationMin as integer
	local oryUIPaginationNumberedPageButtons as integer
	local oryUIPaginationNumberOfButtons as integer
	local oryUIPaginationX# as float
	
	oryUIPaginationX# = GetSpriteX(OryUIPaginationCollection[oryUIPaginationID].sprContainer)
	if (OryUIPaginationCollection[oryUIPaginationID].flexButtons = 1)
		if (OryUIPaginationCollection[oryUIPaginationID].buttons.length + 1 > OryUIPaginationCollection[oryUIPaginationID].maxButtonsToDisplay)
			oryUIPaginationNumberOfButtons = OryUIPaginationCollection[oryUIPaginationID].maxButtonsToDisplay
		else
			oryUIPaginationNumberOfButtons = OryUIGetPaginationButtonCount(oryUIPaginationID)
		endif
		oryUIPaginationButtonsWidth# = (GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].sprContainer) - ((OryUIPaginationCollection[oryUIPaginationID].buttonMargin# / GetDisplayAspect()) * (oryUIPaginationNumberOfButtons + 1))) / oryUIPaginationNumberOfButtons
	endif
	if (OryUIPaginationCollection[oryUIPaginationID].showSkipToEndButtons = 1)
		oryUIPaginationNumberedPageButtons = oryUIPaginationNumberOfButtons - 4
	else
		oryUIPaginationNumberedPageButtons = oryUIPaginationNumberOfButtons - 2
	endif
	oryUIPaginationMin = OryUIPaginationCollection[oryUIPaginationID].pageSelected - floor(oryUIPaginationNumberedPageButtons / 2)
	oryUIPaginationMax = OryUIPaginationCollection[oryUIPaginationID].pageSelected + floor(oryUIPaginationNumberedPageButtons / 2)
	if (oryUIPaginationMax > OryUIPaginationCollection[oryUIPaginationID].noOfPages)
		oryUIPaginationMax = OryUIPaginationCollection[oryUIPaginationID].noOfPages
		oryUIPaginationMin = oryUIPaginationMax - oryUIPaginationNumberedPageButtons + 1
	endif
	if (OryUIPaginationMin < 1)
		oryUIPaginationMin = 1
	endif
	for oryUIForI = 0 to OryUIPaginationCollection[oryUIPaginationID].buttons.length
		SetSpriteSize(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, oryUIPaginationButtonsWidth#, GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].sprContainer) - (OryUIPaginationCollection[oryUIPaginationID].buttonMargin# * 2))
		SetSpritePositionByOffset(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, oryUIPaginationX# + (oryUIForI * oryUIPaginationButtonsWidth#) + ((oryUIForI + 1) * (OryUIPaginationCollection[oryUIPaginationID].buttonMargin# / GetDisplayAspect())), GetSpriteY(OryUIPaginationCollection[oryUIPaginationID].sprContainer) + OryUIPaginationCollection[oryUIPaginationID].buttonMargin#)
		SetSpriteDepth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, GetSpriteDepth(OryUIPaginationCollection[oryUIPaginationID].sprContainer) - 1)
		if (OryUIPaginationCollection[oryUIPaginationID].noOfPages > oryUIPaginationNumberOfButtons)
			if (OryUIPaginationCollection[oryUIPaginationID].showSkipToEndButtons = 1)
				if (oryUIForI = 0)
					SetTextString(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, "<<")
					OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = "<<"
				endif
				if (oryUIForI = 1)
					SetTextString(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, "<")
					OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = "<"
				endif
				if (oryUIForI > 1 and oryUIForI < OryUIPaginationCollection[oryUIPaginationID].buttons.length - 1)
					SetTextString(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, str(oryUIPaginationMin + oryUIForI - 2))
					OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = str(oryUIPaginationMin + oryUIForI - 2)
				endif
				if (oryUIForI = OryUIPaginationCollection[oryUIPaginationID].buttons.length - 1)
					SetTextString(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, ">")
					OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = ">"
				endif
				if (oryUIForI = OryUIPaginationCollection[oryUIPaginationID].buttons.length)
					SetTextString(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, ">>")
					OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = ">>"
				endif
			else
				if (oryUIForI = 0)
					SetTextString(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, "<")
					OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = "<"
				endif
				if (oryUIForI > 0 and oryUIForI < OryUIPaginationCollection[oryUIPaginationID].buttons.length)
					SetTextString(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, str(oryUIPaginationMin + oryUIForI - 1))
					OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = str(oryUIPaginationMin + oryUIForI - 1)
				endif
				if (oryUIForI = OryUIPaginationCollection[oryUIPaginationID].buttons.length)
					SetTextString(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, ">")
					OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = ">"
				endif
			endif
		else
			SetTextString(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, str(oryUIForI + 1))
			OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = str(oryUIForI + 1)
		endif
		OryUIPinTextToCentreOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, 0, 0)
		if (val(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$) = OryUIPaginationCollection[oryUIPaginationID].pageSelected)
			SetSpriteColor(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, OryUIPaginationCollection[oryUIPaginationID].selectedColor#[1], OryUIPaginationCollection[oryUIPaginationID].selectedColor#[2], OryUIPaginationCollection[oryUIPaginationID].selectedColor#[3], OryUIPaginationCollection[oryUIPaginationID].selectedColor#[4])
			SetTextBold(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].selectedTextBold)
			SetTextColor(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].selectedTextColor#[1], OryUIPaginationCollection[oryUIPaginationID].selectedTextColor#[2], OryUIPaginationCollection[oryUIPaginationID].selectedTextColor#[3], OryUIPaginationCollection[oryUIPaginationID].selectedTextColor#[4])
			SetTextSize(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].selectedTextSize#)
			//if (OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].icon$ <> "")
			//	SetSpriteColor(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, OryUIPaginationCollection[oryUIPaginationID].selectedIconColor#[1], OryUIPaginationCollection[oryUIPaginationID].selectedIconColor#[2], OryUIPaginationCollection[oryUIPaginationID].selectedIconColor#[3], OryUIPaginationCollection[oryUIPaginationID].selectedIconColor#[4])
			//endif
		else
			SetSpriteColor(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[1], OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[2], OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[3], OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[4])
			SetTextBold(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].unselectedTextBold)
			SetTextColor(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[1], OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[2], OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[3], OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[4])
			SetTextSize(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].unselectedTextSize#)
			//if (OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].icon$ <> "")
			//	SetSpriteColor(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[1], OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[2], OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[3], OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[4])
			//endif
			if (OryUIPaginationCollection[oryUIPaginationID].noOfPages > oryUIPaginationNumberOfButtons)
				if ((oryUIForI <= 1 and OryUIPaginationCollection[oryUIPaginationID].pageSelected = 1) or (oryUIForI >= OryUIPaginationCollection[oryUIPaginationID].buttons.length - 1 and OryUIPaginationCollection[oryUIPaginationID].pageSelected = OryUIPaginationCollection[oryUIPaginationID].noOfPages))
					SetSpriteColor(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, OryUIPaginationCollection[oryUIPaginationID].inactiveColor#[1], OryUIPaginationCollection[oryUIPaginationID].inactiveColor#[2], OryUIPaginationCollection[oryUIPaginationID].inactiveColor#[3], OryUIPaginationCollection[oryUIPaginationID].inactiveColor#[4])
					SetTextBold(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].inactiveTextBold)
					SetTextColor(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].inactiveTextColor#[1], OryUIPaginationCollection[oryUIPaginationID].inactiveTextColor#[2], OryUIPaginationCollection[oryUIPaginationID].inactiveTextColor#[3], OryUIPaginationCollection[oryUIPaginationID].inactiveTextColor#[4])
					SetTextSize(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].inactiveTextSize#)
					//if (OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].icon$ <> "")
					//	SetSpriteColor(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, OryUIPaginationCollection[oryUIPaginationID].inactiveIconColor#[1], OryUIPaginationCollection[oryUIPaginationID].inactiveIconColor#[2], OryUIPaginationCollection[oryUIPaginationID].inactiveIconColor#[3], OryUIPaginationCollection[oryUIPaginationID].inactiveIconColor#[4])
					//endif
				endif
			endif
		endif
		remstart
		if (OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ <> "" and OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].icon$ = "")
			OryUIPinTextToCentreOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, 0, 0)
			OryUIPinSpriteToCentreOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, 0, 0)
			SetTextAlignment(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, 1)
			SetTextDepth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, GetSpriteDepth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer) - 1)
			SetSpriteColorAlpha(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, 0)
		elseif (OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].icon$ <> "" and OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].label$ = "")
			SetSpriteSize(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, OryUIPaginationCollection[oryUIPaginationID].iconSize#[1], OryUIPaginationCollection[oryUIPaginationID].iconSize#[2])
			SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon) / 2, GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon) / 2)
			OryUIPinSpriteToCentreOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, 0, 0)
			SetSpriteDepth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, GetSpriteDepth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer) - 1)
		endif
		remend
		remstart
		else
			SetSpriteSize(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, OryUIPaginationCollection[oryUIPaginationID].iconSize#[1], OryUIPaginationCollection[oryUIPaginationID].iconSize#[2])
			oryUIIconAndLabelWidth# = GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon) + 1 + GetTextTotalWidth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel)
			oryUIIconAndLabelOffsetX# = (GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer) - oryUIIconAndLabelWidth#) / 2
			oryUIIconAndLabelHeight# = GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon) + 1 + GetTextTotalHeight(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel)
			oryUIIconAndLabelOffsetY# = (GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer) - oryUIIconAndLabelHeight#) / 2
			if (lower(OryUIPaginationCollection[oryUIPaginationID].iconPlacement$) = "left")
				SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, 0, GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon))
				OryUIPinSpriteToCentreLeftOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, oryUIIconAndLabelOffsetX#, GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon) / 2)
				OryUIPinTextToCentreRightOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, 1, 0)
				SetTextAlignment(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, 0)
			elseif (lower(OryUIPaginationCollection[oryUIPaginationID].iconPlacement$) = "right")
				SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon), GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon))
				OryUIPinSpriteToCentreRightOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, -oryUIIconAndLabelOffsetX#, GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon) / 2)
				OryUIPinTextToCentreLeftOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, -1, 0)
				SetTextAlignment(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, 2)
			elseif (lower(OryUIPaginationCollection[oryUIPaginationID].iconPlacement$) = "top")
				SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon) / 2, 0)
				OryUIPinSpriteToTopCentreOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, 0, oryUIIconAndLabelOffsetY#)
				OryUIPinTextToBottomCentreOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, 0, 1 + GetTextTotalHeight(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel))
				SetTextAlignment(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, 1)
			elseif (lower(OryUIPaginationCollection[oryUIPaginationID].iconPlacement$) = "bottom")
				SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon) / 2, GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon))
				OryUIPinSpriteToBottomCentreOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprContainer, 0, oryUIIconAndLabelOffsetY#)
				OryUIPinTextToTopCentreOfSprite(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].sprIcon, 0, -(1 + GetTextTotalHeight(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel)))
				SetTextAlignment(OryUIPaginationCollection[oryUIPaginationID].buttons[oryUIForI].txtLabel, 1)
			endif
		endif
		remend
	next
endfunction

function OryUISetPaginationButtonCount(oryUIPaginationID as integer, oryUINewPaginationButtonCount as integer)
	local oryUIForI as integer
	local oryUIOldPaginationButtonCount as integer
	
	oryUIOldPaginationButtonCount = OryUIGetPaginationButtonCount(oryUIPaginationID) - 1
	while (OryUIGetPaginationButtonCount(oryUIPaginationID) - 1 > oryUINewPaginationButtonCount - 1)
		OryUIDeletePaginationButton(oryUIPaginationID, OryUIGetPaginationButtonCount(oryUIPaginationID) - 1)
	endwhile
	for oryUIForI = 0 to oryUINewPaginationButtonCount - 1
		if (oryUIForI > oryUIOldPaginationButtonCount)
			OryUIInsertPaginationButton(oryUIPaginationID, -1, "")
		endif
	next
endfunction

function OryUISetPaginationSelectedPage(oryUIPaginationID as integer, oryUINewPaginationValue as integer)
	OryUIPaginationCollection[oryUIPaginationID].pageSelected = oryUINewPaginationValue
	OryUIResizeAndPositionButtonsInPagination(oryUIPaginationID)
endfunction

function OryUIUpdatePagination(oryUIPaginationID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	if (GetSpriteExists(OryUIPaginationCollection[oryUIPaginationID].sprContainer))
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE WIDGET
		if (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIPaginationCollection[oryUIPaginationID].sprContainer, oryUIParameters.size#[1], oryUIParameters.size#[2])
		elseif (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUIPaginationCollection[oryUIPaginationID].sprContainer, oryUIParameters.size#[1], GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].sprContainer))
		elseif (oryUIParameters.size#[1] = -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUIPaginationCollection[oryUIPaginationID].sprContainer, GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].sprContainer), oryUIParameters.size#[2])
		endif

		if (oryUIParameters.offsetTopLeft = 1)
			SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, 0, 0)
		elseif (oryUIParameters.offsetTopCenter = 1)
			SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].sprContainer) / 2.0, 0)
		elseif (oryUIParameters.offsetTopRight = 1)
			SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].sprContainer), 0)
		elseif (oryUIParameters.offsetCenterLeft = 1)
			SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, 0, GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].sprContainer) / 2.0)
		elseif (oryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].sprContainer) / 2.0, GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].sprContainer) / 2.0)
		elseif (oryUIParameters.offsetCenterRight = 1)
			SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].sprContainer), GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].sprContainer) / 2.0)
		elseif (oryUIParameters.offsetBottomLeft = 1)
			SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, 0, GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].sprContainer))
		elseif (oryUIParameters.offsetBottomCenter = 1)
			SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].sprContainer) / 2.0, GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].sprContainer))
		elseif (oryUIParameters.offsetBottomRight = 1)
			SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, GetSpriteWidth(OryUIPaginationCollection[oryUIPaginationID].sprContainer), GetSpriteHeight(OryUIPaginationCollection[oryUIPaginationID].sprContainer))
		else
			if (oryUIParameters.offset#[1] > -999999 or oryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, oryUIParameters.offset#[1], oryUIParameters.offset#[2])
			endif
		endif
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, oryUIParameters.position#[1], GetSpriteYByOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer))
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer, GetSpriteXByOffset(OryUIPaginationCollection[oryUIPaginationID].sprContainer), oryUIParameters.position#[2])
		endif

		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.buttonMargin# > -999999)
			OryUIPaginationCollection[oryUIPaginationID].buttonMargin# = oryUIParameters.buttonMargin#
		endif
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999)
			SetSpriteColor(OryUIPaginationCollection[oryUIPaginationID].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], GetSpriteColorAlpha(OryUIPaginationCollection[oryUIPaginationID].sprContainer))
		endif
		if (oryUIParameters.color#[4] > -999999)
			SetSpriteColorAlpha(OryUIPaginationCollection[oryUIPaginationID].sprContainer, oryUIParameters.color#[4])
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUIPaginationCollection[oryUIPaginationID].sprContainer, oryUIParameters.depth)
		endif
		if (oryUIParameters.fixToScreen = 1)
			FixSpriteToScreen(OryUIPaginationCollection[oryUIPaginationID].sprContainer, 1)
		endif
		if (oryUIParameters.flexButtons > -999999)
			OryUIPaginationCollection[oryUIPaginationID].flexButtons = oryUIParameters.flexButtons
		endif
		if (oryUIParameters.iconSize#[1] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].iconSize#[1] = oryUIParameters.iconSize#[1]
		endif
		if (oryUIParameters.iconSize#[2] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].iconSize#[2] = oryUIParameters.iconSize#[2]
		endif
		if (oryUIParameters.imageID > -999999)
			SetSpriteImage(OryUIPaginationCollection[oryUIPaginationID].sprContainer, oryUIParameters.imageID)
		endif
		if (oryUIParameters.inactiveColor#[1] > -999999 or oryUIParameters.inactiveColor#[2] > -999999 or oryUIParameters.inactiveColor#[3] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].inactiveColor#[1] = oryUIParameters.inactiveColor#[1]
			OryUIPaginationCollection[oryUIPaginationID].inactiveColor#[2] = oryUIParameters.inactiveColor#[2]
			OryUIPaginationCollection[oryUIPaginationID].inactiveColor#[3] = oryUIParameters.inactiveColor#[3]
		endif
		if (oryUIParameters.inactiveColor#[4] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].inactiveColor#[4] = oryUIParameters.inactiveColor#[4]
		endif
		if (oryUIParameters.inactiveIconColor#[1] > -999999 or oryUIParameters.inactiveIconColor#[2] > -999999 or oryUIParameters.inactiveIconColor#[3] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].inactiveIconColor#[1] = oryUIParameters.inactiveIconColor#[1]
			OryUIPaginationCollection[oryUIPaginationID].inactiveIconColor#[2] = oryUIParameters.inactiveIconColor#[2]
			OryUIPaginationCollection[oryUIPaginationID].inactiveIconColor#[3] = oryUIParameters.inactiveIconColor#[3]
		endif
		if (oryUIParameters.inactiveIconColor#[4] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].inactiveIconColor#[4] = oryUIParameters.inactiveIconColor#[4]
		endif
		if (oryUIParameters.inactiveTextBold > -999999)
			OryUIPaginationCollection[oryUIPaginationID].inactiveTextBold = oryUIParameters.inactiveTextBold
		endif
		if (oryUIParameters.inactiveTextColor#[1] > -999999 or oryUIParameters.inactiveTextColor#[2] > -999999 or oryUIParameters.inactiveTextColor#[3] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].inactiveTextColor#[1] = oryUIParameters.inactiveTextColor#[1]
			OryUIPaginationCollection[oryUIPaginationID].inactiveTextColor#[2] = oryUIParameters.inactiveTextColor#[2]
			OryUIPaginationCollection[oryUIPaginationID].inactiveTextColor#[3] = oryUIParameters.inactiveTextColor#[3]
		endif
		if (oryUIParameters.inactiveTextColor#[4] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].inactiveTextColor#[4] = oryUIParameters.inactiveTextColor#[4]
		endif
		if (oryUIParameters.inactiveTextSize# > -999999)
			OryUIPaginationCollection[oryUIPaginationID].inactiveTextSize# = oryUIParameters.inactiveTextSize#
		endif
		if (oryUIParameters.maxButtonsToDisplay > -999999)
			OryUIPaginationCollection[oryUIPaginationID].maxButtonsToDisplay = oryUIParameters.maxButtonsToDisplay
			if (OryUIPaginationCollection[oryUIPaginationID].maxButtonsToDisplay < 5)
				OryUIPaginationCollection[oryUIPaginationID].showSkipToEndButtons = 0
			endif
		endif
		if (oryUIParameters.noOfPages > -999999)
			OryUIPaginationCollection[oryUIPaginationID].noOfPages = oryUIParameters.noOfPages
			if (OryUIPaginationCollection[oryUIPaginationID].noOfPages <= OryUIPaginationCollection[oryUIPaginationID].maxButtonsToDisplay)
				OryUISetPaginationButtonCount(oryUIPaginationID, OryUIPaginationCollection[oryUIPaginationID].noOfPages)
			else
				OryUISetPaginationButtonCount(oryUIPaginationID, OryUIPaginationCollection[oryUIPaginationID].maxButtonsToDisplay)
			endif
		endif
		if (oryUIParameters.selectedColor#[1] > -999999 or oryUIParameters.selectedColor#[2] > -999999 or oryUIParameters.selectedColor#[3] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].selectedColor#[1] = oryUIParameters.selectedColor#[1]
			OryUIPaginationCollection[oryUIPaginationID].selectedColor#[2] = oryUIParameters.selectedColor#[2]
			OryUIPaginationCollection[oryUIPaginationID].selectedColor#[3] = oryUIParameters.selectedColor#[3]
		endif
		if (oryUIParameters.selectedColor#[4] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].selectedColor#[4] = oryUIParameters.selectedColor#[4]
		endif
		if (oryUIParameters.selectedIconColor#[1] > -999999 or oryUIParameters.selectedIconColor#[2] > -999999 or oryUIParameters.selectedIconColor#[3] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].selectedIconColor#[1] = oryUIParameters.selectedIconColor#[1]
			OryUIPaginationCollection[oryUIPaginationID].selectedIconColor#[2] = oryUIParameters.selectedIconColor#[2]
			OryUIPaginationCollection[oryUIPaginationID].selectedIconColor#[3] = oryUIParameters.selectedIconColor#[3]
		endif
		if (oryUIParameters.selectedIconColor#[4] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].selectedIconColor#[4] = oryUIParameters.selectedIconColor#[4]
		endif
		if (oryUIParameters.selectedTextBold > -999999)
			OryUIPaginationCollection[oryUIPaginationID].selectedTextBold = oryUIParameters.selectedTextBold
		endif
		if (oryUIParameters.selectedTextColor#[1] > -999999 or oryUIParameters.selectedTextColor#[2] > -999999 or oryUIParameters.selectedTextColor#[3] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].selectedTextColor#[1] = oryUIParameters.selectedTextColor#[1]
			OryUIPaginationCollection[oryUIPaginationID].selectedTextColor#[2] = oryUIParameters.selectedTextColor#[2]
			OryUIPaginationCollection[oryUIPaginationID].selectedTextColor#[3] = oryUIParameters.selectedTextColor#[3]
		endif
		if (oryUIParameters.showSkipToEndButtons > -999999)
			if (OryUIPaginationCollection[oryUIPaginationID].maxButtonsToDisplay >= 5)
				OryUIPaginationCollection[oryUIPaginationID].showSkipToEndButtons = oryUIParameters.showSkipToEndButtons
			endif
		endif
		if (oryUIParameters.selectedTextColor#[4] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].selectedTextColor#[4] = oryUIParameters.selectedTextColor#[4]
		endif
		if (oryUIParameters.selectedTextSize# > -999999)
			OryUIPaginationCollection[oryUIPaginationID].selectedTextSize# = oryUIParameters.selectedTextSize#
		endif
		if (oryUIParameters.unselectedColor#[1] > -999999 or oryUIParameters.unselectedColor#[2] > -999999 or oryUIParameters.unselectedColor#[3] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[1] = oryUIParameters.unselectedColor#[1]
			OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[2] = oryUIParameters.unselectedColor#[2]
			OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[3] = oryUIParameters.unselectedColor#[3]
		endif
		if (oryUIParameters.unselectedColor#[4] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].unselectedColor#[4] = oryUIParameters.unselectedColor#[4]
		endif
		if (oryUIParameters.unselectedIconColor#[1] > -999999 or oryUIParameters.unselectedIconColor#[2] > -999999 or oryUIParameters.unselectedIconColor#[3] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[1] = oryUIParameters.unselectedIconColor#[1]
			OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[2] = oryUIParameters.unselectedIconColor#[2]
			OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[3] = oryUIParameters.unselectedIconColor#[3]
		endif
		if (oryUIParameters.unselectedIconColor#[4] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].unselectedIconColor#[4] = oryUIParameters.unselectedIconColor#[4]
		endif
		if (oryUIParameters.unselectedTextBold > -999999)
			OryUIPaginationCollection[oryUIPaginationID].unselectedTextBold = oryUIParameters.unselectedTextBold
		endif
		if (oryUIParameters.unselectedTextColor#[1] > -999999 or oryUIParameters.unselectedTextColor#[2] > -999999 or oryUIParameters.unselectedTextColor#[3] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[1] = oryUIParameters.unselectedTextColor#[1]
			OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[2] = oryUIParameters.unselectedTextColor#[2]
			OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[3] = oryUIParameters.unselectedTextColor#[3]
		endif
		if (oryUIParameters.unselectedTextColor#[4] > -999999)
			OryUIPaginationCollection[oryUIPaginationID].unselectedTextColor#[4] = oryUIParameters.unselectedTextColor#[4]
		endif
		if (oryUIParameters.unselectedTextSize# > -999999)
			OryUIPaginationCollection[oryUIPaginationID].unselectedTextSize# = oryUIParameters.unselectedTextSize#
		endif
	endif
	
	OryUIResizeAndPositionButtonsInPagination(oryUIPaginationID)
endfunction

foldend
