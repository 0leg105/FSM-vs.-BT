extends State
class_name Melee

@export var melee_component: MeleeComponent

func enter():
	pass

func exit():
	pass

func _ready():
	color = Color("cc0000", color_alpha)

func update(_delta: float):
	state_manager.update_state("look_at", state_manager.get_state("last_seen_player_pos"))
	var melee: bool = melee_component.melee_player()
	if melee:
		fsm.change_state(self, "Alert")
	return
