extends Node2D
var anim_sprite

func play(animation_name, emit_in_global = false):
	anim_sprite = $AnimatedSprite2D
	anim_sprite.play(animation_name, 1.0, false)

	if emit_in_global: reparent(get_tree().root)


func on_animation_finished():
	queue_free()
	pass
