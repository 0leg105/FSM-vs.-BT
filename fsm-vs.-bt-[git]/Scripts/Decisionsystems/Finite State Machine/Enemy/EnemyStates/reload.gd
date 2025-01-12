extends State
class_name ReloadFSM

@export var shoot_component: ShootComponent

func enter():
	state_manager.set_state("look_at", state_manager.get_state("last_seen_player_pos"))

func exit():
	pass

func _ready():
	color = Color("ff9900", color_alpha)

func update(_delta: float):
	shoot_component.reload_gun()
	if state_manager.get_state("bullets"):
		fsm.change_state(self, "Alert")
