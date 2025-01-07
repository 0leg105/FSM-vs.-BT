extends Component
class_name NeighborComponent

@onready var player_block_component: PlayerBlockComponent = $"../PlayerBlockComponent"
@onready var area_2d: Area2D = $Area2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		state_manager.update_state("at_target", true)
		state_manager.update_state("last_seen_player_pos", body.global_position)
		if player_block_component:
			player_block_component.set_player_block_pos(body.global_position)
		else:
			print("VISION COMPONENT HAS NO CONNECTION TO PLAYER_BLOCK_COMPONENT. CHECK EXPORT")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		state_manager.update_state("at_target", false)
		state_manager.update_state("last_seen_player_pos", body.global_position)
