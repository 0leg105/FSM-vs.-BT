extends Node
class_name FiniteStateMachine

# States einer Szene werden dem Dictionary hinzugefügt
var states : Dictionary = {}
# Derzeitiger Status
var current_state: State
# Anfang-Status
@export var initial_state : State

signal state_changed(new_state)

# Hinzufügung aller States der jeweiligen Szene in das Dicitonary
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func update(delta: float) -> void:
	current_state.update(delta)

# Methode zur änderung eines Status
func change_state(source_state: State, new_state_name: String) -> void:
	# Prüfung ob der source_state dem current_state entspricht 
	if source_state != current_state:
		print("Invalid change_state trying from: " + source_state.name + " but currently in: " + current_state.name)
		return
	# Prüfung ob der State im Dicitionary vorhanden ist
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("New state is empty")
		return
	# Verlassen des current_state
	if current_state:
		current_state.exit()
	# Eingehen in den new_state
	new_state.enter()
	# Debug für State-Wechsel für NPC
	if(current_state.name != new_state.name):
		print(current_state.name, " -> ", new_state.name)
	current_state = new_state
	state_changed.emit(new_state_name)
