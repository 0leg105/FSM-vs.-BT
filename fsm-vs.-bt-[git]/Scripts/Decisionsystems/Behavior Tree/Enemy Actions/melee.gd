extends ActionLeaf

@export var character_body: BtNPC
@export var melee_component: MeleeComponent

func tick(actor, state_manager):
	character_body.set_current_leaf("Melee")
	state_manager.set_state("look_at", state_manager.get_state("last_seen_player_pos"))
	if state_manager.get_state("at_target"):
		melee_component.melee_player()
		return SUCCESS
	else:
		return FAILED
