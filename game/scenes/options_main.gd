extends Node


var state_node


func _ready():
	%FullscreenCheckBox.toggled.connect(set_window_fullscreen)

	%VolumeMasterSlider.value_changed.connect(set_volume_audio_bus_main)
	%VolumeMusicSlider.value_changed.connect(set_volume_audio_bus_music)
	%VolumeSfxSlider.value_changed.connect(set_volume_audio_bus_sfx)
	%VolumeUiSlider.value_changed.connect(set_volume_audio_bus_ui)

	%VolumeSfxSlider.drag_started.connect(loop_sfx_sound)
	%VolumeSfxSlider.drag_ended.connect(stop_sound_loop)

	%VolumeUiSlider.drag_started.connect(loop_ui_sound)
	%VolumeUiSlider.drag_ended.connect(stop_sound_loop)

	%BackButton.pressed.connect(change_to_previous_state)
	%BackButton.grab_focus()


func update():
	%FullscreenCheckBox.set_pressed_no_signal(state_node.get_window_fullscreen())

	%VolumeMasterSlider.set_value_no_signal(db_to_linear(state_node.get_volume_audio_bus(0)))
	%VolumeMusicSlider.set_value_no_signal(db_to_linear(state_node.get_volume_audio_bus(1)))
	%VolumeSfxSlider.set_value_no_signal(db_to_linear(state_node.get_volume_audio_bus(2)))
	%VolumeUiSlider.set_value_no_signal(db_to_linear(state_node.get_volume_audio_bus(3)))


func loop_sfx_sound():
	%AnimationPlayer.play("loop_sfx_sound")


func loop_ui_sound():
	%AnimationPlayer.play("loop_ui_sound")


func stop_sound_loop(_changed):
	%AnimationPlayer.stop()


func set_window_fullscreen(active):
	state_node.set_window_fullscreen(active)


func set_volume_audio_bus_main(volume_linear):
	state_node.set_volume_audio_bus(0, linear_to_db(volume_linear))


func set_volume_audio_bus_music(volume_linear):
	state_node.set_volume_audio_bus(1, linear_to_db(volume_linear))


func set_volume_audio_bus_sfx(volume_linear):
	state_node.set_volume_audio_bus(2, linear_to_db(volume_linear))


func set_volume_audio_bus_ui(volume_linear):
	state_node.set_volume_audio_bus(3, linear_to_db(volume_linear))


# Game States

func set_state_node(node):
	state_node = node


func change_to_previous_state():
	%AnimationPlayer.stop()
	%AnimationPlayer.play("state_transitions_long/hide_state_scene")
	await %AnimationPlayer.animation_finished

	state_node.change_to_previous_state()
