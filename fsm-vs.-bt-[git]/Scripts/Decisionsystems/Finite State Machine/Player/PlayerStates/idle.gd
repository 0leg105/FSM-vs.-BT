extends State
class_name PlayerIdle

func enter():
	pass

func exit():
	pass

func update(_delta:float):
	if Input.get_vector("left", "right", "up", "down"):
		fsm.change_state(self, "Move")
