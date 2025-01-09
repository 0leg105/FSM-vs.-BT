class_name HUD
extends Node2D

@onready var pause_menu = $ColorRect
@onready var close_button = $CloseButton

var show_neighbor_components: bool = false :
	set(value):
		show_neighbor_components = value
		var neighbor_components = get_tree().get_nodes_in_group("neighbor_components")
		for neighbor in neighbor_components:
			(neighbor as NeighborComponent).visible = value

var show_vision: bool = false :
	set(value):
		show_vision = value
		var vision_components = get_tree().get_nodes_in_group("vision_components")
		for vision in vision_components:
			(vision as VisionComponent).visible = value

var show_navigation: bool = false :
	set(value):
		show_navigation = value
		var nav_agents = get_tree().get_nodes_in_group("navigation_agents")
		for agent in nav_agents:
			(agent as NavigationAgent2D).debug_enabled = value

var show_state_label: bool = false :
	set(value):
		show_state_label = value
		for npc in get_tree().get_nodes_in_group("fsm_npc"):
			npc.state_label.visible = value
			npc.state_label.text = npc.fsm.current_state.state_name

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

func _on_show_state_button_toggled(toggled_on: bool) -> void:
	show_state_label = toggled_on

func _on_show_navigation_routes_button_toggled(toggled_on: bool) -> void:
	show_navigation = toggled_on

func _on_show_vision_button_toggled(toggled_on: bool) -> void:
	show_vision = toggled_on

func _on_show_neighbors_button_toggled(toggled_on: bool) -> void:
	show_neighbor_components = toggled_on
