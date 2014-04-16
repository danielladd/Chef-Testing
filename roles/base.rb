name "base"
description "A basic role applicable to all nodes"
default_attributes "ntp" => {
	'servers' => [ 
		'time.commercehub.com',
		'0.pool.ntp.org',
		'1.pool.ntp.org',
		'2.pool.ntp.org',
		'3.pool.ntp.org'
	]
}
run_list "recipe[base]"
