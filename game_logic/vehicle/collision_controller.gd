extends Area2D
class_name CollisionController

@export var vehicle: Vehicle

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node2D):
	vehicle.queue_free()
