extends Area2D

class_name PickerController

@export var vehicle: RigidBody2D


func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area2D):
	if area is Pickable:
		vehicle.picked.emit(area)
