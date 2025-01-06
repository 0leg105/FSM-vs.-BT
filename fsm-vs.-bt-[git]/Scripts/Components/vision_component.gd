extends Component
class_name VisionComponent

@onready var ray_cast: RayCast2D = $RayCast2D
@onready var area_2d: Area2D = $Area2D
var player_block_component: PlayerBlockComponent

func _enter_tree() -> void:
	super._enter_tree()
	player_block_component = character_body.get_player_block_component()

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		set_player_not_visible()

func update() -> void:
	var bodies = area_2d.get_overlapping_bodies()
	if bodies.size() > 0:
		for body in bodies:
			# Spieler ist im Sichtfeld
			if body.is_in_group("Player"):
				ray_cast.target_position = to_local(body.global_position)
				if ray_cast.is_colliding():
					var collider = ray_cast.get_collider()
					if collider.is_in_group("Player"):
						set_player_visible(body.global_position)
						return
	set_player_not_visible()
	return

func set_player_not_visible() -> void:
	state_manager.update_state("player_visible", false)

# Kein PlayerBlock Vorhanden
func set_player_visible(pos: Vector2) -> void:
	state_manager.update_state("player_visible", true)
	state_manager.update_state("last_seen_player_pos", pos)
	if player_block_component:
		player_block_component.set_player_block_pos(pos)
	else:
		print("VISION COMPONENT HAS NO CONNECTION TO PLAYER_BLOCK_COMPONENT. CHECK EXPORT")
