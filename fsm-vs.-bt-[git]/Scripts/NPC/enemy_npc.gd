extends CharacterBody2D
class_name EnemyNpc

var global_coordinator: GlobalCoordinator
var player_block: PlayerBlock
var state_manager: StateManager
var move_component: MoveComponent
var vision_component: VisionComponent
var player_block_component: PlayerBlockComponent
var look_at_component: LookAtComponent
var patrol_nodes: Array[PatrolNode]

func _enter_tree() -> void:
	global_coordinator = get_tree().get_first_node_in_group("global_coordinator")
	player_block = global_coordinator.get_player_block()
	patrol_nodes = global_coordinator.get_patrol_nodes()
	state_manager = $StateManager
	move_component = $Components/MoveComponent
	vision_component = $Components/VisionComponent
	player_block_component = $Components/PlayerBlockComponent
	look_at_component = $Components/LookAtComponent
	global_coordinator.get_player_block().set_new_player_block.connect(_on_player_block_set_new_player_block)

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

func get_look_at_component() -> LookAtComponent:
	return look_at_component

func get_patrol_nodes() -> Array[PatrolNode]:
	return patrol_nodes

func _on_player_block_set_new_player_block() -> void:
	player_block_component.set_player_block_visited(false)
