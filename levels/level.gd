extends Node2D
# TODO: Turn this into a scene/script combo that can be added through the Add Scene dialog

func get_player_spawn_position():
	if get_node_or_null("PlayerSpawnPoint") == null:
		printerr("Error: No PlayerSpawnPoint in this level!")
	return $PlayerSpawnPoint.global_position


func set_player_spawn_position(new_position):
	if get_node_or_null("PlayerSpawnPoint") != null:
		$PlayerSpawnPoint.global_position = new_position
	else:
		printerr("Error: No PlayerSpawnPoint in this level!")
