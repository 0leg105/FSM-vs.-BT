extends State
class_name Alert

func enter():
	pass

func exit():
	pass

func _ready():
	color = Color("ffd966", color_alpha)

func update(_delta: float):
	#print("player visible ", state_manager.get_state("player_visible"))
	#print("player player_block_visited ", state_manager.get_state("player_block_visited"))
	print("at_target: ", state_manager.get_state("at_target"))
	
	if state_manager.get_state("player_visible"):
		if state_manager.get_state("at_target"):
			fsm.change_state(self, "Melee")
		if state_manager.get_state("bullets"):
			fsm.change_state(self, "Shoot")
		else:
			fsm.change_state(self, "Reload")
	else:
		if not state_manager.get_state("player_block_visited"):
			fsm.change_state(self, "SearchPlayer")
		else:
			fsm.change_state(self, "Patrol")
