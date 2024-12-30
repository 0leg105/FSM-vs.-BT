extends State
class_name FSMPatrol

@export var patrol_component: PatrolComponent
@export var move_component: MoveComponent
var target_position: Vector3
var tolerance: float = 1.2

func enter():
	pass

func exit():
	patrol_component.set_initialized(false)

func update(_delta: float):
	target_position = patrol_component.get_patrol_node_pos()
	state_manager.update_state("look_pos", target_position)
	state_manager.update_state("next_pos", target_position)
	if character_body.global_transform.origin.distance_to(target_position) > tolerance:
		move_component.go_to_position(state_manager.get_state("next_pos"))
	else:
		patrol_component.set_patrol_node_entered(true)
		state_manager.update_state("next_pos", patrol_component.get_patrol_node_pos())
	if state_manager.get_state("player_visible"):
		fsm.change_state(self, "Alert")
