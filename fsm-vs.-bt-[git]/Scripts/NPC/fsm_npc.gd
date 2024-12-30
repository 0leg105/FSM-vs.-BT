extends EnemyNpc
class_name FsmNpc

var rand_vec2: Vector2

func _enter_tree() -> void:
	super._enter_tree()
	##move_component test
	rand_vec2 = Vector2(randf_range(100, 500), randf_range(100, 500))
	print("rand_vec2: ", rand_vec2)

func _process(_delta: float) -> void:
	move_component.go_to_position(rand_vec2)
