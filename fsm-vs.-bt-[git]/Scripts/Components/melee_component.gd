extends Component
class_name MeleeComponent

@onready var ray_cast: RayCast3D = $RayCast3D
@onready var timer: Timer = $Timer
const MELEE_RANGE: float = 4

func _ready() -> void:
	ray_cast.target_position.z = -1 * MELEE_RANGE

func melee_player() -> bool:
	if timer.is_stopped():
		timer.start()
		return true
	return false

func _on_timer_timeout() -> void:
	if ray_cast.is_colliding():
		var hit = ray_cast.get_collider()
		if hit.is_in_group("Player"):
			print(hit.name, " meleed")
