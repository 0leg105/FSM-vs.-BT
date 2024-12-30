extends State
class_name MoveToCover

@export var move_component: MoveComponent
@export var cover_component: CoverComponent
var target_position: Vector3
var tolerance: float = 1

func enter():
	pass

func exit():
	pass

func update(delta: float):
	if cover_component.check_current_cover():
		target_position = cover_component.get_cover_node().get_pos()
		state_manager.update_state("look_pos", state_manager.get_state("last_seen_player_pos"))
		state_manager.update_state("next_pos", target_position)
		if character_body.global_transform.origin.distance_to(target_position) > tolerance:
			move_component.go_to_position(state_manager.get_state("next_pos"))
		else:
			cover_component.cover_node_entered()
			fsm.change_state(self,"InCoverShoot")
	else:
		fsm.change_state(self,"Alert")
