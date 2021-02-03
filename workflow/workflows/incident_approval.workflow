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
				},
				"0f3bda6e-598b-48ff-95e2-6255d26a21e3": {
					"name": "Business rule"
				},
				"3e7be7ac-fb6f-4413-bf41-09d5cda1b925": {
					"name": "setBody"
				}
			},
			"sequenceFlows": {
				"853d9fd5-0d83-46fe-9d0c-9bb2c92a9868": {
					"name": "SequenceFlow12"
				},
				"187e6dd9-fff4-4970-a1e4-5739f0fae6ae": {
					"name": "SequenceFlow13"
				},
				"4c8c9d09-86e3-4aca-a77c-f0022a235cf1": {
					"name": "SequenceFlow14"
				},
				"724082a2-73ff-4344-a80b-fd93cd857c55": {
					"name": "SequenceFlow15"
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
			"recipientUsers": "${context.response.Result[0].incidents.approver}",
			"userInterfaceParams": [],
			"id": "usertask1",
			"name": "Incident"
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
				"2216d146-6f5b-40e9-8f48-64acfa5d1315": {},
				"52fd0ba4-9a28-4280-b241-7c7aef6deea8": {},
				"c8e7246e-ec8c-4843-8f36-b67e298d6f51": {},
				"9731da38-0df4-471d-b735-2e84e9eac528": {},
				"63ba47d9-4b3b-4cb4-b63c-43278bb2483f": {},
				"cfa3173d-359a-4ece-b042-9965348e5df8": {},
				"d06ce104-5a23-461e-84f5-1ce35730d6ea": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": -37,
			"y": 111,
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
		"2216d146-6f5b-40e9-8f48-64acfa5d1315": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 292,
			"y": 97,
			"width": 100,
			"height": 60,
			"object": "95395416-6856-4862-84cd-3e1eacf4fd82"
		},
		"52fd0ba4-9a28-4280-b241-7c7aef6deea8": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "342,122 547,122",
			"sourceSymbol": "2216d146-6f5b-40e9-8f48-64acfa5d1315",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "853d9fd5-0d83-46fe-9d0c-9bb2c92a9868"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 16,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 6,
			"scripttask": 3,
			"exclusivegateway": 1
		},
		"0f3bda6e-598b-48ff-95e2-6255d26a21e3": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "getApprover",
			"path": "/v2/workingset-rule-services",
			"httpMethod": "POST",
			"requestVariable": "${context.sendBody}",
			"responseVariable": "${context.response}",
			"id": "servicetask6",
			"name": "Business rule"
		},
		"c8e7246e-ec8c-4843-8f36-b67e298d6f51": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 166,
			"y": 97,
			"width": 100,
			"height": 60,
			"object": "0f3bda6e-598b-48ff-95e2-6255d26a21e3"
		},
		"187e6dd9-fff4-4970-a1e4-5739f0fae6ae": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow13",
			"name": "SequenceFlow13",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "3e7be7ac-fb6f-4413-bf41-09d5cda1b925"
		},
		"9731da38-0df4-471d-b735-2e84e9eac528": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-21,127 102,127",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "cfa3173d-359a-4ece-b042-9965348e5df8",
			"object": "187e6dd9-fff4-4970-a1e4-5739f0fae6ae"
		},
		"4c8c9d09-86e3-4aca-a77c-f0022a235cf1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow14",
			"name": "SequenceFlow14",
			"sourceRef": "0f3bda6e-598b-48ff-95e2-6255d26a21e3",
			"targetRef": "95395416-6856-4862-84cd-3e1eacf4fd82"
		},
		"63ba47d9-4b3b-4cb4-b63c-43278bb2483f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "216,127 342,127",
			"sourceSymbol": "c8e7246e-ec8c-4843-8f36-b67e298d6f51",
			"targetSymbol": "2216d146-6f5b-40e9-8f48-64acfa5d1315",
			"object": "4c8c9d09-86e3-4aca-a77c-f0022a235cf1"
		},
		"3e7be7ac-fb6f-4413-bf41-09d5cda1b925": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/incident_approval/setBody.js",
			"id": "scripttask2",
			"name": "setBody"
		},
		"cfa3173d-359a-4ece-b042-9965348e5df8": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 52,
			"y": 97,
			"width": 100,
			"height": 60,
			"object": "3e7be7ac-fb6f-4413-bf41-09d5cda1b925"
		},
		"724082a2-73ff-4344-a80b-fd93cd857c55": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow15",
			"name": "SequenceFlow15",
			"sourceRef": "3e7be7ac-fb6f-4413-bf41-09d5cda1b925",
			"targetRef": "0f3bda6e-598b-48ff-95e2-6255d26a21e3"
		},
		"d06ce104-5a23-461e-84f5-1ce35730d6ea": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "102,127 216,127",
			"sourceSymbol": "cfa3173d-359a-4ece-b042-9965348e5df8",
			"targetSymbol": "c8e7246e-ec8c-4843-8f36-b67e298d6f51",
			"object": "724082a2-73ff-4344-a80b-fd93cd857c55"
		}
	}
}