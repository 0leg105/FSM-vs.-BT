extends ActionLeaf

@export var shoot_component: ShootComponent
@export var character_body: BtNPC

func tick(actor, state_manager):
	state_manager.set_state("look_pos", state_manager.get_state("last_seen_player_pos"))
	if state_manager.get_state("player_visible"):
		shoot_component.shoot_player()
		return SUCCESS
	else:
		return FAILED
