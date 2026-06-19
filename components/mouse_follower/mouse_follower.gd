class_name MouseFollowerComponent
extends Node

@export var object: Node2D

var offset: Vector2


func _physics_process(_delta: float) -> void:
	object.global_position = object.get_global_mouse_position() - offset
