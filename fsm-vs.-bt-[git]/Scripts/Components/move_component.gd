extends Component
class_name MoveComponent

@onready var nav_agent_2d: NavigationAgent2D = $NavigationAgent2D
const SPEED: float = 100


func go_to_position(pos: Vector2) -> void:
	# Zielposition setzen
	nav_agent_2d.target_position = pos
	#print("Gehe zu Position:", pos)
	
	# Prüfen, ob das Ziel erreichbar ist
	if !nav_agent_2d.is_target_reachable():
		#print("Zielposition ist nicht erreichbar:", pos)
		return

	# Prüfen, ob die Navigation abgeschlossen ist
	if nav_agent_2d.is_navigation_finished():
		#print("Navigation abgeschlossen.")
		character_body.velocity = Vector2.ZERO  # Bewegung stoppen
		return

	# Nächste Position im Pfad abrufen
	var next_position = nav_agent_2d.get_next_path_position()
	#print("Nächste Position im Pfad:", next_position)

	# Bewegung berechnen
	character_body.velocity = (next_position - character_body.global_position).normalized() * SPEED

	# Bewegung ausführen
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
