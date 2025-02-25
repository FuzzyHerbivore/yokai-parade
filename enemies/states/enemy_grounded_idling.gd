extends EnemyStateCatchable


func enter(p_previous_state):
	super.enter(p_previous_state)

	parent.enter_animation_state_idling()


func physics_process(delta):
	parent.handle_gravity(delta)
	parent.move_and_slide()

	return check_caught()
