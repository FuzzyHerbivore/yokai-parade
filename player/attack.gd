extends Node2D

@export var trail_points_max = 4
@onready var attack_line: Line2D = $"../AttackLine"
@onready var attack_target: Node2D = $"../AttackTarget"
var hit_progress = .0
var is_attacking
var initial_pos

func _ready():
	initial_pos = position


func _process(delta):
	update_trail()
	flip()

	var is_in_reset_range = attack_target.position.length() - position.length() > 1.0
	if Input.is_action_just_pressed("catch_power") && !is_in_reset_range:
		position = initial_pos
		hit_progress = .0
		is_attacking = true

	elif is_attacking:
		hit_progress += delta
		position = position.slerp(attack_target.position, hit_progress)



func update_trail():
	attack_line.add_point(global_position - attack_line.global_position)

	if attack_line.get_point_count() > trail_points_max:
		attack_line.remove_point(0)


func flip():
	attack_line.scale.x = $"..".look_direction
