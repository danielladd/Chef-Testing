name "odd_all_in_one"
description "role for all ODD services (rolodex, odd service, apartment) on one machines"
run_list *%w[
	role[base]
    role[slm_team]
	role[apartment]
	role[oddrest]
	role[rolodex]
]