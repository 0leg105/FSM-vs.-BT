extends ActionLeaf

@export var shoot_component: ShootComponent

func tick(actor, state_manager):
	#bt_label_info.set_current_leaf("Reload")
	state_manager.set_state("look_pos", state_manager.get_state("last_seen_player_pos"))
	if !state_manager.get_state("bullets"):
		shoot_component.reload_gun()
		if state_manager.get_state("bullets"):
			return SUCCESS
		else:
			return RUNNING
	else:
		return SUCCESS
