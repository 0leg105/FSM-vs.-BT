extends State
class_name Alert

func enter():
	pass

func exit():
	pass

func update(_delta: float):
	if state_manager.get_state("player_visible"):
		#if state_manager.get_state("at_target"):
			#fsm.change_state(self, "Melee")
		if state_manager.get_state("bullets"):
			fsm.change_state(self, "Shoot")
		else:
			fsm.change_state(self, "Reload")
	else:
		if not state_manager.get_state("player_block_visited"):
			fsm.change_state(self, "SearchPlayer")
		else:
			fsm.change_state(self, "Patrol")
