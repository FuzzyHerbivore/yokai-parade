extends Node2D

@export var dash_velocity = 300.0
@export var dash_duration = 1.0


func use(player_manager):
	var vel_modifier = VelocityModifier.new(Vector2(dash_velocity, 0), dash_duration, 1, true)
	player_manager.add_velocity_modifier(vel_modifier)

func exit_ability():
	pass
