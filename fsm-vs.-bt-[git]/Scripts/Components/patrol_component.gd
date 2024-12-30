extends Component
class_name PatrolComponent

var move_component: MoveComponent
var patrol_nodes: Array = []
var current_node_index: int = 0
var initialized: bool = false
var patrol_node_eneterd: bool = false

func _enter_tree() -> void:
	super._enter_tree()
	move_component = character_body.get_move_component()
	patrol_nodes = character_body.get_patrol_nodes()

func get_patrol_node_pos() -> Vector3:
	if not initialized:
		current_node_index = get_shortest_node()
		initialized = true
		return patrol_nodes[current_node_index].global_transform.origin
	elif patrol_node_eneterd:
		current_node_index = (current_node_index + 1) % patrol_nodes.size()
		set_patrol_node_entered(false)
		return patrol_nodes[current_node_index].global_transform.origin
	return patrol_nodes[current_node_index].global_transform.origin

func get_patrol_nodes_size() -> int:
	return patrol_nodes.size()

func get_shortest_node() -> int:
	var shorted_patrol_node_index: int = 0
	var shortest_length: float = move_component.get_path_length(patrol_nodes[0].global_transform.origin)
	for i in range(1, patrol_nodes.size()-1):
		var length: float = move_component.get_path_length(patrol_nodes[i].global_transform.origin)
		if length <= shortest_length:
			shortest_length = length
			shorted_patrol_node_index = i
	return shorted_patrol_node_index

func set_initialized(initialized: bool) -> void:
	self.initialized = initialized

func set_patrol_node_entered(entered: bool) -> void:
	patrol_node_eneterd = entered
