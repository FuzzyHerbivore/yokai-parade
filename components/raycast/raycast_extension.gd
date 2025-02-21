extends RayCast2D

func has_target():
	return is_colliding()

func get_target():
	if !has_target(): return null
	return get_collider()

func lookat_target(target_pos):
	target_position = target_pos
