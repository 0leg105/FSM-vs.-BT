extends EnemyNpc
class_name FsmNpc

@onready var fsm: FiniteStateMachine = $"Enemy Finite State Machine"
var debug_box: Node2D

func _enter_tree() -> void:
	super._enter_tree()
	debug_box = get_tree().get_first_node_in_group("DebugBox")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	#move_component.go_to_position(debug_box.global_position)
	print(state_manager.get_state("player_block_visited"))
	look_at_component.look_at_pos(state_manager.get_state("look_at"))
	vision_component.update()
	fsm.update(delta)
