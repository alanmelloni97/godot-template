extends Node
class_name EraseManager

signal erased_segment()
@export var eraser_brush: Area2D

func _ready() -> void:
	eraser_brush.body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node2D):
	if Input.is_action_pressed("draw"):
		body.queue_free()
		erased_segment.emit()
