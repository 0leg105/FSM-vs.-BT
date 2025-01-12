extends EnemyNpc
class_name BtNPC

var debug_box: Node2D
var bt: BehaviorTree
var current_leaf: String

func _enter_tree() -> void:
	super._enter_tree()
	bt = $BehaviorTree/TreeRoot

func _process(delta: float) -> void:
	vision_component.update()
	bt.update(delta)
	look_at_component.look_at_pos(state_manager.get_state("look_at"))

func increment_hits() -> void:
	global_coordinator.increment_bt_hits()

func set_current_leaf(current_leaf: String) -> void:
	self.current_leaf = current_leaf
