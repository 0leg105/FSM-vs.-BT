extends State
class_name Die

func enter():
	label.text = character_body.name + " Die"
	unset_availableCoverNode()

func unset_availableCoverNode() -> void:
	character_body.unset_availableCoverNode()
