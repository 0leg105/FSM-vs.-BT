extends Component
class_name CoverComponent

var move_component: MoveComponent
var cover_node: CoverNode = null
const TOLERANCE: float = 1.2

func _enter_tree() -> void:
	super._enter_tree()
	move_component = character_body.get_move_component()

# Prüfen ob derzeitiger CoverNode valid ist
func check_current_cover() -> bool:
	return cover_node != null and cover_node.is_valid_cover()

# Nach CoverNode des Typs in CoverNodeManager suchen
func check_for_cover_node_in_cover_manager() -> bool:
	var new_cover_node: CoverNode = character_body.get_cover_node_manager().get_cover_for_npc(move_component)
	return new_cover_node != null and subscribe_to_cover_node(new_cover_node)

func subscribe_to_cover_node(cover_node: CoverNode) -> bool:
	if cover_node.set_is_subscribed(self):
		self.cover_node = cover_node
		return true
	return false

func get_cover_node() -> CoverNode:
	return self.cover_node

func cover_node_not_valid() -> void:
	state_manager.update_state("at_cover_node", false)
	cover_node = null

func cover_node_entered() -> void:
	state_manager.update_state("at_cover_node", true)
	cover_node.set_contains_npc(true)

func at_cover_node_check() -> bool:
	return cover_node and character_body.global_transform.origin.distance_to(cover_node.global_transform.origin) < TOLERANCE
