extends EnemyNpc
class_name FsmNpc

@export var debug_box: Node2D
var rand_vec2: Vector2

func _enter_tree() -> void:
	super._enter_tree()

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	move_component.go_to_position(debug_box.global_position)
