extends ActionLeaf

@export var cover_component: CoverComponent
@export var move_component: MoveComponent
@export var character_body: CharacterBody3D
var target_position: Vector3
const TOLERANCE: float = 1.2

func tick(actor, state_manager):
	#bt_label_info.set_current_leaf("MoveToCover")
	if cover_component.check_current_cover():
		target_position = cover_component.get_cover_node().get_pos()
		state_manager.update_state("look_pos", state_manager.get_state("last_seen_player_pos"))
		state_manager.update_state("next_pos", target_position)
		if character_body.global_transform.origin.distance_to(target_position) > TOLERANCE:
			move_component.go_to_position(state_manager.get_state("next_pos"))
			return RUNNING
		else:
			cover_component.cover_node_entered()
			return SUCCESS
	else:
		return FAILED
