extends Node
class_name State

var character_body: CharacterBody2D
var fsm: FiniteStateMachine
var state_manager: StateManager
var state_name: String

func _enter_tree() -> void:
	character_body = get_parent().get_parent()
	fsm = get_parent()
	state_manager = fsm.get_state_manager()

func enter():
	pass

func exit():
	pass

func update(_delta:float):
	pass
