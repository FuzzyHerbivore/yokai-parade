extends Node2D

@export var double_jump_vel = 800.0
@export var double_jump_duration = 0


func use(player_manager):
	var vel_modifier = VelocityModifier.new(Vector2(0, -double_jump_vel), double_jump_duration, 1, false)
	player_manager.add_velocity_modifier(vel_modifier)

func exit_ability():
	pass
