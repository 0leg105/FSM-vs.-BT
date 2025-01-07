extends EnemyNpc
class_name FsmNpc

@onready var fsm: FiniteStateMachine = $"Enemy Finite State Machine"
var debug_box: Node2D

func _enter_tree() -> void:
	super._enter_tree()
	debug_box = get_tree().get_first_node_in_group("DebugBox")

func _process(delta: float) -> void:
	vision_component.update()
	fsm.update(delta)
	look_at_component.look_at_pos(state_manager.get_state("look_at"))

func increment_fsm_hits() -> void:
	global_coordinator.increment_fsm_hits()
