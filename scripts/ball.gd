extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	delta = delta * 100
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("Bricks"):
			body.queue_free()
		
		if body.get_name() == 'Paddle':
			var speed = get_linear_velocity().length()
			var direction = get_pos() - body.get_node("Anchor").get_global_pos()
			var velocity = direction.normalized() * min((speed + 4) * delta, 300*delta)
			set_linear_velocity(velocity)
	
	if get_pos().y > get_viewport_rect().end.y:
		queue_free()