{
	"contents": {
		"2bbf8fdc-c5df-413e-9c98-c7ec0167a928": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "incident_approval",
			"subject": "Incident ${context.title}",
			"name": "incident_approval",
			"documentation": "",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"95395416-6856-4862-84cd-3e1eacf4fd82": {
					"name": "Incident"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"853d9fd5-0d83-46fe-9d0c-9bb2c92a9868": {
					"name": "SequenceFlow12"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"95395416-6856-4862-84cd-3e1eacf4fd82": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "${context.description}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://comsapcustomuiwfcustomuiwf/com.sap.customui.wf.customuiwf",
			"recipientUsers": "${context.users}",
			"userInterfaceParams": [],
			"id": "usertask1",
			"name": "Incident"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "95395416-6856-4862-84cd-3e1eacf4fd82"
		},
		"853d9fd5-0d83-46fe-9d0c-9bb2c92a9868": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow12",
			"name": "SequenceFlow12",
			"sourceRef": "95395416-6856-4862-84cd-3e1eacf4fd82",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"2216d146-6f5b-40e9-8f48-64acfa5d1315": {},
				"52fd0ba4-9a28-4280-b241-7c7aef6deea8": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 243,
			"y": 109,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 530,
			"y": 109,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "259,126 403,126",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "2216d146-6f5b-40e9-8f48-64acfa5d1315",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"2216d146-6f5b-40e9-8f48-64acfa5d1315": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 353,
			"y": 97,
			"width": 100,
			"height": 60,
			"object": "95395416-6856-4862-84cd-3e1eacf4fd82"
		},
		"52fd0ba4-9a28-4280-b241-7c7aef6deea8": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "403,122 547,122",
			"sourceSymbol": "2216d146-6f5b-40e9-8f48-64acfa5d1315",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "853d9fd5-0d83-46fe-9d0c-9bb2c92a9868"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 12,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 4,
			"scripttask": 1,
			"exclusivegateway": 1
		}
	}
}