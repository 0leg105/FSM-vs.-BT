extends Component
class_name HitComponent

@export var health_component: HealthComponent

func damage(attack: int):
	if health_component:
		health_component.damage(attack)
