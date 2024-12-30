extends CharacterBody2D
class_name EnemyNpc

var state_manager: StateManager
var move_component: MoveComponent

func _enter_tree() -> void:
	state_manager = $StateManager
	move_component = $Components/MoveComponent

func get_state_manager() -> StateManager:
	return state_manager

func get_move_component() -> MoveComponent:
	return move_component
