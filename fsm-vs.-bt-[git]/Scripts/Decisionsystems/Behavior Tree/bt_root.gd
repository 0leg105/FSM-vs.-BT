extends BehaviorTree
class_name BehaviorTreeRoot

var character_body: Enemy
var state_manager: StateManager

func _enter_tree() -> void:
	state_manager = $"../StateManager"
	character_body = $".."

func update(delta):
	get_child(0).tick(get_parent(), state_manager)
