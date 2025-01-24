extends Node


signal level_loaded()


@export var levels: Array[PackedScene]


var player_spawn_position = null
var current_level = null


func get_number_of_levels():
	return levels.size()


func set_current_level(new_level):
	if current_level != null:
		current_level.queue_free()

	current_level = new_level

	add_child.call_deferred(current_level)


func load_level(level_index):
	var success = false

	if level_index < levels.size() \
	and levels[level_index] != null:
		var level = levels[level_index].instantiate()
		set_current_level(level)
		success = true

	level_loaded.emit()
	return success


func set_player_spawn_position(position):
	player_spawn_position = position


func get_player_spawn_position():
	if current_level == null:
		print("Error: Current level not set!")
		return null

	if player_spawn_position == null \
	and current_level.player_spawn_position == null:
		print("Error: Level is missing PlayerSpawnPoint!")

	player_spawn_position = current_level.player_spawn_position

	return player_spawn_position
