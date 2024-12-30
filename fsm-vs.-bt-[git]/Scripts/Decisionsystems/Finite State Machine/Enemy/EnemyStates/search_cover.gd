extends State
class_name SearchCover

@export var cover_component: CoverComponent

func enter():
	fsm.label.set_current_state("SearchCover")

func exit():
	fsm.label.set_current_state("")

func update(delta: float):
	if cover_component.check_current_cover() or cover_component.check_for_cover_node_in_cover_manager():
		print(character_body.name, " hat Node gefunden: ", cover_component.get_cover_node())
		print(character_body.name, " SearchCover -> MoveToCover")
		fsm.change_state(self,"MoveToCover")
	else:
		print(character_body.name, " SearchCover -> Shoot")
		fsm.change_state(self,"Shoot")
