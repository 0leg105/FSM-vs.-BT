extends Component
class_name VisionComponent

@onready var area_2d: Area2D = $Area2D
@onready var ray_cast: RayCast2D = $RayCast2D
@onready var timer: Timer = $Timer
#var player_block_component: PlayerBlockComponent

func _enter_tree() -> void:
	super._enter_tree()
	#player_block_component = character_body.get_player_block_component()

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		start_player_not_visible_timer()

func update() -> void:
	var bodies = area_2d.get_overlapping_bodies()
	if bodies.size() > 0:
		for body in bodies:
			if body.is_in_group("Player"):
				var body_pos = body.global_position
				ray_cast.target_position = body_pos - ray_cast.global_position
				ray_cast.force_raycast_update()
				if ray_cast.is_colliding():
					var collider = ray_cast.get_collider()
					if collider.is_in_group("Player"):
						print("player sichtbar")
						#set_player_visible(body.global_transform.origin)
						return
	start_player_not_visible_timer()

func start_player_not_visible_timer() -> void:
	if timer.is_stopped() == true:
		timer.start()

func _on_timer_timeout() -> void:
	state_manager.update_state("player_visible", false)
	timer.stop()

# Kein PlayerBlock Vorhanden
#func set_player_visible(pos: Vector3) -> void:
	#state_manager.update_state("player_visible", true)
	#state_manager.update_state("last_seen_player_pos", pos)
	#if player_block_component:
		#player_block_component.set_player_block_pos(pos)
	#else:
		#print("VISION COMPONENT HAS NO CONNECTION TO PLAYER_BLOCK_COMPONENT. CHECK EXPORT")
