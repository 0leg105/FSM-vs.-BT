extends Node
class_name StateManager

var current_state: Dictionary = {}

func _enter_tree() -> void:
	self.set_state("bullets", true)
	self.set_state("player_visible", false)
	self.set_state("player_eliminated", false)
	self.set_state("at_target", false)
	self.set_state("player_block_visited", false)
	self.set_state("look_at", Vector2.ZERO)
	self.set_state("last_seen_player_pos", Vector2(100,100))

func get_current_state() -> Dictionary:
	return self.current_state

func get_state(pName: String):
	return current_state.get(pName)

func update_state(state: String, value) -> void:
	if not current_state.has(state):
		push_error(state," DOES NOT EXIST IN STATES")
	set_state(state, value)

func set_state(pName: String, value) -> void:
	current_state[pName] = value
