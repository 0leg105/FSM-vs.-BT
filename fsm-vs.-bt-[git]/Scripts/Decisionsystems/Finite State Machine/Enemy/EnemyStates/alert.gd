extends State
class_name Alert

@export var cover_component: CoverComponent

func enter():
	pass

func exit():
	pass

func update(delta:float):
	if state_manager.get_state("player_visible"):
		if state_manager.get_state("at_target"):
			fsm.change_state(self, "Melee")
		if state_manager.get_state("bullets"):
			if cover_component.at_cover_node_check():
				fsm.change_state(self, "InCoverShoot")
			elif cover_component.check_current_cover() or cover_component.check_for_cover_node_in_cover_manager():
				fsm.change_state(self, "MoveToCover")
			else:
				fsm.change_state(self, "Shoot")
		else:
			fsm.change_state(self, "Reload")
	else:
		print(state_manager.get_state("player_block_visited"))
		if not state_manager.get_state("player_block_visited"):
			fsm.change_state(self, "SearchPlayer")
		else:
			fsm.change_state(self, "Patrol")
