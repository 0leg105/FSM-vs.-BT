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
			print(hit.name, " meleed")
			state_manager.update_state("hits_on_enemy", state_manager.get_state("hits_on_enemy") + 1)
			print(state_manager.get_state("hits_on_enemy"))
