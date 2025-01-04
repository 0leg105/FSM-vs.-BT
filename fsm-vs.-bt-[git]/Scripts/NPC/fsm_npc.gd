extends EnemyNpc
class_name FsmNpc

var debug_box: Node2D

func _enter_tree() -> void:
	super._enter_tree()
	debug_box = get_tree().get_first_node_in_group("DebugBox")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	move_component.go_to_position(debug_box.global_position)
	look_at_component.look_at_pos(debug_box.global_position)
	vision_component.update()
