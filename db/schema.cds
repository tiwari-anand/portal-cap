namespace sap.capire.dev;
using { sap } from '@sap/cds/common';

entity IncidentsCodeList : sap.common.CodeList {
 key code : String(20);
 name : String;
}

entity Status: IncidentsCodeList{
    key code: String default '1';
}

entity Category: IncidentsCodeList{}

entity Priority : IncidentsCodeList {}

entity Individual: IncidentsCodeList{}


entity Incidents {
    key ID : UUID;
    title    :  String(100)   @title  : 'Title';
    description    :  String(100) @title  : 'Description';
    lti    : Boolean @title  : 'Lost time injury';
    status    : Association to Status  @title  : 'Status';
    location :  String @title  : 'Location';
    category : Association to Category  @title  : 'Category';
    priority : Association to Priority @title  : 'Priority';
    closed_on : Timestamp @title  : 'Closed on';
    assignedIndividual : Association to one Individual;
}

entity Logs{
    key ID: UUID;
    date :String(100);
    data:String(5000);
}
