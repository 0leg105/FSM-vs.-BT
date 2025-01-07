extends EnemyNpc
class_name BtNPC

var debug_box: Node2D

func _enter_tree() -> void:
	super._enter_tree()

func _process(delta: float) -> void:
	vision_component.update()
	#bt.update()
	look_at_component.look_at_pos(state_manager.get_state("look_at"))

func increment_bt_hits() -> void:
	global_coordinator.increment_bt_hits()
