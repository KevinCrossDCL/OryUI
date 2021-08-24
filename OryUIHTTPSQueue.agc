
foldstart // OryUIHTTPSQueue Widget

type typeOryUIHTTPSQueue
	id as integer
	delay# as float
	domain$ as string
	failedCount as integer
	http as integer
	items as typeOryUIHTTPSQueueItems[]
	requestName$ as string
	requestResponse$ as string
	requestResponseCode as integer
	requestScript$ as string
	script$ as string
	ssl as integer
	timeLastCalled# as float
	timeout as integer
endtype

type typeOryUIHTTPSQueueItems
	failedCount as integer
	file$ as string
	name$ as string
	postData$ as string
	script$ as string
	sentTime# as float
	stickUntilComplete as integer
endtype

global OryUIHTTPSQueueCollection as typeOryUIHTTPSQueue[]
OryUIHTTPSQueueCollection.length = 1

function OryUIAddItemToHTTPSQueue(oryUIHTTPSQueueID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)
	
	if (lower(oryUIParameters.file$) = "null") then oryUIParameters.file$ = ""
	if (lower(oryUIParameters.name$) = "null") then oryUIParameters.name$ = ""
	if (lower(oryUIParameters.postData$) = "null") then oryUIParameters.postData$ = ""
	if (lower(oryUIParameters.script$) = "null") then oryUIParameters.script$ = ""
	
	if (oryUIParameters.script$ = "") then exitfunction

	local oryUIFoundInIndex as integer
	local oryUIForI as integer
	local oryUIHTTPSQueueItemID as integer
	
	oryUIFoundInIndex = -1
	// Check to see if the item already exists in the queue before adding
	if (oryUIParameters.name$ <> "" and oryUIParameters.script$ <> "")
		for oryUIForI = 0 to OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) - 1
			if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].name$ = oryUIParameters.name$ and OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].script$ = oryUIParameters.script$)
				oryUIFoundInIndex = oryUIForI
				exit
			endif
		next
	endif
	if (oryUIParameters.addToFront = 1)
		// Item already in the first slot so do nothing
		if (oryUIFoundInIndex = 0) 
			exitfunction
		elseif (oryUIFoundInIndex > 0)
			// Move items before index backwards in the queue
			OryUIMoveItemsBackInHTTPSQueue(oryUIHTTPSQueueID, oryUIFoundInIndex)
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].failedCount = 0
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].file$ = oryUIParameters.file$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].name$ = oryUIParameters.name$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].postData$ = oryUIParameters.postData$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].script$ = oryUIParameters.script$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].sentTime# = 0
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].stickUntilComplete = oryUIParameters.stickUntilComplete
		else
			// Add a new blank item at the end of the queue
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length + 1
			oryUIHTTPSQueueItemID = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length
			// Move all items in the queue back one
			OryUIMoveItemsBackInHTTPSQueue(oryUIHTTPSQueueID, OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) - 1)
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].failedCount = 0
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].file$ = oryUIParameters.file$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].name$ = oryUIParameters.name$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].postData$ = oryUIParameters.postData$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].script$ = oryUIParameters.script$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].sentTime# = 0
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].stickUntilComplete = oryUIParameters.stickUntilComplete
		endif
	else
		if (oryUIFoundInIndex >= 0)
			// Move all items after index forwards in the queue
			OryUIMoveItemToEndOfHTTPSQueue(oryUIHTTPSQueueID, oryUIFoundInIndex)
		else
			// Add a new blank item at the end of the queue
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length + 1
			oryUIHTTPSQueueItemID = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length
		endif
		oryUIHTTPSQueueItemID = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].failedCount = 0
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].file$ = oryUIParameters.file$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].name$ = oryUIParameters.name$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].postData$ = oryUIParameters.postData$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].script$ = oryUIParameters.script$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].sentTime# = 0
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].stickUntilComplete = oryUIParameters.stickUntilComplete
	endif
endfunction

function OryUIClearHTTPSQueue(oryUIHTTPSQueueID as integer)
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].failedCount = 0
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestName$ = ""
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestResponse$ = ""
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestResponseCode = 0
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestScript$ = ""
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length = -1
endfunction

function OryUICreateHTTPSQueue(oryUIWidgetParameters$ as string)
	local oryUIHTTPSQueueID as integer
	OryUIHTTPSQueueCollection.length = OryUIHTTPSQueueCollection.length + 1
	oryUIHTTPSQueueID = OryUIHTTPSQueueCollection.length
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].id = oryUIHTTPSQueueID

	// DEFAULT SETTINGS
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].delay# = 0.1
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].ssl = 1
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].timeout = 10000
	
	if (oryUIWidgetParameters$ <> "") then OryUIUpdateHTTPSQueue(oryUIHTTPSQueueID, oryUIWidgetParameters$)
endfunction oryUIHTTPSQueueID

function OryUIDeleteHTTPSQueue(oryUIHTTPSQueueID as integer)
	if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http > 0)
		OryUIClearHTTPSQueue(oryUIHTTPSQueueID)
		CloseHTTPConnection(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http)
		DeleteHTTPConnection(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http)
	endif
endfunction

function OryUIFindNameInHTTPSQueue(oryUIHTTPSQueueID as integer, oryUIHTTPSName$ as string)
	local oryUIForI as integer
	local oryUIIndexNameFound as integer
	for oryUIForI = 0 to OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) - 1
		if (lower(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].name$) = lower(oryUIHTTPSName$))
			oryUIIndexNameFound = oryUIForI + 1
			exit
		endif
	next
endfunction oryUIIndexNameFound

function OryUIFindScriptInHTTPSQueue(oryUIHTTPSQueueID as integer, oryUIHTTPSScript$ as string)
	local oryUIForI as integer
	local oryUIIndexScriptFound as integer
	for oryUIForI = 0 to OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) - 1
		if (lower(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].script$) = lower(oryUIHTTPSScript$))
			oryUIIndexScriptFound = oryUIForI + 1
			exit
		endif
	next
endfunction oryUIIndexScriptFound

function OryUIGetHTTPSQueueFailedCount(oryUIHTTPSQueueID as integer)
	
endfunction OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].failedCount

function OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID as integer)
	local oryUIHTTPSQueueItemCount as integer
	oryUIHTTPSQueueItemCount = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length + 1
endfunction oryUIHTTPSQueueItemCount

function OryUIGetHTTPSQueueRequestName(oryUIHTTPSQueueID)
	
endfunction OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestName$

function OryUIGetHTTPSQueueRequestResponse(oryUIHTTPSQueueID)
	
endfunction OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestResponse$

function OryUIGetHTTPSQueueRequestResponseCode(oryUIHTTPSQueueID)
	
endfunction OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestResponseCode

function OryUIGetHTTPSQueueRequestScript(oryUIHTTPSQueueID)

endfunction OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestScript$

function OryUIInsertHTTPSQueueListener(oryUIHTTPSQueueID as integer)
	// To stop the app from crashing exit the function if domain is empty
	if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].domain$ = "") then exitfunction
	
	local oryUIHTTPResponseCode as integer
	
	// Clear the response gathered on the last frame/sync
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestName$ = ""
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestResponse$ = ""
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestResponseCode = 0
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestScript$ = ""

	if (timer() - OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].timeLastCalled# > OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].delay# or OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].timeLastCalled# > timer())
		// Once the queue is empty close and delete the connection
		if (OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) = 0)
			if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http > 0)
				CloseHTTPConnection(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http)
				DeleteHTTPConnection(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http)
				OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http = 0
			endif
		endif
		if (OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) > 0)
			if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].sentTime# = 0)
				if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http = 0)
					OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http = CreateHTTPConnection()
					SetHTTPHost(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].domain$, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].ssl)
					SetHTTPTimeout(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].timeout)
				endif
				oryUIHTTPResponseCode = GetHTTPResponseReady(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http)
				if (oryUIHTTPResponseCode <> 0)
					if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].file$ <> "")
						SendHTTPFile(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].script$, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].postData$, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].file$)
					else
						SendHTTPRequestASync(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].script$, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].postData$)	
					endif
					OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].sentTime# = timer()
				endif
			else
				oryUIHTTPResponseCode = GetHTTPResponseReady(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http)
				if (oryUIHTTPResponseCode = -1)
					inc OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].failedCount
					// If not 'stick until complete' then increase the number of fails
					if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].stickUntilComplete = 0) then inc OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].failedCount
					// Retry while the number of fails is less than or equal to 5
					if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].failedCount <= 5)
						OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].sentTime# = 0
					else
						OryUIMoveItemToEndOfHTTPSQueue(oryUIHTTPSQueueID, 0)
					endif
				elseif (oryUIHTTPResponseCode > 0 and GetHTTPStatusCode(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http) = 200)
					OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].failedCount = 0
					OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestName$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].name$
					OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestResponse$ = GetHTTPResponse(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http)
					OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestResponseCode = oryUIHTTPResponseCode
					OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestScript$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].script$
					OryUIRemoveItemFromHTTPSQueue(oryUIHTTPSQueueID, 0)
				endif
			endif
		endif
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].timeLastCalled# = timer()
	endif
endfunction

function OryUIIsNameInHTTPSQueue(oryUIHTTPSQueueID as integer, oryUIHTTPSName$ as string)
	local oryUIForI as integer
	local oryUINameIsInQueue as integer
	
	for oryUIForI = 0 to OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) - 1
		if (lower(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].name$) = lower(oryUIHTTPSName$))
			oryUINameIsInQueue = 1
			exit
		endif
	next
endfunction oryUINameIsInQueue

function OryUIIsScriptInHTTPSQueue(oryUIHTTPSQueueID as integer, oryUIHTTPSScript$ as string)
	local oryUIForI as integer
	local oryUIScriptIsInQueue as integer
	
	for oryUIForI = 0 to OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) - 1
		if (lower(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].script$) = lower(oryUIHTTPSScript$))
			oryUIScriptIsInQueue = 1
			exit
		endif
	next
endfunction oryUIScriptIsInQueue

function OryUIMoveItemsBackInHTTPSQueue(oryUIHTTPSQueueID as integer, OryUIIndex as integer)
	local oryUIForI as integer
	
	for oryUIForI = OryUIIndex to 1 step -1
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].failedCount = 0
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].file$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI - 1].file$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].name$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI - 1].name$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].postData$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI - 1].postData$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].script$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI - 1].script$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].sentTime# = 0
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].stickUntilComplete = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI - 1].stickUntilComplete
	next
endfunction

function OryUIMoveItemsForwardsInHTTPSQueue(oryUIHTTPSQueueID as integer, OryUIIndex as integer)
	local oryUIForI as integer
	
	if (OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) > 1)
		for oryUIForI = oryUIIndex to OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) - 2
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].failedCount = 0
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].file$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI + 1].file$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].name$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI + 1].name$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].postData$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI + 1].postData$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].script$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI + 1].script$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].sentTime# = 0
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].stickUntilComplete = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI + 1].stickUntilComplete
		next
	endif
endfunction

function OryUIMoveItemToEndOfHTTPSQueue(oryUIHTTPSQueueID as integer, oryUIIndex as integer)
	local oryUIHTTPSQueueFile$ as string
	local oryUIHTTPSQueueItemID as integer
	local oryUIHTTPSQueueName$ as string
	local oryUIHTTPSQueuePostData$ as string
	local oryUIHTTPSQueueScript$ as string
	local oryUIHTTPSQueueStickUntilComplete as integer

	// Temporarily save the data from the item that needs to be move to the end
	oryUIHTTPSQueueFile$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIIndex].file$
	oryUIHTTPSQueueName$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIIndex].name$
	oryUIHTTPSQueuePostData$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIIndex].postData$
	oryUIHTTPSQueueScript$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIIndex].script$
	oryUIHTTPSQueueStickUntilComplete = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIIndex].stickUntilComplete

	// Move all items after index forward one
	OryUIMoveItemsForwardsInHTTPSQueue(oryUIHTTPSQueueID, oryUIIndex)
	
	// Set the last item in the queue with the temporary data saved above
	oryUIHTTPSQueueItemID = OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) - 1
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].failedCount = 0
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].file$ = oryUIHTTPSQueueFile$
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].name$ = oryUIHTTPSQueueName$
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].postData$ = oryUIHTTPSQueuePostData$
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].script$ = oryUIHTTPSQueueScript$
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].sentTime# = 0
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].stickUntilComplete = oryUIHTTPSQueueStickUntilComplete
endfunction

function OryUIPrintHTTPSQueue(oryUIHTTPSQueueID as integer)
	local oryUIForI as integer
	
	print("connectionID: " + str(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http))
	print("failedCount: " + str(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].failedCount))
	print("responseCode: " + str(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].requestResponseCode))	
	if (OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) > 0)
		print("HTTPS Queue Count: " + str(OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID)))
		for oryUIForI = 0 to OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) - 1
			print("---------- Slot " + str(oryUIForI) + " ----------")
			print("failedCount: " + str(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].failedCount))
			print("file: " + OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].file$)
			print("name: " + OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].name$)
			print("postData: " + OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].postData$)
			print("script: " + OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].script$)
			print("sentTime: " + str(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].sentTime#))
			print("stickUntilComplete: " + str(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIForI].stickUntilComplete))
		next
	else
		print("HTTPS Queue Empty")
	endif
endfunction

function OryUIRemoveItemFromHTTPSQueue(oryUIHTTPSQueueID as integer, oryUIIndex as integer)
	OryUIMoveItemsForwardsInHTTPSQueue(oryUIHTTPSQueueID, oryUIIndex)
	if (OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) >= 0) then OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length - 1
endfunction

function OryUIResetHTTPSQueueFailedCount(oryUIHTTPSQueueID as integer)
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].failedCount = 0
endfunction

function OryUIUpdateHTTPSQueue(oryUIHTTPSQueueID as integer, oryUIWidgetParameters$ as string)
	OryUISetParametersType(oryUIWidgetParameters$)

	if (oryUIParameters.delay# > -999999)
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].delay# = oryUIParameters.delay#
	endif
	if (oryUIParameters.domain$ <> "")
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].domain$ = oryUIParameters.domain$
	endif
	if (oryUIParameters.ssl > -999999)
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].ssl = oryUIParameters.ssl
	endif
	if (oryUIParameters.timeout > -999999)
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].timeout = oryUIParameters.timeout
	endif
endfunction

foldend
