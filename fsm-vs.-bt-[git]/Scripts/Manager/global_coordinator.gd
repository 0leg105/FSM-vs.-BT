extends Node
class_name GlobalCoordinator

var bt_hits: int = 0
var fsm_hits: int = 0

@export var player: Node
@export var player_block: PlayerBlock
@export var patrol_nodes: Array[PatrolNode]

@onready var hud = $"../Hud"

func get_player_pos() -> Vector2:
	return player.global_position

func get_player_block_pos() -> Vector2:
	return player_block.global_position

func get_player_block() -> PlayerBlock:
	return self.player_block

func set_player_block_pos(player_pos: Vector2) -> void:
	player_block.set_player_block_pos(player_pos)

func get_patrol_nodes() -> Array[PatrolNode]:
	if patrol_nodes:
		return patrol_nodes
	else:
		print("NO PATROL NODES EXPORTED IN GLOBALCOORDINATOR")
		return []

func increment_fsm_hits() -> void:
	fsm_hits += 1
	var fsm_hits_label = hud.get_child(1) as Label
	fsm_hits_label.text = str(fsm_hits)
	#print(fsm_hits)

func increment_bt_hits() -> void:
	bt_hits += 1
	var bt_hits_label = hud.get_child(2) as Label
	bt_hits_label.text = str(bt_hits)
