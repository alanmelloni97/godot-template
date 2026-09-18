class_name LookatComponent
extends Node

@export var LERP_VALUE: float
@export var object: Node2D

var target: Node2D
var initial_rot: float


func _ready() -> void:
	initial_rot = object.rotation


func _process(_delta):
	if target != null:
		object.rotation = lerp_angle(object.rotation, object.global_position.direction_to(target.global_position).angle() + initial_rot, LERP_VALUE)
