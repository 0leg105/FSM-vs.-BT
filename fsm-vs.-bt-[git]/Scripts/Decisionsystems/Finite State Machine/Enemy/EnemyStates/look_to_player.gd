extends State
class_name LookToPlayer

@onready var timer: Timer = $Timer

func enter():
	timer.start()

func exit():
	timer.stop()

func update(delta:float):
	pass

func _on_timer_timeout() -> void:
	fsm.change_state(self, "Alert")
