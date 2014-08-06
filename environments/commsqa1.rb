name "commsqa1"
description "Comms QA Environment 1"

default_attributes(
	:sftp => {
		:db => {
			:server => "SQLVM82",
			:name => "qaftg02_sftp",
			:userName => "regusr01",
			:pass => "usrreg"
		} 
	},
	:hub => {
		:db => {
			:server => "SQLVM82",
			:name => "qaftg02",
			:userName => "regusr01",
			:pass => "usrreg"
		}
	},
	:vltrader => {
		:db => {
			:server => "SQLVM82",
			:name => "qaftg02_ftg_vlt",
			:userName => "regusr01",
			:pass => "usrreg"
		}
	},
	:pathfinder => {
		:db => {
			:server => "SQLVM82",
			:name => "qaftg02_pathfinder",
			:userName => "regusr01",
			:pass => "usrreg"
		}
	})

