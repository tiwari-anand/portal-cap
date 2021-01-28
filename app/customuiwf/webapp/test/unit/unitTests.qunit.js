/* global QUnit */
QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function () {
	"use strict";

	sap.ui.require([
		"com/sap/customui/wf/customuiwf/test/unit/AllTests"
	], function () {
		QUnit.start();
	});
});
