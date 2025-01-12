extends ConditionLeaf

@export var vision_component: VisionComponent
@export var character_body: BtNPC

func tick(actor, state_manager):
	character_body.set_current_leaf("SearchPlayer")
	
	if state_manager.get_state("player_block_visited") or state_manager.get_state("player_visble"):
		return FAILED
	else:
		return SUCCESS
