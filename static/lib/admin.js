'use strict';

define('admin/plugins/composer-sejul', ['settings', 'alerts'], function (Settings, alerts) {
	var ACP = {};

	ACP.init = function () {
		Settings.load('composer-sejul', $('.composer-sejul-settings'));

		$('#save').on('click', function () {
			Settings.save('composer-sejul', $('.composer-sejul-settings'), function () {
				alerts.alert({
					type: 'success',
					alert_id: 'composer-sejul-saved',
					title: 'Settings Saved',
					message: 'Please reload your NodeBB to apply these settings',
					clickfn: function () {
						socket.emit('admin.reload');
					},
				});
			});
		});
	};

	return ACP;
});
