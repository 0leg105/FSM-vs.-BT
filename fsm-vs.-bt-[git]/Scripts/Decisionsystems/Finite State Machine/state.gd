extends Node
class_name State

var fsm: FiniteStateMachine
var state_manager: StateManager
var state_name: String

func _enter_tree() -> void:
	fsm = get_parent()
	state_manager = fsm.get_state_manager()

func enter():
	pass

func exit():
	pass

func update(_delta:float):
	pass
