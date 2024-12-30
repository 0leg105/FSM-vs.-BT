extends State
class_name Shoot

@export var shoot_component: ShootComponent

func enter():
	pass

func exit():
	pass

func update(delta: float):
	state_manager.update_state("look_pos", state_manager.get_state("last_seen_player_pos"))
	var shoot: bool = shoot_component.shoot_player()
	if shoot:
		fsm.change_state(self, "Alert")
