extends Node
class_name BrushHandler

@export var level: Level
@export var paint_manager: PaintManager

func _ready() -> void:
	level.stats.ink_emptied.connect(_on_ink_emptied)
	level.stats.ink_refilled.connect(_on_ink_refilled)
	
func _on_ink_emptied():
	paint_manager.has_ink = false
	

func _on_ink_refilled():
	paint_manager.has_ink = true
