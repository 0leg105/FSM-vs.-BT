extends Node2D

@onready var pause_menu = $ColorRect
@onready var close_button = $CloseButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_button_pressed() -> void:
	get_tree().paused = true
	pause_menu.visible = true
	close_button.visible = false


func _on_continue_button_pressed() -> void:
	get_tree().paused = false
	pause_menu.visible = false
	close_button.visible = true


func _on_exit_button_pressed() -> void:
	pause_menu.visible = false
	close_button.visible = true
	var menu = load("res://Scenes/UI/menu.tscn").instantiate()
	get_tree().root.call_deferred("remove_child", get_tree().current_scene)
	get_tree().root.add_child(menu)
	get_tree().current_scene = menu
	get_tree().paused = false
