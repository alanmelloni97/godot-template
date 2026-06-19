class_name IndependentTransform
extends Node2D

# only share position with parent, not rotation. Useful to have child of rigidbody but
# without it following its rotation
@export var parent: Node2D

var initial_relative_pos: Vector2


func _ready() -> void:
	initial_relative_pos = position
	top_level = true


func _physics_process(_delta: float) -> void:
	if parent:
		global_position = parent.global_position + initial_relative_pos
