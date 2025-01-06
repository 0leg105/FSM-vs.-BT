extends Component
class_name NeighborComponent

@onready var area_2d: Area2D = $Area2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		state_manager.update_state("at_target", true)
		state_manager.update_state("last_seen_player_pos", body.global_position)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		state_manager.update_state("at_target", false)
		state_manager.update_state("last_seen_player_pos", body.global_position)
