extends Node2D
var anim_sprite


func play(animation_name):
	anim_sprite = $AnimatedSprite2D
	anim_sprite.play(animation_name, 1.0, false)


func on_animation_finished():
	queue_free()
	pass
