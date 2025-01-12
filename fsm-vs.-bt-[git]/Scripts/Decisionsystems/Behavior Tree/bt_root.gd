extends BehaviorTree
class_name BehaviorTreeRoot

@export var character_body: BtNPC
var state_manager: StateManager

func _enter_tree() -> void:
	state_manager = $"../../StateManager"

func update(delta):
	get_child(0).tick(get_parent(), state_manager)
	
