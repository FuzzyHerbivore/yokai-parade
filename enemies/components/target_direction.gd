extends Node2D


var look_target


func _ready():
	assert(get_node_or_null("Area2D") != null, "Target direction component at %s is missing Area2D child that determines the detection area." % get_path())

	$Area2D.body_entered.connect(on_body_entered)
	$Area2D.body_exited.connect(on_body_exited)


func get_target_direction():
	if get_target_in_visible_range() == null: return null

	return global_position.direction_to(look_target.global_position)


func get_target_in_visible_range():
	if look_target == null: return

	if is_target_obstructed(look_target):
		return null

	return look_target


func is_target_obstructed(target):
	update_target_position(target)
	%ObstructionRayCast.force_raycast_update()
	return %ObstructionRayCast.is_colliding()


func update_target_position(target):
	%ObstructionRayCast.target_position = to_local(target.global_position)


func on_body_entered(target):
	if target == null: return

	%ObstructionRayCast.enabled = true

	look_target = target


func on_body_exited(_target):
	%ObstructionRayCast.enabled = false
	look_target = null
