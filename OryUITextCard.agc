
foldstart // OryUITextCard Component (Updated 23/02/2019)

type typeOryUITextCard
	id as integer
	autoHeight as integer
	sprContainer as integer
	txtSupportingText as integer
	txtHeader as integer
endtype

global OryUITextCardCollection as typeOryUITextCard[]
OryUITextCardCollection.length = 1

function OryUICreateTextCard(oryUIComponentParameters$ as string)
	local oryUITextCardID as integer
	OryUITextCardCollection.length = OryUITextCardCollection.length + 1
	oryUITextCardID = OryUITextCardCollection.length
	OryUITextCardCollection[oryUITextCardID].id = oryUITextCardID
	
	OryUITextCardCollection[oryUITextCardID].autoHeight = 0
	
	OryUITextCardCollection[oryUITextCardID].sprContainer = CreateSprite(0)
	SetSpriteSize(OryUITextCardCollection[oryUITextCardID].sprContainer, 94, 20)
	SetSpriteColor(OryUITextCardCollection[oryUITextCardID].sprContainer, 255, 255, 255, 255)
	SetSpriteOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, 0, 0)
	SetSpritePositionByOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, 0, 0)
	
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

	if (oryUIComponentParameters$ <> "") then OryUIUpdateTextCard(oryUITextCardID, oryUIComponentParameters$)
endfunction oryUITextCardID

function OryUIDeleteTextCard(oryUITextCardID as integer)
	DeleteSprite(OryUITextCardCollection[oryUITextCardID].sprContainer)
	DeleteText(OryUITextCardCollection[oryUITextCardID].txtHeader)
	DeleteText(OryUITextCardCollection[oryUITextCardID].txtSupportingText)
endfunction

function OryUIGetTextCardHeight(oryUITextCardID as integer)
	local oryUITextCardHeight#
	if (GetSpriteExists(OryUITextCardCollection[oryUITextCardID].sprContainer))
		oryUITextCardHeight# = GetSpriteHeight(OryUITextCardCollection[oryUITextCardID].sprContainer)
	endif
endfunction oryUITextCardHeight#

function OryUIGetTextCardWidth(oryUITextCardID as integer)
	local oryUITextCardWidth#
	if (GetSpriteExists(OryUITextCardCollection[oryUITextCardID].sprContainer))
		oryUITextCardWidth# = GetSpriteWidth(OryUITextCardCollection[oryUITextCardID].sprContainer)
	endif
endfunction oryUITextCardWidth#

function OryUIGetTextCardX(oryUITextCardID as integer)
	local oryUITextCardX#
	if (GetSpriteExists(OryUITextCardCollection[oryUITextCardID].sprContainer))
		oryUITextCardX# = GetSpriteX(OryUITextCardCollection[oryUITextCardID].sprContainer)
	endif
endfunction oryUITextCardX#

function OryUIGetTextCardY(oryUITextCardID as integer)
	local oryUITextCardY#
	if (GetSpriteExists(OryUITextCardCollection[oryUITextCardID].sprContainer))
		oryUITextCardY# = GetSpriteY(OryUITextCardCollection[oryUITextCardID].sprContainer)
	endif
endfunction oryUITextCardY#

function OryUIUpdateTextCard(oryUITextCardID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (GetSpriteExists(OryUITextCardCollection[oryUITextCardID].sprContainer))
		
		// IMPORTANT PARAMETERS FIRST WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE COMPONENT
		if (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUITextCardCollection[oryUITextCardID].sprContainer, OryUIParameters.size#[1], OryUIParameters.size#[2])
		elseif (OryUIParameters.size#[1] > -999999 and OryUIParameters.size#[2] = -999999)
			SetSpriteSize(OryUITextCardCollection[oryUITextCardID].sprContainer, OryUIParameters.size#[1], GetSpriteHeight(OryUITextCardCollection[oryUITextCardID].sprContainer))
		elseif (OryUIParameters.size#[1] = -999999 and OryUIParameters.size#[2] > -999999)
			SetSpriteSize(OryUITextCardCollection[oryUITextCardID].sprContainer, GetSpriteWidth(OryUITextCardCollection[oryUITextCardID].sprContainer), OryUIParameters.size#[2])
		endif
		if (OryUIParameters.headerTextBold > -999999)
			SetTextBold(OryUITextCardCollection[oryUITextCardID].txtHeader, OryUIParameters.headerTextBold)
		endif
		if (OryUIParameters.headerTextSize# > -999999)
			SetTextSize(OryUITextCardCollection[oryUITextCardID].txtHeader, OryUIParameters.headerTextSize#)
		endif
		if (OryUIParameters.headerText$ <> "")
			SetTextString(OryUITextCardCollection[oryUITextCardID].txtHeader, OryUIWrapText(OryUIParameters.headerText$, GetTextSize(OryUITextCardCollection[oryUITextCardID].txtHeader), GetSpriteWidth(OryUITextCardCollection[oryUITextCardID].sprContainer) - 4))
		endif
		if (OryUIParameters.supportingTextBold > -999999)
			SetTextBold(OryUITextCardCollection[oryUITextCardID].txtSupportingText, OryUIParameters.supportingTextBold)
		endif
		if (OryUIParameters.supportingTextSize# > -999999)
			SetTextSize(OryUITextCardCollection[oryUITextCardID].txtSupportingText, OryUIParameters.supportingTextSize#)
		endif
		if (OryUIParameters.supportingText$ <> "")
			SetTextString(OryUITextCardCollection[oryUITextCardID].txtSupportingText, OryUIWrapText(OryUIParameters.supportingText$, GetTextSize(OryUITextCardCollection[oryUITextCardID].txtSupportingText), GetSpriteWidth(OryUITextCardCollection[oryUITextCardID].sprContainer) - 4))
		endif
		if (OryUIParameters.autoHeight > -999999)
			OryUITextCardCollection[oryUITextCardID].autoHeight = OryUIParameters.autoHeight
		endif
		if (OryUITextCardCollection[oryUITextCardID].autoHeight = 1)
			SetSpriteSize(OryUITextCardCollection[oryUITextCardID].sprContainer, GetSpriteWidth(OryUITextCardCollection[oryUITextCardID].sprContainer), 0.5 + GetTextTotalHeight(OryUITextCardCollection[oryUITextCardID].txtHeader) + 1 + GetTextTotalHeight(OryUITextCardCollection[oryUITextCardID].txtSupportingText) + 1)
		endif
		if (OryUIParameters.offsetCenter = 1)
			SetSpriteOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, GetSpriteWidth(OryUITextCardCollection[oryUITextCardID].sprContainer) / 2, GetSpriteHeight(OryUITextCardCollection[oryUITextCardID].sprContainer) / 2)
		else
			if (OryUIParameters.offset#[1] > -999999 or OryUIParameters.offset#[2] > -999999)
				SetSpriteOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, OryUIParameters.offset#[1], OryUIParameters.offset#[2])
			endif
		endif
		if (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, OryUIParameters.position#[1], OryUIParameters.position#[2])
		elseif (OryUIParameters.position#[1] > -999999 and OryUIParameters.position#[2] = -999999)
			SetSpritePositionByOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, OryUIParameters.position#[1], GetSpriteYByOffset(OryUITextCardCollection[oryUITextCardID].sprContainer))
		elseif (OryUIParameters.position#[1] = -999999 and OryUIParameters.position#[2] > -999999)
			SetSpritePositionByOffset(OryUITextCardCollection[oryUITextCardID].sprContainer, GetSpriteXByOffset(OryUITextCardCollection[oryUITextCardID].sprContainer), OryUIParameters.position#[2])
		endif

		// THE REST OF THE PARAMETERS NEXT
		if (OryUIParameters.color#[1] > -999999 or OryUIParameters.color#[2] > -999999 or OryUIParameters.color#[3] > -999999 or OryUIParameters.color#[4] > -999999)
			SetSpriteColor(OryUITextCardCollection[oryUITextCardID].sprContainer, OryUIParameters.color#[1], OryUIParameters.color#[2], OryUIParameters.color#[3], OryUIParameters.color#[4])
		endif
		if (OryUIParameters.depth > -999999)
			SetSpriteDepth(OryUITextCardCollection[oryUITextCardID].sprContainer, OryUIParameters.depth)
			SetTextDepth(OryUITextCardCollection[oryUITextCardID].txtHeader, OryUIParameters.depth - 1)
			SetTextDepth(OryUITextCardCollection[oryUITextCardID].txtSupportingText, OryUIParameters.depth - 1)
		endif
		if (OryUIParameters.fixToScreen = 1)
			FixSpriteToScreen(OryUITextCardCollection[oryUITextCardID].sprContainer, 1)
		endif
		if (OryUIParameters.headerTextAlignment > -999999)
			SetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtHeader, OryUIParameters.headerTextAlignment)
		endif
		if (GetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtHeader) = 0)
			OryUIPinTextToTopLeftOfSprite(OryUITextCardCollection[oryUITextCardID].txtHeader, OryUITextCardCollection[oryUITextCardID].sprContainer, 2, 0.5)
		elseif (GetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtHeader) = 1)
			OryUIPinTextToTopCentreOfSprite(OryUITextCardCollection[oryUITextCardID].txtHeader, OryUITextCardCollection[oryUITextCardID].sprContainer, 0, 0.5)
		elseif (GetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtHeader) = 2)
			OryUIPinTextToTopRightOfSprite(OryUITextCardCollection[oryUITextCardID].txtHeader, OryUITextCardCollection[oryUITextCardID].sprContainer, 2, 0.5)
		endif
		if (OryUIParameters.headerTextColor#[1] > -999999 or OryUIParameters.headerTextColor#[2] > -999999 or OryUIParameters.headerTextColor#[3] > -999999 or OryUIParameters.headerTextColor#[4] > -999999)
			SetTextColor(OryUITextCardCollection[oryUITextCardID].txtHeader, OryUIParameters.headerTextColor#[1], OryUIParameters.headerTextColor#[2], OryUIParameters.headerTextColor#[3], OryUIParameters.headerTextColor#[4])
		endif
		if (OryUIParameters.imageID > -999999)
			SetSpriteImage(OryUITextCardCollection[oryUITextCardID].sprContainer, OryUIParameters.imageID)
		endif
		if (OryUIParameters.supportingTextAlignment > -999999)
			SetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtSupportingText, OryUIParameters.supportingTextAlignment)
		endif
		if (GetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtSupportingText) = 0)
			OryUIPinTextToTopLeftOfSprite(OryUITextCardCollection[oryUITextCardID].txtSupportingText, OryUITextCardCollection[oryUITextCardID].sprContainer, 2, 0.5 + GetTextTotalHeight(OryUITextCardCollection[oryUITextCardID].txtHeader) + 1)
		elseif (GetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtSupportingText) = 1)
			OryUIPinTextToTopCentreOfSprite(OryUITextCardCollection[oryUITextCardID].txtSupportingText, OryUITextCardCollection[oryUITextCardID].sprContainer, 0, 0.5 + GetTextTotalHeight(OryUITextCardCollection[oryUITextCardID].txtHeader) + 1)
		elseif (GetTextAlignment(OryUITextCardCollection[oryUITextCardID].txtSupportingText) = 2)
			OryUIPinTextToTopRightOfSprite(OryUITextCardCollection[oryUITextCardID].txtSupportingText, OryUITextCardCollection[oryUITextCardID].sprContainer, 2, 0.5 + GetTextTotalHeight(OryUITextCardCollection[oryUITextCardID].txtHeader) + 1)
		endif
		if (OryUIParameters.supportingTextColor#[1] > -999999 or OryUIParameters.supportingTextColor#[2] > -999999 or OryUIParameters.supportingTextColor#[3] > -999999 or OryUIParameters.supportingTextColor#[4] > -999999)
			SetTextColor(OryUITextCardCollection[oryUITextCardID].txtSupportingText, OryUIParameters.supportingTextColor#[1], OryUIParameters.supportingTextColor#[2], OryUIParameters.supportingTextColor#[3], OryUIParameters.supportingTextColor#[4])
		endif
	endif
endfunction

foldend
