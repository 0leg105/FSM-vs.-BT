extends Component
class_name NeighborComponent

@onready var area_3d: Area3D = $Area3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		state_manager.update_state("at_target", true)
		state_manager.update_state("last_seen_player_pos", body.global_transform.origin)

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		state_manager.update_state("at_target", false)
		state_manager.update_state("last_seen_player_pos", body.global_transform.origin)
