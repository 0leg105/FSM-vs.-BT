extends Component
class_name MoveComponent

@onready var nav_agent_2d: NavigationAgent2D = $NavigationAgent2D
const SPEED: float = 100
var next_pos: Vector2 = Vector2.ZERO
	
func go_to_position(pos: Vector2 = next_pos) -> void:
	print(pos)
	var current_location = character_body.global_transform.origin
	nav_agent_2d.set_target_position(pos)
	var next_position = nav_agent_2d.get_next_path_position()
	var new_velocity = (next_position - current_location).normalized() * SPEED
	character_body.velocity = new_velocity
	character_body.move_and_slide()

# Derzeitig nicht benötigt
#func get_path_length(pos: Vector2) -> float:
	#nav_agent_2d.set_target_position(pos)
	#nav_agent_2d.get_next_path_position()
	#var path = nav_agent_2d.get_current_navigation_path()
	#var total_path_length: float = 0
	#for i in range(1, path.size()-1):
		#total_path_length += path[i].distance_to(path[i+1])
	#return total_path_length
