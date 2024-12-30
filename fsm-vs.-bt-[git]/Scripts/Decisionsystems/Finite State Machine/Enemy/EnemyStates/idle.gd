extends State
class_name FSMIdle

func enter():
	pass

func exit():
	pass

func update(_delta:float):
	if state_manager.get_state("player_visible"):
		pass
		#fsm.change_state(self,"Alert")
