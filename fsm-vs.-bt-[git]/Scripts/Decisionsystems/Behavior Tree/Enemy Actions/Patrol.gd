extends ActionLeaf

@export var character_body: CharacterBody3D
@export var patrol_component: PatrolComponent
@export var move_component: MoveComponent
var target_position: Vector3
const TOLERANCE: float = 1.2

func tick(actor, state_manager):
	#bt_label_info.set_current_leaf("Patrol")
	target_position = patrol_component.get_patrol_node_pos()
	state_manager.update_state("look_pos", target_position)
	state_manager.update_state("next_pos", target_position)
	if state_manager.get_state("player_visible"):
		return FAILURE
	elif character_body.global_transform.origin.distance_to(target_position) > TOLERANCE:
		move_component.go_to_position(state_manager.get_state("next_pos"))
		return RUNNING
	else:
		patrol_component.set_patrol_node_entered(true)
		return SUCCESS
