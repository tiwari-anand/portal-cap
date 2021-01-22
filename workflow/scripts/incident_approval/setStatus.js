/*
// read from existing workflow context 
var productInfo = $.context.productInfo; 
var productName = productInfo.productName; 
var productDescription = productInfo.productDescription;

// read contextual information
var taskDefinitionId = $.info.taskDefinitionId;

// read user task information
var lastUserTask1 = $.usertasks.usertask1.last;
var userTaskSubject = lastUserTask1.subject;
var userTaskProcessor = lastUserTask1.processor;
var userTaskCompletedAt = lastUserTask1.completedAt;

var userTaskStatusMessage = " User task '" + userTaskSubject + "' has been completed by " + userTaskProcessor + " at " + userTaskCompletedAt;

// create new node 'product'
var product = {
		productDetails: productName  + " " + productDescription,
		workflowStep: taskDefinitionId
};

// write 'product' node to workflow context
$.context.product = product;
*/



$.context.request={"status_code":"2"};
$.context.draftEnabled = "/v2/low-code/Incidents_draftEdit?PreserveChanges=true&ID=guid'"+$.context.ID+"'&IsActiveEntity=true";
$.context.IncidentsDraftPatch = "/v2/low-code/Incidents(ID=guid'"+$.context.ID+"',IsActiveEntity=false)";
$.context.IncidentDraftPrepare = "/v2/low-code/Incidents_draftPrepare?ID=guid'"+$.context.ID+"'&IsActiveEntity=false";
$.context.IncidentsDraftUpdate = "/v2/low-code/Incidents_draftActivate?ID=guid'"+$.context.ID+"'&IsActiveEntity=false";