extends Component
class_name ShootComponent

@onready var timer: Timer = $ShootTimer
@onready var reload_timer: Timer = $ReloadTimer
@onready var ray_cast: RayCast2D = $RayCast2D
const MAX_BULLETS: int = 3
var bullets: int = 0

func _enter_tree() -> void:
	super._enter_tree()
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
		print("hit: ", hit)
		if hit.is_in_group("Player"):
			print(hit.name, " Shoot")
			state_manager.update_state("hits_on_enemy", state_manager.get_state("hits_on_enemy") + 1)
			print(state_manager.get_state("hits_on_enemy"))

func reload_gun() -> void:
	if reload_timer.is_stopped():
		reload_timer.start()

func _on_reload_timer_timeout() -> void:
	bullets = MAX_BULLETS
	state_manager.update_state("bullets", bullets > 0)
