extends Component
class_name LookAtComponent

const ROTATIONSPEED: float = 2

func look_at_pos(pos: Vector2) -> void:
	self.look_at(pos)
	var target_angle = pos.angle()
	# Setze die Rotation des Characters
	character_body.rotation = target_angle
	#character_body.rotate_y(deg_to_rad(self.rotation.y * ROTATIONSPEED))
