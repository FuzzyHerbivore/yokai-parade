class_name EnemyState
extends State


var state_animations_scene


func init(p_parent):
	super.init(p_parent)

	state_animations_scene = parent.get_state_animations_scene()
