extends FiniteStateMachine
class_name EnemyFiniteStateMachine

var state_manager: StateManager

func _enter_tree() -> void:
	state_manager = $"../StateManager"

func get_state_manager() -> StateManager:
	return state_manager
