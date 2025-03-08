extends EnemyStateCatchable


@export_category("Enemy States")
@export var lunging_enemy_state: EnemyState

@export_category("Components")
@export var ranged_attack_component: Node2D

var is_animation_running = false


func enter(p_previous_state):
	super.enter(p_previous_state)

	is_animation_running = true
	await state_animations_scene.enter_state_attacking()
	is_animation_running = false


func attack():
	var target = ranged_attack_component.get_target_in_visible_range()
	if target == null \
	or not target.has_method("on_took_damage"): return

	target.on_took_damage(parent)


func physics_process(_delta):
	var next_state = check_caught()

	if next_state != null \
	or is_animation_running:
		return next_state

	if ranged_attack_component.get_target_in_visible_range() != null:
		next_state = lunging_enemy_state
	else:
		next_state = parent.get_initial_state()
	return next_state
