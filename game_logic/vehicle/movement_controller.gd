extends Node
class_name MovementController

@export var wheels: Array[RigidBody2D]
@export var FORCE: float
@export var MAX_FORWARD_SPEED: float
@export var MAX_BACKWARD_SPEED: float

func _physics_process(_delta: float) -> void:
	var input: float = Input.get_axis("brake", "accelerate")
	if not input:
		return
	if not is_at_max_speed(input):
		return
	for wheel in wheels:
		wheel.apply_torque(input * FORCE)
	
	
func is_at_max_speed(input: float) -> bool:
	if input > 0.2:
		if wheels[0].linear_velocity.x > MAX_FORWARD_SPEED:
			return false
	elif input < - 0.2:
		if wheels[0].linear_velocity.x < - MAX_BACKWARD_SPEED:
			return false
	return true
