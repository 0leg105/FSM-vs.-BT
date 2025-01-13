extends EnemyNpc
class_name BtNPC

var debug_box: Node2D
var bt: BehaviorTree
var leaf_colors: Dictionary = {
	"SearchPlayer": "4a86e8",
	"PlayerInScope": "ff0000",
	"Melee": "cc0000",
	"Patrol": "45818e",
}
var current_leaf: String : 
	set(value):
		current_leaf = value
		leaf_label.text = value
		if value in leaf_colors:
			neighbor_component.collision_shape.debug_color = Color(leaf_colors[value], 0.3)

@onready var leaf_label: Label = $CenterContainer/BehaviorLabel
@onready var neighbor_component: NeighborComponent = $Components/NeighborComponent
@onready var nav_agent: NavigationAgent2D = $Components/MoveComponent/NavigationAgent2D
@onready var hud: HUD

func _enter_tree() -> void:
	super._enter_tree()
	bt = $BehaviorTree/TreeRoot
	hud = global_coordinator.hud

func _ready() -> void:
	nav_agent.debug_enabled = hud.show_navigation
	neighbor_component.visible = hud.show_neighbor_components
	leaf_label.visible = hud.show_state_label
	vision_component.visible = hud.show_vision

func _process(delta: float) -> void:
	vision_component.update()
	bt.update(delta)
	look_at_component.look_at_pos(state_manager.get_state("look_at"))

func increment_hits() -> void:
	global_coordinator.increment_bt_hits()

func set_current_leaf(current_leaf: String) -> void:
	self.current_leaf = current_leaf
