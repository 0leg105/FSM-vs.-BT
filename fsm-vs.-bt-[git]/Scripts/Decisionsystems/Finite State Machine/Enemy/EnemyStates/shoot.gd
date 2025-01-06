extends State
class_name Shoot

@export var shoot_component: ShootComponent

func enter():
	pass

func exit():
	pass

func update(_delta: float):
	state_manager.update_state("look_at", state_manager.get_state("last_seen_player_pos"))
	shoot_component.shoot_player()
	fsm.change_state(self, "Alert")
