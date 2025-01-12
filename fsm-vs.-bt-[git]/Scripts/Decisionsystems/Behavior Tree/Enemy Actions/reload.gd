extends ActionLeaf

@export var shoot_component: ShootComponent
@export var character_body: BtNPC

func tick(actor, state_manager):
	character_body.set_current_leaf("PlayerInScope")
	state_manager.set_state("look_at", state_manager.get_state("last_seen_player_pos"))
	if !state_manager.get_state("bullets"):
		shoot_component.reload_gun()
		if state_manager.get_state("bullets"):
			return SUCCESS
		else:
			return RUNNING
	else:
		return SUCCESS
