sap.ui.define([
    "sap/ui/core/mvc/Controller"
],
	/**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller) {
        "use strict";

        return Controller.extend("com.sap.customui.wf.customuiwf.controller.View1", {
            onInit: function () {

            },
            onAfterRendering: function () {
                console.log(this.getOwnerComponent().getModel("contextModel"));
            },

            accept: function () {
                var token;
                var that = this;
                var id = this.getOwnerComponent().getModel("contextModel").getData().ID;
                var draftEdit = "/v2/low-code/Incidents_draftEdit?PreserveChanges=true&ID=guid'" + id + "'&IsActiveEntity=true";
                var draftPatch = "/v2/low-code/Incidents(ID=guid'" + id + "',IsActiveEntity=false)";

                var dratePrepare = "/v2/low-code/Incidents_draftPrepare?ID=guid'" + id + "'&IsActiveEntity=false";

                var draftActivate = "/v2/low-code/Incidents_draftActivate?ID=guid'" + id + "'&IsActiveEntity=false";
                
                var url ="/v2/low-code/";
                var token = that._fetchToken(url);
                this.callPost(id, draftEdit,token);

                var today = new Date();
                var date = today.toISOString().slice(0, 10);
                //var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
                //var time = String(today.getHours()).padStart(2,'0') + ":" + String(today.getMinutes()).padStart(2,'0') + ":" + String(today.getSeconds()).padStart(2,'0');
                //var dateTime = date+'T'+time+'.00Z';
                console.log(date);

                that.callPostBody(id, draftPatch, { "status_code":"RESOLVED", "closed_on":date},token);
                that.callPost(id, dratePrepare,token);
                that.callPost(id, draftActivate, token);

                url = "/bpmworkflowruntime/v1/xsrf-token";
                token = that._fetchToken(url);
                jQuery.ajax({
                    url: "/bpmworkflowruntime/v1/task-instances/" + that.getOwnerComponent().getModel("taskModel").getData().taskId,
                    method: "PATCH",
                    contentType: "application/json",
                    async: false,
                    data: "{\"status\": \"COMPLETED\", \"context\": {\"approved\":\"" + "Yes" + "\"}}",
                    headers: {
                        "X-CSRF-Token": token
                    }
                });

            },

            callPost: function (id, url,token) {
                // @ts-ignore
                return new Promise(function (resolve, reject) {
                    // @ts-ignore
                    jQuery.ajax({
                        "url": url,
                        "headers": {
                            "content-type": "application/json",
                            "X-CSRF-Token": token
                        },
                        "type": "POST",
                        async: false,
                        success: function (r) {
                            console.log(r);

                        }, error: function (e) {
                            console.log(e);
                        }
                    });
                });
            },

            callPostBody: function (id, url, body,token) {
                // @ts-ignore
                return new Promise(function (resolve, reject) {
                    console.log("Body is ",body);
                    // @ts-ignore
                    jQuery.ajax({
                        "url": url,
                        "data": JSON.stringify(body),
                        "datatype": JSON,
                        "headers": {
                            "content-type": "application/json",
                            "X-CSRF-Token": token
                        },
                        "type": "PATCH",
                        async: false,
                        success: function (r) {
                            console.log(r);

                        }, error: function (e) {
                            console.log(e);
                        }
                    });
                });
            },

            _fetchToken: function (url) {
                var token;
                jQuery.ajax({
                    url: url,
                    method: "GET",
                    async: false,
                    headers: {
                        "X-CSRF-Token": "Fetch"
                    },
                    success: function (result, xhr, data) {
                        token = data.getResponseHeader("X-CSRF-Token");
                    }
                });
                return token;
            }

        });
    });
