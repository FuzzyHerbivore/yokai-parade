extends Node2D


var animation_state_machine


func _ready():
	animation_state_machine = %AnimationTree.get("parameters/playback")


func update_direction(direction):
	%AnimationTree.set("parameters/Idling/blend_position", direction)
	%AnimationTree.set("parameters/Moving/blend_position", direction)
	%AnimationTree.set("parameters/Lunging/blend_position", direction)
	%AnimationTree.set("parameters/Attacking/blend_position", direction)
	%AnimationTree.set("parameters/Recovering/blend_position", direction)


func enter_state_idling():
	animation_state_machine.travel("Idling")


func enter_state_moving():
	animation_state_machine.travel("Moving")


func enter_state_lunging():
	animation_state_machine.travel("Lunging")
	await get_tree().create_timer(0.875).timeout # TODO: Await signal that animation is finished


func enter_state_attacking():
	animation_state_machine.travel("Attacking")
	await get_tree().create_timer(0.875).timeout # TODO: Await signal that animation is finished


func enter_state_recovering():
	animation_state_machine.travel("Recovering")
