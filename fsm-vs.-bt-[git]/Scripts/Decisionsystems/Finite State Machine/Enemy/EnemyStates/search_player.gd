extends State
class_name SearchPlayer

@export var move_component: MoveComponent
@export var player_block_component: PlayerBlockComponent
var target_position: Vector2
const TOLERANCE: float = 11

func enter():
	pass

func exit():
	pass

func _ready():
	color = Color("4a86e8", color_alpha)

func update(_delta:float):
	target_position = player_block_component.get_player_block().get_pos()
	state_manager.update_state("look_pos", target_position)
	if character_body.global_position.distance_to(target_position) > TOLERANCE:
		move_component.go_to_position(target_position)
	else:
		player_block_component.set_player_block_visited(true)
	if state_manager.get_state("player_visible") or state_manager.get_state("player_block_visited"):
		fsm.change_state(self,"Alert")
