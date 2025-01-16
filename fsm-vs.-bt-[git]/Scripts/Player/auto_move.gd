extends Node2D
class_name AutoComponent

@onready var nav: NavigationAgent2D = $"../NavigationAgent2D"
var character_body: CharacterBody2D
var gc: GlobalCoordinator
var speed = 300
var accel = 7
var patrol_nodes: Array[PatrolNode]
var patrol_node_enetered: bool = true
var current_node_index: int = 0
const TOLERANCE: float = 11
var pos: Vector2

func  _enter_tree() -> void:
	character_body = $".."
	gc = character_body.get_gc()
	patrol_nodes = gc.get_patrol_nodes()

func update(delta: float) -> void:
	pos = get_patrol_node_pos()
	if character_body.global_position.distance_to(pos) > TOLERANCE:
		move(delta, pos)
	else:
		patrol_node_enetered = true

func move(delta, pos: Vector2) -> void:
	var direction = Vector3()
	nav.target_position = pos
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	character_body.velocity = character_body.velocity.lerp(direction * speed, accel * delta)
	character_body.move_and_slide()

func get_patrol_node_pos() -> Vector2: 
	if patrol_node_enetered:
		current_node_index = (current_node_index + 1) % patrol_nodes.size()
		patrol_node_enetered = false
		return patrol_nodes[current_node_index].global_position
	return patrol_nodes[current_node_index].global_position
