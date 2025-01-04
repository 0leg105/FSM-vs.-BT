extends Component
class_name PlayerBlockComponent

var player_block: PlayerBlock

func _enter_tree() -> void:
	super._enter_tree()
	player_block = character_body.get_player_block()

func get_player_block() -> PlayerBlock:
	return player_block

func set_player_block_pos(pos: Vector2) -> void:
	player_block.set_player_block_pos(pos)

func set_player_block_visited(visited: bool) -> void:
	state_manager.update_state("player_block_visited", visited)
