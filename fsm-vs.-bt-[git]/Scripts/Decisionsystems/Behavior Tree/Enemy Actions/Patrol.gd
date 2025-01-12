extends ActionLeaf

@export var character_body: BtNPC
@export var patrol_component: PatrolComponent
@export var move_component: MoveComponent
var target_position: Vector2
const TOLERANCE: float = 12.0

func tick(actor, state_manager):
	character_body.set_current_leaf("Patrol")
	target_position = patrol_component.get_patrol_node_pos()
	state_manager.update_state("look_at", target_position)
	state_manager.update_state("next_pos", target_position)
	
	if state_manager.get_state("player_visible"):
		
		return FAILURE
	elif character_body.global_position.distance_to(target_position) > TOLERANCE:
		move_component.go_to_position(state_manager.get_state("next_pos"))
		return RUNNING
	else:
		patrol_component.set_patrol_node_entered(true)
		return SUCCESS
