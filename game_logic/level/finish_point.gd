extends Area2D
class_name FinishPoint

signal finished()

func _on_body_entered(body: Node2D) -> void:
	if body is Vehicle:
		finished.emit()
