extends State
class_name FSMIdle

func enter():
	pass

func exit():
	pass

func update(delta:float):
	if state_manager.get_state("player_visible"):
		fsm.change_state(self,"Alert")
