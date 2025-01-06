extends ActionLeaf

@export var shoot_component: ShootComponent

func tick(actor, state_manager):
	#bt_label_info.set_current_leaf("Shoot")
	state_manager.set_state("look_pos", state_manager.get_state("last_seen_player_pos"))
	if state_manager.get_state("player_visible"):
		shoot_component.shoot_player()
		return SUCCESS
	else:
		return FAILED
