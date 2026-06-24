extends Node

class_name BrushChanger

enum Brush { NORMAL, BOUNCY, ERASER }
@export var paint_manager: PaintManager
@export var erase_manager: EraseManager

var brush: Brush = Brush.NORMAL


func _ready() -> void:
	erase_manager.process_mode = Node.PROCESS_MODE_DISABLED


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("change_brush"):
		if brush == Brush.NORMAL:
			change_brush(Brush.BOUNCY)
		elif brush == Brush.BOUNCY:
			change_brush(Brush.ERASER)
		else:
			change_brush(Brush.NORMAL)


func change_brush(_brush: Brush):
	if _brush == Brush.NORMAL:
		paint_manager.brush_type = PaintManager.BrushType.NORMAL
		erase_manager.process_mode = Node.PROCESS_MODE_DISABLED
		paint_manager.process_mode = Node.PROCESS_MODE_INHERIT
		brush = Brush.NORMAL
	elif _brush == Brush.BOUNCY:
		paint_manager.brush_type = PaintManager.BrushType.BOUNCY
		brush = Brush.BOUNCY
	else:
		paint_manager.process_mode = Node.PROCESS_MODE_DISABLED
		erase_manager.process_mode = Node.PROCESS_MODE_INHERIT
		brush = Brush.ERASER
