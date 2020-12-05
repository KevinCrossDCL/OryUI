
foldstart // OryUITextCard Widget (Updated 07/07/2020)

type typeOryUITextCard
	id as integer
	autoHeight as integer
	sprContainer as integer
	txtSupportingText as integer
	txtHeader as integer
endtype

global OryUITextCardCollection as typeOryUITextCard[]
OryUITextCardCollection.length = 1

function OryUICreateTextCard(oryUIWidgetParameters$ as string)
	local oryUITextCardID as integer
	OryUITextCardCollection.length = OryUITextCardCollection.length + 1
	oryUITextCardID = OryUITextCardCollection.length
	OryUITextCardCollection[oryUITextCardID].id = oryUITextCardID
	
	oryUICreatedWidgets.insert(OryUIAddCreatedWidget(oryUITextCardID, "TextCard"))

	OryUITextCardCollection[oryUITextCardID].autoHeight = 0
	
	OryUITextCardCollection[oryUITextCardID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUITextCardCollection[oryUITextCardID].sprContainer, 94, 20)
	SetSpriteColor(OryUITextCardCollection[oryUITextCardID].sprContainer, 255, 255, 255, 255)
	SetSpriteOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, 0, 0)
	SetSpritePhysicsOff(OryUITextCardCollection[oryUITextCardID].sprContainer)
	
	OryUITextCardCollection[oryUITextCardID].txtHeader = CreateText("")
	SetTextSize(OryUITextCardCollection[oryUITextCardID].txtHeader, 3.4)
	SetTextColor(OryUITextCardCollection[oryUITextCardID].txtHeader, 0, 0, 0, 255)
	SetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtHeader, 0)
	SetTextDepth(OryUITextCardCollection[oryUITextCardID].txtHeader, GetSpriteDepth(OryUITextCardCollection[oryUITextCardID].sprContainer) - 1)
	SetTextPosition(OryUITextCardCollection[oryUITextCardID].txtHeader, GetSpriteX(OryUITextCardCollection[oryUITextCardID].sprContainer) + 2, GetSpriteY(OryUITextCardCollection[oryUITextCardID].sprContainer) + 2)

	OryUITextCardCollection[oryUITextCardID].txtSupportingText = CreateText("")
	SetTextSize(OryUITextCardCollection[oryUITextCardID].txtSupportingText, 2.5)
	SetTextColor(OryUITextCardCollection[oryUITextCardID].txtSupportingText, 0, 0, 0, 255)
	SetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtSupportingText, 0)
	SetTextDepth(OryUITextCardCollection[oryUITextCardID].txtSupportingText, GetSpriteDepth(OryUITextCardCollection[oryUITextCardID].sprContainer) - 1)
	SetTextPosition(OryUITextCardCollection[oryUITextCardID].txtSupportingText, GetSpriteX(OryUITextCardCollection[oryUITextCardID].sprContainer) + 2, GetSpriteY(OryUITextCardCollection[oryUITextCardID].sprContainer) + 2 + GetTextTotalHeight(OryUITextCardCollection[oryUITextCardID].txtHeader) + 2)

	if (oryUIWidgetParameters$ <> "") then OryUIUpdateTextCard(oryUITextCardID, oryUIWidgetParameters$)
endfunction oryUITextCardID

function OryUIDeleteTextCard(oryUITextCardID as integer)
	DeleteSprite(OryUITextCardCollection[oryUITextCardID].sprContainer)
	DeleteText(OryUITextCardCollection[oryUITextCardID].txtHeader)
	DeleteText(OryUITextCardCollection[oryUITextCardID].txtSupportingText)
endfunction

function OryUIGetTextCardHeight(oryUITextCardID as integer)
	local oryUITextCardHeight# as float
	if (GetSpriteExists(OryUITextCardCollection[oryUITextCardID].sprContainer))
		oryUITextCardHeight# = GetSpriteHeight(OryUITextCardCollection[oryUITextCardID].sprContainer)
	endif
endfunction oryUITextCardHeight#

function OryUIGetTextCardWidth(oryUITextCardID as integer)
	local oryUITextCardWidth# as float
	if (GetSpriteExists(OryUITextCardCollection[oryUITextCardID].sprContainer))
		oryUITextCardWidth# = GetSpriteWidth(OryUITextCardCollection[oryUITextCardID].sprContainer)
	endif
endfunction oryUITextCardWidth#

function OryUIGetTextCardX(oryUITextCardID as integer)
	local oryUITextCardX# as float
	if (GetSpriteExists(OryUITextCardCollection[oryUITextCardID].sprContainer))
		oryUITextCardX# = GetSpriteX(OryUITextCardCollection[oryUITextCardID].sprContainer)
	endif
endfunction oryUITextCardX#

function OryUIGetTextCardY(oryUITextCardID as integer)
	local oryUITextCardY# as float
	if (GetSpriteExists(OryUITextCardCollection[oryUITextCardID].sprContainer))
		oryUITextCardY# = GetSpriteY(OryUITextCardCollection[oryUITextCardID].sprContainer)
	endif
endfunction oryUITextCardY#

function OryUIUpdateTextCard(oryUITextCardID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	if (GetSpriteExists(OryUITextCardCollection[oryUITextCardID].sprContainer))
		
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE WIDGET
		if (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUITextCardCollection[oryUITextCardID].sprContainer, oryUIParameters.size#[1], oryUIParameters.size#[2])
		elseif (oryUIParameters.size#[1] > -999999 and oryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUITextCardCollection[oryUITextCardID].sprContainer, oryUIParameters.size#[1], GetSpriteHeight(OryUITextCardCollection[oryUITextCardID].sprContainer))
		elseif (oryUIParameters.size#[1] = -999999 and oryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUITextCardCollection[oryUITextCardID].sprContainer, GetSpriteWidth(OryUITextCardCollection[oryUITextCardID].sprContainer), oryUIParameters.size#[2])
		endif
		if (oryUIParameters.headerTextBold > -999999)
			SetTextBold(OryUITextCardCollection[oryUITextCardID].txtHeader, oryUIParameters.headerTextBold)
		endif
		if (oryUIParameters.headerTextSize# > -999999)
			SetTextSize(OryUITextCardCollection[oryUITextCardID].txtHeader, oryUIParameters.headerTextSize#)
		endif
		if (oryUIParameters.headerText$ <> "")
			if (lower(oryUIParameters.headerText$) = "null") then oryUIParameters.headerText$ = ""
			SetTextString(OryUITextCardCollection[oryUITextCardID].txtHeader, OryUIWrapText(oryUIParameters.headerText$, GetTextSize(OryUITextCardCollection[oryUITextCardID].txtHeader), GetSpriteWidth(OryUITextCardCollection[oryUITextCardID].sprContainer) - 4))
		endif
		if (oryUIParameters.supportingTextBold > -999999)
			SetTextBold(OryUITextCardCollection[oryUITextCardID].txtSupportingText, oryUIParameters.supportingTextBold)
		endif
		if (oryUIParameters.supportingTextSize# > -999999)
			SetTextSize(OryUITextCardCollection[oryUITextCardID].txtSupportingText, oryUIParameters.supportingTextSize#)
		endif
		if (oryUIParameters.supportingText$ <> "")
			if (lower(oryUIParameters.supportingText$) = "null") then oryUIParameters.supportingText$ = ""
			SetTextString(OryUITextCardCollection[oryUITextCardID].txtSupportingText, OryUIWrapText(oryUIParameters.supportingText$, GetTextSize(OryUITextCardCollection[oryUITextCardID].txtSupportingText), GetSpriteWidth(OryUITextCardCollection[oryUITextCardID].sprContainer) - 4))
		endif
		if (oryUIParameters.autoHeight > -999999)
			OryUITextCardCollection[oryUITextCardID].autoHeight = oryUIParameters.autoHeight
		endif
		if (OryUITextCardCollection[oryUITextCardID].autoHeight = 1)
			SetSpriteSize(OryUITextCardCollection[oryUITextCardID].sprContainer, GetSpriteWidth(OryUITextCardCollection[oryUITextCardID].sprContainer), 0.5 + GetTextTotalHeight(OryUITextCardCollection[oryUITextCardID].txtHeader) + 1 + GetTextTotalHeight(OryUITextCardCollection[oryUITextCardID].txtSupportingText) + 1)
		endif
		if (oryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, GetSpriteWidth(OryUITextCardCollection[oryUITextCardID].sprContainer) / 2, GetSpriteHeight(OryUITextCardCollection[oryUITextCardID].sprContainer) / 2)
		else
			if (oryUIParameters.offset#[1] > -999999 or oryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, oryUIParameters.offset#[1], oryUIParameters.offset#[2])
			endif
		endif
		if (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, oryUIParameters.position#[1], oryUIParameters.position#[2])
		elseif (oryUIParameters.position#[1] > -999999 and oryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, oryUIParameters.position#[1], GetSpriteYByOffset(OryUITextCardCollection[oryUITextCardID].sprContainer))
		elseif (oryUIParameters.position#[1] = -999999 and oryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, GetSpriteXByOffset(OryUITextCardCollection[oryUITextCardID].sprContainer), oryUIParameters.position#[2])
		endif

		// THE REST OF THE PARAMETERS NEXT
		if (oryUIParameters.color#[1] > -999999 or oryUIParameters.color#[2] > -999999 or oryUIParameters.color#[3] > -999999 or oryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUITextCardCollection[oryUITextCardID].sprContainer, oryUIParameters.color#[1], oryUIParameters.color#[2], oryUIParameters.color#[3], oryUIParameters.color#[4])
		endif
		if (oryUIParameters.depth > -999999)
			SetSpriteDepth(OryUITextCardCollection[oryUITextCardID].sprContainer, oryUIParameters.depth)
			SetTextDepth(OryUITextCardCollection[oryUITextCardID].txtHeader, oryUIParameters.depth - 1)
			SetTextDepth(OryUITextCardCollection[oryUITextCardID].txtSupportingText, oryUIParameters.depth - 1)
		endif
		if (oryUIParameters.fixToScreen = 1)
			FixSpriteToScreen(OryUITextCardCollection[oryUITextCardID].sprContainer, 1)
		endif
		if (oryUIParameters.headerTextAlignment > -999999)
			SetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtHeader, oryUIParameters.headerTextAlignment)
		endif
		if (GetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtHeader) = 0)
			OryUIPinTextToTopLeftOfSprite(OryUITextCardCollection[oryUITextCardID].txtHeader, OryUITextCardCollection[oryUITextCardID].sprContainer, 2, 0.5)
		elseif (GetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtHeader) = 1)
			OryUIPinTextToTopCentreOfSprite(OryUITextCardCollection[oryUITextCardID].txtHeader, OryUITextCardCollection[oryUITextCardID].sprContainer, 0, 0.5)
		elseif (GetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtHeader) = 2)
			OryUIPinTextToTopRightOfSprite(OryUITextCardCollection[oryUITextCardID].txtHeader, OryUITextCardCollection[oryUITextCardID].sprContainer, 2, 0.5)
		endif
		if (oryUIParameters.headerTextColor#[1] > -999999 or oryUIParameters.headerTextColor#[2] > -999999 or oryUIParameters.headerTextColor#[3] > -999999 or oryUIParameters.headerTextColor#[4] > -999999)
			SetTextColor(OryUITextCardCollection[oryUITextCardID].txtHeader, oryUIParameters.headerTextColor#[1], oryUIParameters.headerTextColor#[2], oryUIParameters.headerTextColor#[3], oryUIParameters.headerTextColor#[4])
		endif
		if (oryUIParameters.imageID > -999999)
			SetSpriteImage(OryUITextCardCollection[oryUITextCardID].sprContainer, oryUIParameters.imageID)
		endif
		if (oryUIParameters.supportingTextAlignment > -999999)
			SetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtSupportingText, oryUIParameters.supportingTextAlignment)
		endif
		if (GetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtSupportingText) = 0)
			OryUIPinTextToTopLeftOfSprite(OryUITextCardCollection[oryUITextCardID].txtSupportingText, OryUITextCardCollection[oryUITextCardID].sprContainer, 2, 0.5 + GetTextTotalHeight(OryUITextCardCollection[oryUITextCardID].txtHeader) + 1)
		elseif (GetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtSupportingText) = 1)
			OryUIPinTextToTopCentreOfSprite(OryUITextCardCollection[oryUITextCardID].txtSupportingText, OryUITextCardCollection[oryUITextCardID].sprContainer, 0, 0.5 + GetTextTotalHeight(OryUITextCardCollection[oryUITextCardID].txtHeader) + 1)
		elseif (GetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtSupportingText) = 2)
			OryUIPinTextToTopRightOfSprite(OryUITextCardCollection[oryUITextCardID].txtSupportingText, OryUITextCardCollection[oryUITextCardID].sprContainer, 2, 0.5 + GetTextTotalHeight(OryUITextCardCollection[oryUITextCardID].txtHeader) + 1)
		endif
		if (oryUIParameters.supportingTextColor#[1] > -999999 or oryUIParameters.supportingTextColor#[2] > -999999 or oryUIParameters.supportingTextColor#[3] > -999999 or oryUIParameters.supportingTextColor#[4] > -999999)
			SetTextColor(OryUITextCardCollection[oryUITextCardID].txtSupportingText, oryUIParameters.supportingTextColor#[1], oryUIParameters.supportingTextColor#[2], oryUIParameters.supportingTextColor#[3], oryUIParameters.supportingTextColor#[4])
		endif
	endif
endfunction

foldend
