extends Node2D

@onready var maxNPCsInput = $NormalMode/MaxNPCsInput
@onready var waitTimeInput = $NormalMode/SpawnWaitTimeInput
@onready var errorLabel = $NormalMode/ErrorLabel
@onready var errorTimer = $NormalMode/ErrorLabel/Timer
var use_fsm = true
var use_bt = false

func _on_start_button_pressed() -> void:
	var maxNPCs = maxNPCsInput.value
	var waitTime = waitTimeInput.value
	if maxNPCs == null or waitTime == null:
		errorLabel.visible = true
		if !errorTimer.is_stopped():
			errorTimer.stop()
		errorTimer.start()
	
	var game = load("res://Scenes/Demos/fsm_vs__bt_demo.tscn").instantiate()
	for child in game.get_children():
		if child is NpcSpawner:
			var spawner = child as NpcSpawner
			spawner.max_npc_count = maxNPCsInput.value
			spawner.wait_time = waitTimeInput.value
			if spawner.name == "FsmNpcSpawner" and !use_fsm:
				spawner.max_npc_count = 0
			if spawner.name == "BtNpcSpawner" and !use_bt:
				spawner.max_npc_count = 0
	
	get_tree().root.call_deferred("remove_child", get_tree().current_scene)
	get_tree().root.add_child(game)
	get_tree().current_scene = game

func _on_second_start_button_pressed() -> void:
	var maxNPCs = maxNPCsInput.value
	var waitTime = waitTimeInput.value
	if maxNPCs == null or waitTime == null:
		errorLabel.visible = true
		if !errorTimer.is_stopped():
			errorTimer.stop()
		errorTimer.start()
	
	var game = load("res://Scenes/Demos/fsm_vs__bt_demo.tscn").instantiate()
	for child in game.get_children():
		if child is NpcSpawner:
			var spawner = child as NpcSpawner
			spawner.max_npc_count = 1
			spawner.wait_time = 1
	
	get_tree().root.call_deferred("remove_child", get_tree().current_scene)
	get_tree().root.add_child(game)
	get_tree().current_scene = game

func _on_error_timer_timeout() -> void:
	errorLabel.visible = false

func _on_fsm_check_button_toggled(toggled_on: bool) -> void:
	use_fsm = toggled_on

func _on_bt_check_button_toggled(toggled_on: bool) -> void:
	use_bt = toggled_on
