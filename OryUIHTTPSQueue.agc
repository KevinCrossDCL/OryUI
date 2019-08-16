
foldstart // OryUIHTTPSQueue Component (Updated 16/08/2019)

type typeOryUIHTTPSQueue
	id as integer
	domain$ as string
	failedCount as integer
	http as integer
	items as typeOryUIHTTPSQueueItems[]
	response$ as string
	responseCode as integer
	script$ as string
	ssl as integer
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

function OryUIAddItemToHTTPSQueue(oryUIHTTPSQueueID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)
	
	if (OryUIParameters.script$ = "") then exitfunction
	
	local oryUIFoundInIndex as integer
	oryUIFoundInIndex = -1
	// Check to see if the item already exists in the queue before adding
	if (OryUIParameters.name$ <> "" and OryUIParameters.script$ <> "")
		for i = 0 to OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) - 1
			if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].name$ = OryUIParameters.name$ and OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].script$ = OryUIParameters.script$)
				oryUIFoundInIndex = i
				exit
			endif
		next
	endif
	if (OryUIParameters.addToFront = 1)
		// Item already in the first slot so do nothing
		if (oryUIFoundInIndex = 0) 
			exitfunction
		elseif (oryUIFoundInIndex > 0)
			// Move items before index backwards in the queue
			OryUIMoveItemsBackInHTTPSQueue(oryUIHTTPSQueueID, oryUIFoundInIndex)
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].failedCount = 0
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].file$ = OryUIParameters.file$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].name$ = OryUIParameters.name$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].postData$ = OryUIParameters.postData$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].script$ = OryUIParameters.script$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].sentTime# = 0
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].stickUntilComplete = OryUIParameters.stickUntilComplete
		else
			// Add a new blank item at the end of the queue
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length + 1
			oryUIHTTPSQueueItemID = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length
			// Move all items in the queue back one
			OryUIMoveItemsBackInHTTPSQueue(oryUIHTTPSQueueID, OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) - 1)
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].failedCount = 0
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].file$ = OryUIParameters.file$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].name$ = OryUIParameters.name$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].postData$ = OryUIParameters.postData$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].script$ = OryUIParameters.script$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].sentTime# = 0
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].stickUntilComplete = OryUIParameters.stickUntilComplete
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
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].file$ = OryUIParameters.file$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].name$ = OryUIParameters.name$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].postData$ = OryUIParameters.postData$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].script$ = OryUIParameters.script$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].sentTime# = 0
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[oryUIHTTPSQueueItemID].stickUntilComplete = OryUIParameters.stickUntilComplete
	endif
endfunction

function OryUICreateHTTPSQueue(oryUIComponentParameters$ as string)
	local oryUIHTTPSQueueID
	OryUIHTTPSQueueCollection.length = OryUIHTTPSQueueCollection.length + 1
	oryUIHTTPSQueueID = OryUIHTTPSQueueCollection.length
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].id = oryUIHTTPSQueueID

	// DEFAULT SETTINGS
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].ssl = 1
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].timeout = 10000
	
	if (oryUIComponentParameters$ <> "") then OryUIUpdateHTTPSQueue(oryUIHTTPSQueueID, oryUIComponentParameters$)
endfunction oryUIHTTPSQueueID

function OryUIDeleteHTTPSQueue(oryUIHTTPSQueueID as integer)
	if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http > 0)
		CloseHTTPConnection(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http)
		DeleteHTTPConnection(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http)
	endif
endfunction

function OryUIGetHTTPSQueueFailedCount(oryUIHTTPSQueueID as integer)
	
endfunction OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].failedCount

function OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID as integer)
	local oryUIHTTPSQueueItemCount
	oryUIHTTPSQueueItemCount = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length + 1
endfunction oryUIHTTPSQueueItemCount

function OryUIGetHTTPSQueueResponse(oryUIHTTPSQueueID)
	
endfunction OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].response$

function OryUIGetHTTPSQueueResponseCode(oryUIHTTPSQueueID)
	
endfunction OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].responseCode

function OryUIGetHTTPSQueueScript(oryUIHTTPSQueueID)
	
endfunction OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].script$

function OryUIInsertHTTPSQueueListener(oryUIHTTPSQueueID as integer)
	// To stop the app from crashing exit the function if domain is empty
	if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].domain$ = "") then exitfunction
	
	// Clear the response gathered on the last sync
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].response$ = ""
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].responseCode = 0
	OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].script$ = ""

	if (OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) > 0)
		if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].sentTime# = 0)
			// If not already sent to the server, close any old connections, recreate a new one, and send the data
			OryUIDeleteHTTPSQueue(oryUIHTTPSQueueID)
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http = CreateHTTPConnection()
			SetHTTPHost(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].domain$, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].ssl)
			SetHTTPTimeout(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].timeout)
			if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].file$ <> "")
				SendHTTPFile(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].script$, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].postData$, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].file$)
			else
				SendHTTPRequestASync(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].script$, OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].postData$)	
			endif
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].sentTime# = timer()
		else
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].responseCode = GetHTTPResponseReady(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http)
			if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].responseCode = -1)
				inc OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].failedCount
				// If not 'stick until complete' then increase the number of fails
				if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].stickUntilComplete = 0) then inc OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].failedCount
				// Retry while the number of fails is less than or equal to 5
				if (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].failedCount <= 5)
					OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].sentTime# = 0
				else
					OryUIMoveItemToEndOfHTTPSQueue(oryUIHTTPSQueueID, 0)
				endif
			elseif (OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].responseCode > 0)
				OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].failedCount = 0
				OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].script$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[0].script$
				OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].response$ = GetHTTPResponse(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http)
				OryUIRemoveItemFromHTTPSQueue(oryUIHTTPSQueueID, 0)
			endif
		endif
	endif
endfunction

function OryUIMoveItemsBackInHTTPSQueue(oryUIHTTPSQueueID as integer, OryUIIndex as integer)
	for i = OryUIIndex to 1 step -1
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].failedCount = 0
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].file$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i - 1].file$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].name$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i - 1].name$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].postData$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i - 1].postData$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].script$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i - 1].script$
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].sentTime# = 0
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].stickUntilComplete = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i - 1].stickUntilComplete
	next
endfunction

function OryUIMoveItemsForwardsInHTTPSQueue(oryUIHTTPSQueueID as integer, OryUIIndex as integer)
	if (OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) > 1)
		for i = oryUIIndex to OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) - 2
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].failedCount = 0
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].file$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i + 1].file$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].name$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i + 1].name$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].postData$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i + 1].postData$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].script$ = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i + 1].script$
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].sentTime# = 0
			OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].stickUntilComplete = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i + 1].stickUntilComplete
		next
	endif
endfunction

function OryUIMoveItemToEndOfHTTPSQueue(oryUIHTTPSQueueID as integer, oryUIIndex as integer)
	local oryUIHTTPSQueueFile$ as string
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
	print("connectionID: " + str(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].http))
	print("failedCount: " + str(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].failedCount))
	print("responseCode: " + str(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].responseCode))	
	if (OryUIGetHTTPSQueueItemCount(httpsQueue) > 0)
		for i = 0 to OryUIGetHTTPSQueueItemCount(httpsQueue) - 1
			print("---------- Slot " + str(i) + " ----------")
			print("failedCount: " + str(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].failedCount))
			print("file: " + OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].file$)
			print("name: " + OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].name$)
			print("postData: " + OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].postData$)
			print("script: " + OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].script$)
			print("sentTime: " + str(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].sentTime#))
			print("stickUntilComplete: " + str(OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items[i].stickUntilComplete))
		next
	else
		print("HTTPS Queue Empty")
	endif
endfunction

function OryUIRemoveItemFromHTTPSQueue(oryUIHTTPSQueueID as integer, oryUIIndex as integer)
	OryUIMoveItemsForwardsInHTTPSQueue(oryUIHTTPSQueueID, oryUIIndex)
	if (OryUIGetHTTPSQueueItemCount(oryUIHTTPSQueueID) >= 0) then OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length = OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].items.length - 1
endfunction

function OryUIUpdateHTTPSQueue(oryUIHTTPSQueueID as integer, oryUIComponentParameters$ as string)
	OryUISetParametersType(oryUIComponentParameters$)

	if (OryUIParameters.domain$ <> "")
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].domain$ = OryUIParameters.domain$
	endif
	if (OryUIParameters.ssl > -999999)
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].ssl = OryUIParameters.ssl
	endif
	if (OryUIParameters.timeout > -999999)
		OryUIHTTPSQueueCollection[oryUIHTTPSQueueID].timeout = OryUIParameters.timeout
	endif
endfunction

foldend
