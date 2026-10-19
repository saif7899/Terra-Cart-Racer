extends CharacterBody2D

@export var maxSpeed = 150
@export var accel = 70
@export var friction = 50 #speed of slowing down 
@export var rotSpeed = 3

var dir = 0
var currentSpeed = 0
var throttle

func _physics_process(delta: float) -> void:
	dir = Input.get_axis("ui_left","ui_right")
	rotation += rotSpeed * delta * dir
	
	throttle = Input.get_axis("brake","accelerate")
	
	if throttle != 0:
		currentSpeed = move_toward(currentSpeed, throttle * maxSpeed, accel * delta)
	else:
		currentSpeed = move_toward(currentSpeed, 0, friction * delta)
		
	velocity = transform.x * currentSpeed
	move_and_slide()
