extends Component
class_name MeleeComponent

@onready var ray_cast: RayCast2D = $RayCast2D
@onready var timer: Timer = $Timer

func melee_player() -> bool:
	if timer.is_stopped():
		timer.start()
		return true
	return false

func _on_timer_timeout() -> void:
	if ray_cast.is_colliding():
		var hit = ray_cast.get_collider()
		if hit.is_in_group("Player"):
			character_body.increment_hits()
