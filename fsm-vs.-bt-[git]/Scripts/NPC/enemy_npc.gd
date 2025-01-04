extends CharacterBody2D
class_name EnemyNpc

var global_coordinator: GlobalCoordinator
var player_block: PlayerBlock
var state_manager: StateManager
var move_component: MoveComponent
var vision_component: VisionComponent
var player_block_component: PlayerBlockComponent

func _enter_tree() -> void:
	global_coordinator = get_tree().get_first_node_in_group("global_coordinator")
	player_block = global_coordinator.get_player_block()
	state_manager = $StateManager
	move_component = $Components/MoveComponent
	vision_component = $Components/VisionComponent
	player_block_component = $Components/PlayerBlockComponent

func get_state_manager() -> StateManager:
	return state_manager

func get_move_component() -> MoveComponent:
	return move_component

func get_vision_component() -> VisionComponent:
	return vision_component

func get_player_block() -> PlayerBlock:
	return player_block

func get_player_block_component() -> PlayerBlockComponent:
	return player_block_component
