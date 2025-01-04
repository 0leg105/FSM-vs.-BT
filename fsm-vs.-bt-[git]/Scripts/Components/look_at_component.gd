extends Node2D
class_name LookAtComponent

const ROTATIONSPEED: float = 2
@export var body: Node2D
@export var sprite: Sprite2D

func look_at_pos(pos: Vector2) -> void:
	body.look_at(pos)
	sprite.look_at(pos)
