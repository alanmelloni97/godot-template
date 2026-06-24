extends RigidBody2D
class_name Vehicle

@warning_ignore_start("unused_signal")
signal picked(pick: Pickable)

@export var movement_controller: MovementController

func disable_input(disabled: bool):
	movement_controller.enabled = not disabled
