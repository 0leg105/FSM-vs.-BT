extends Component
class_name HealthComponent

const MAX_HP: int = 100

func damage(attack: int):
	var new_hp: int = state_manager.get_state("healthpoints") - attack
	state_manager.update_state("healthpoints", new_hp)
	if state_manager.get_state("healthpoints") <= 0:
		#state_manager.update_state("healthpoints", MAX_HP)
		get_parent().queue_free()
