extends Node2D
class_name PlayerBlock

#var npc: Array[Enemy]
signal set_new_player_block

#func _ready() -> void:
	#for enemy in get_tree().get_nodes_in_group("Enemy"):
		#npc.append(enemy)
#
#func append_npc(enemy: Enemy) -> void:
	#npc.append(enemy)

func set_player_block_pos(pos: Vector2) -> void:
	self.global_position = pos
	set_new_player_block.emit()

func get_pos() -> Vector2:
	return self.global_position
