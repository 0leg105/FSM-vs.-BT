extends Node2D
class_name PlayerBlock

signal set_new_player_block

func set_player_block_pos(pos: Vector2) -> void:
	self.global_position = pos
	set_new_player_block.emit()

func get_pos() -> Vector2:
	return self.global_position
