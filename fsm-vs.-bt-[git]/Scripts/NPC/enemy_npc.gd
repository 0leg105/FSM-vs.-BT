extends CharacterBody2D
class_name EnemyNpc

var move_component: MoveComponent

func _enter_tree() -> void:
	move_component = $Components/MoveComponent
