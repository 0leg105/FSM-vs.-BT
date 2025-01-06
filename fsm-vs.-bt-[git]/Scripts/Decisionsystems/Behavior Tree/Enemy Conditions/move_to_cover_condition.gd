extends ConditionLeaf

@export var cover_component: CoverComponent

func tick(actor, state_manager):
	#bt_label_info.set_current_leaf("SearchCover")
	if state_manager.get_state("player_visible") and not state_manager.get_state("at_cover_node") and (cover_component.check_current_cover() or cover_component.check_for_cover_node_in_cover_manager()):
		return SUCCESS
	else:
		return FAILED
