extends Node2D

var current_ability
@onready var player: CharacterBody2D = $".."


func _unhandled_input(_event):
	if Input.is_action_just_pressed("use_ability"):
		use_ability(player)


func use_ability(player_manager):
	if current_ability == null: return

	if current_ability.has_method("use"):
		current_ability.use(player_manager)

	current_ability = null


func set_current_ability(ability_scene):
	if ability_scene != null:
		var ability = ability_scene.instantiate()
		add_child(ability)
		current_ability = ability


func get_current_ability():
	return current_ability
