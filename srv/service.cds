using { sap.capire.dev as db } from '../db/schema';

service LowCodeService @(requires:'admin') {
    entity Incidents as projection on db.Incidents;
    entity Status as projection on db.Status;
    entity Category as projection on db.Category;
    entity Priority as projection on db.Priority;
    entity Individual as projection on db.Individual;
    entity Logs as projection on db.Logs;
}

annotate LowCodeService.Incidents with @(
UI: {
HeaderInfo: {
TypeName: 'Incident',
TypeNamePlural: 'Incidents',
Title: { Value: title },
Description: { Value: description }
},
SelectionFields: [ ID, description, lti,status_code, location,category_code,priority_code],
LineItem: [
// { Value: ID },
// { Value: title },
{ Value: description },
{ Value: assignedIndividual.name, Label:'Assigned Individual' },
{ Value: status.name ,Label:'Status'},
{ Value: location },
{ Value: category.name, Label:'Category' }
],
Facets: [
{
$Type: 'UI.CollectionFacet',
Label: 'Incident Info',
Facets: [
{$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Details'}
]
}
],
FieldGroup#Main: {
Data: [
{ Value: ID },
{ Value: title },
{ Value: description },
{ Value: lti },
{ Value: status_code , Label:'Status'},
{ Value: location },
{ Value: category_code, Label:'Category' },
{ Value: closed_on  },
{ Value: priority_code, Label:'Priority'},
{ Value: assignedIndividual_code ,Label:'Assigned Individual'}
]
}
}
);

annotate LowCodeService.Incidents with {
 status @Common : {
 Text : status.name,
 TextArrangement : #TextOnly,
 ValueListWithFixedValues
 };
 category @Common : {
 Text : category.name,
 TextArrangement : #TextOnly,
 ValueListWithFixedValues
 }; 
 priority @Common : {
 Text : priority.name,
 TextArrangement : #TextOnly,
 ValueListWithFixedValues
 };
 assignedIndividual @Common : {
 Text : assignedIndividual.name,
 TextArrangement : #TextOnly,
 ValueListWithFixedValues
 };
};


annotate LowCodeService.Priority with {
 code @UI.Hidden @Common : { 
 Text : name,
 TextArrangement : #TextOnly
 };
 name @title : 'Priority';
};

annotate LowCodeService.Status with {
 code @UI.Hidden @Common : { 
 Text : name,
 TextArrangement : #TextOnly
 };
 name @title : 'Status';
};

annotate LowCodeService.Category with {
 code @UI.Hidden @Common : { 
 Text : name,
 TextArrangement : #TextOnly
 };
 name @title : 'Category';
};

annotate LowCodeService.Individual with {
 code @UI.Hidden @Common : { 
 Text : name,
 TextArrangement : #TextOnly
 };
 name @title : 'Individual';
};


annotate LowCodeService.Incidents with @odata.draft.enabled;
annotate LowCodeService.Incidents with @Capabilities.InsertRestrictions.Insertable: true;
annotate LowCodeService.Incidents with @cds.odata.valuelist;