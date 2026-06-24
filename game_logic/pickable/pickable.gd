extends Area2D

class_name Pickable

enum Pick { INK, FUEL }

@export var pick: Pick
@export var amount: int


func _on_area_entered(_area: Area2D) -> void:
	queue_free.call_deferred()
