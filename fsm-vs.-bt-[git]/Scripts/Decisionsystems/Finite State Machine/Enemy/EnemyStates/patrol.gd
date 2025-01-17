extends State
class_name FSMPatrol

@export var patrol_component: PatrolComponent
@export var move_component: MoveComponent
var target_position: Vector2
const TOLERANCE: float = 11

func enter():
	pass

func exit():
	patrol_component.set_initialized(false)

func _ready():
	color = Color("45818e", color_alpha)

func update(_delta: float):
	target_position = patrol_component.get_patrol_node_pos()
	state_manager.update_state("look_at", target_position)
	if character_body.global_position.distance_to(target_position) > TOLERANCE:
		move_component.go_to_position(target_position)
	else:
		patrol_component.set_patrol_node_entered(true)
	if state_manager.get_state("player_visible") or not state_manager.get_state("player_block_visited"):
		fsm.change_state(self, "Alert")
