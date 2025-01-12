extends ActionLeaf

@export var character_body: BtNPC
@export var move_component: MoveComponent
@export var player_block_component: PlayerBlockComponent
var target_position: Vector2
const TOLERANCE: float = 12.0

func tick(actor, state_manager):
	character_body.set_current_leaf("SearchPlayer")
	target_position = player_block_component.get_player_block().get_pos()
	state_manager.update_state("look_at", target_position)
	state_manager.update_state("next_pos", target_position)
	if character_body.global_position.distance_to(target_position) > TOLERANCE:
		move_component.go_to_position(state_manager.get_state("next_pos"))
		return RUNNING
	else:
		player_block_component.set_player_block_visited(true)
		return FAILURE
