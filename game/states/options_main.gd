extends GameState


func get_window_fullscreen():
	return parent.get_window_fullscreen()


func set_window_fullscreen(is_on):
	parent.set_window_fullscreen(is_on)


func set_volume_audio_bus(bus_id, volume_db):
	parent.set_volume_audio_bus(bus_id, volume_db)


func get_volume_audio_bus(bus_id):
	return parent.get_volume_audio_bus(bus_id)


# Game States

func enter(p_previous_state):
	super.enter(p_previous_state)

	state_scene.set_state_node(self)
	state_scene.update()


func change_to_previous_state():
	change_state(previous_state)
