namespace sap.capire.dev;
using { sap } from '@sap/cds/common';

entity IncidentsCodeList : sap.common.CodeList {
 key code : String;
 name : String;
}

entity Status: IncidentsCodeList{
    key code: String default 'OPEN';
}

entity Category: IncidentsCodeList{}

entity Priority : IncidentsCodeList {}

entity Individual: IncidentsCodeList{}

entity Service: IncidentsCodeList{}

entity Performance: IncidentsCodeList{}

entity ResolutionTime: IncidentsCodeList{}


entity Incidents {
    key ID : UUID;
    title    :  String(100)   @title  : 'Title';
    description    :  String(100) @title  : 'Description';
    reporterMail  : String(100)                @title : 'Reporter EmailId';
    //name      : String(100)                @title : 'Name';
    lti    : Boolean @title  : 'Lost time injury' default false;
    status    : Association to Status  @title  : 'Status';
    location :  String @title  : 'Location';
    category : Association to Category  @title  : 'Category';
    priority : Association to Priority @title  : 'Priority';
    closed_on : String @title  : 'Closed on';
    open_on : String @title  : 'Open on';
    assignedIndividual : Association to one Individual;
}

entity Feedback {
    key ID : String(100);
    emailId    :  String(100)   @title  : 'Email ID';
    service : Association to Service  @title  : 'Service';
    resolution_time : Association to ResolutionTime @title  : 'Incident Resolution Time';
    performance : Association to  Performance @title : 'Performance';
    service_rating : Integer @title  : 'Service Rating';
    ui_rating : Integer @title  : 'Portal Rating';
    comments: String(5000) @title : 'Comments';
}

entity Logs{
    key ID: UUID;
    date :String(100);
    data:String(5000);
}
