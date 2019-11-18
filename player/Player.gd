extends KinematicBody2D

enum Movement {
	Walking,
	Running
}
export var movement_speeds = {
	Movement.Walking: 64.0,
	Movement.Running: 128.0
}
onready var movement_speed = movement_speeds[Movement.Running]

var linear_velocity = Vector2()
var velocity = Vector2()

onready var animation_player = $AnimationPlayer

func _process(delta):
	process_movement(delta)

func process_movement(delta):
	var direction = Vector2.ZERO
	
	# Vertical
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	elif Input.is_action_pressed("ui_down"):
		direction.y += 1
	
	# Horizontal
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	elif Input.is_action_pressed("ui_right"):
		direction.x += 1
	
	linear_velocity = direction * movement_speed
	
	velocity = move_and_slide(linear_velocity)