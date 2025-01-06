extends ConditionLeaf


func tick(actor, state_manager):
	#bt_label_info.set_current_leaf("SearchPlayerCondition")
	if state_manager.get_state("player_block_visited") or state_manager.get_state("player_visble"):
		return FAILED
	else:
		return SUCCESS
