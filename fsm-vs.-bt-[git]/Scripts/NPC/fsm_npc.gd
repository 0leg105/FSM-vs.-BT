extends EnemyNpc
class_name FsmNpc

@onready var fsm: FiniteStateMachine = $"Enemy Finite State Machine"
@onready var state_label: Label = $CenterContainer/StateLabel
@onready var nav_agent: NavigationAgent2D = $Components/MoveComponent/NavigationAgent2D
@onready var neighbor_component: NeighborComponent = $Components/NeighborComponent
@onready var hud: HUD
var debug_box: Node2D

func _on_state_changed(new_state):
	state_label.text = new_state
	neighbor_component.collision_shape.debug_color = fsm.current_state.color

func _enter_tree() -> void:
	super._enter_tree()
	debug_box = get_tree().get_first_node_in_group("DebugBox")
	hud = global_coordinator.hud

func _ready() -> void:
	state_label.visible = hud.show_state_label
	nav_agent.debug_enabled = hud.show_navigation
	vision_component.visible = hud.show_vision
	neighbor_component.visible = hud.show_neighbor_components
	state_label.text = fsm.current_state.state_name
	neighbor_component.collision_shape.debug_color = fsm.current_state.color

func _process(delta: float) -> void:
	vision_component.update()
	fsm.update(delta)
	look_at_component.look_at_pos(state_manager.get_state("look_at"))

func increment_hits() -> void:
	global_coordinator.increment_fsm_hits()
