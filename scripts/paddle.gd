extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	var mousex = get_viewport().get_mouse_pos().x
	var y = get_pos().y
	set_pos(Vector2(mousex, y))