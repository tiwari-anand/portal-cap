sap.ui.define([
	"sap/ui/core/UIComponent",
	"sap/ui/Device",
	"com/sap/customui/wf/customuiwf/model/models"
], function (UIComponent, Device, models) {
	"use strict";

	return UIComponent.extend("com.sap.customui.wf.customuiwf.Component", {

		metadata: {
			manifest: "json"
		},

		/**
		 * The component is initialized by UI5 automatically during the startup of the app and calls the init method once.
		 * @public
		 * @override
		 */
		init: function () {
			// call the base component's init function
			UIComponent.prototype.init.apply(this, arguments);

			// enable routing
			this.getRouter().initialize();

			// set the device model
            this.setModel(models.createDeviceModel(), "device");
            
              // 1. Get the Task Properties
            var startupParameters = this.getComponentData().startupParameters;
            var taskModel = startupParameters.taskModel;
            var taskData = taskModel.getData();
            var taskId = taskData.InstanceID;

            // 2. Read the Task Data
            var that = this;
            
            var taskModel=new sap.ui.model.json.JSONModel({
                taskId:taskId
            });

            this.setModel(taskModel,'taskModel');
      
            var contextModel = new sap.ui.model.json.JSONModel("/bpmworkflowruntime/v1/task-instances/" + taskId + "/context");
            
            this.setModel(contextModel,'contextModel');

		}
	});
});
