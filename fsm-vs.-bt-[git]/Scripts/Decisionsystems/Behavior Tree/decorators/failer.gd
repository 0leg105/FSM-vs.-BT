extends Decorator
class_name AlwaysFailDecorator

func tick(action, blackboard):
	for c in get_children():
		var response = c.tick(action, blackboard)
		if response == RUNNING:
			return RUNNING
		return FAILURE
