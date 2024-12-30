extends Node
class_name Component

var character_body: CharacterBody2D
var state_manager: StateManager

func _enter_tree() -> void:
	character_body = get_parent().get_parent()
	state_manager = character_body.get_state_manager()
