extends Component
class_name LookAtComponent

const ROTATIONSPEED: float = 2

func look_at_pos(pos: Vector3) -> void:
	if character_body.global_position.is_equal_approx(pos):
		return
	self.look_at(pos, Vector3.UP)
	character_body.rotate_y(deg_to_rad(self.rotation.y * ROTATIONSPEED))
