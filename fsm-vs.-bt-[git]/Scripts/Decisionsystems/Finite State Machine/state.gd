extends Node
class_name State

var character_body: CharacterBody2D
var fsm: FiniteStateMachine
var state_manager: StateManager
var state_name: String
var color: Color
var color_alpha: float = 0.3

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
