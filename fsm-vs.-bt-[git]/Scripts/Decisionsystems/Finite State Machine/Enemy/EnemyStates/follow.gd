extends State
class_name Follow

@onready var nav_agent = $"../../NavigationAgent3D"
@onready var player = get_tree().get_nodes_in_group("Player")[0]
@onready var eyes = $"../../Eyes"
@onready var shoottimer = $"../../ShootTimer"
@onready var raycast = $"../../RayCast3D"
var SPEED = 3.0
var EYESPEED = 2

func Enter():
	label.text = "Follow"

func Exit():
	pass

func Update(delta:float):
	var currentLocation = character_body.global_transform.origin #current enemy location
	var distanceToPlayer = currentLocation.distance_to(player.global_transform.origin)
	var playerPos = Vector3(player.global_transform.origin.x, 0, player.global_transform.origin.z)
	update_target_location(playerPos)
	if distanceToPlayer < 15:
		var nextLocation = nav_agent.get_next_path_position() #next location the nav agent is directing towards
		var newVelocity = (nextLocation - currentLocation).normalized() * SPEED #calculate velocity between current and next location
		newVelocity.y = character_body.velocity.y -9.8 * delta
		character_body.velocity = newVelocity
		eyes.look_at(playerPos, Vector3.UP)
		character_body.rotate_y(deg_to_rad(eyes.rotation.y * EYESPEED))
		character_body.move_and_slide()
	#elif distanceToPlayer < 10:
		#fsm.change_state(self,"Shoot")
	else:
		shoottimer.stop()
		character_body.look_at(playerPos, Vector3.UP)
		character_body.velocity = Vector3.ZERO
		fsm.change_state(self,"Idle")

func update_target_location(target_location) -> void:
	nav_agent.set_target_position(target_location)

func _on_shoot_timer_timeout() -> void:
	if raycast.is_colliding():
		var hit = raycast.get_collider()
		if hit.is_in_group("Player"):
			print("hit")
