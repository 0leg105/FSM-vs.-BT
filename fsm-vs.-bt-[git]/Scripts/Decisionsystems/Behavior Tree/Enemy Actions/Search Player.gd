extends ActionLeaf

@export var move_component: MoveComponent
@export var character_body: CharacterBody3D
@export var player_block_component: PlayerBlockComponent
var target_position: Vector3
const TOLERANCE: float = 1.2

func tick(actor, state_manager):
	#bt_label_info.set_current_leaf("SearchPlayer")
	target_position = player_block_component.get_player_block().get_pos()
	state_manager.update_state("look_pos", target_position)
	state_manager.update_state("next_pos", target_position)
	if character_body.global_transform.origin.distance_to(target_position) > TOLERANCE:
		move_component.go_to_position(state_manager.get_state("next_pos"))
		return RUNNING
	else:
		player_block_component.set_player_block_visited(true)
		return FAILURE
