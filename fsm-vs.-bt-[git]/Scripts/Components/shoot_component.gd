extends Component
class_name ShootComponent

@onready var timer: Timer = $ShootTimer
@onready var reload_timer: Timer = $ReloadTimer
@onready var ray_cast: RayCast3D = $RayCast3D
const MAX_BULLETS: int = 3
const SHOOT_RANGE: float = 20
var bullets: int = 0

func _ready() -> void:
	ray_cast.target_position.z = -1 * SHOOT_RANGE
	state_manager.update_state("bullets", bullets > 0)

func shoot_player() -> bool:
	if timer.is_stopped() and state_manager.get_state("bullets"):
		timer.start()
		return true
	return false

func _on_shoot_timer_timeout() -> void:
	bullets -= 1
	state_manager.update_state("bullets", bullets > 0)
	if ray_cast.is_colliding():
		var hit = ray_cast.get_collider()
		if hit.is_in_group("Player"):
			print(hit.name, " Shoot")

func reload_gun() -> void:
	if reload_timer.is_stopped():
		reload_timer.start()

func _on_reload_timer_timeout() -> void:
	bullets = MAX_BULLETS
	state_manager.update_state("bullets", true)
