class_name DebugVersionWarning
extends CanvasLayer

@export var label: Label


func _ready() -> void:
	if OS.is_debug_build():
		label.show()
