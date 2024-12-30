extends State
class_name SearchPlayer

@export var move_component: MoveComponent
@export var player_block_component: PlayerBlockComponent
var target_position: Vector3
const TOLERANCE: float = 1.3

func enter():
	pass

func exit():
	pass

func update(delta:float):
	target_position = player_block_component.get_player_block().get_pos()
	state_manager.update_state("look_pos", target_position)
	state_manager.update_state("next_pos", target_position)
	if character_body.global_transform.origin.distance_to(target_position) > TOLERANCE:
		move_component.go_to_position(state_manager.get_state("next_pos"))
	else:
		player_block_component.set_player_block_visited(true)
	if state_manager.get_state("player_visible") or state_manager.get_state("player_block_visited"):
		fsm.change_state(self,"Alert")
