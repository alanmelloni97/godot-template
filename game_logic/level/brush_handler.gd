extends Node
class_name BrushHandler

enum Brush{ PAINTER, ERASER}
@export var paint_manager: PaintManager
@export var erase_manager: EraseManager

var brush: Brush = Brush.PAINTER

func _ready() -> void:
	erase_manager.process_mode = Node.PROCESS_MODE_DISABLED

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("change_brush"):
		if brush == Brush.PAINTER:
			change_brush(Brush.ERASER)
		else:
			change_brush(Brush.PAINTER)
			

func change_brush(_brush: Brush):
	print(_brush)
	if _brush == Brush.PAINTER:
		erase_manager.process_mode = Node.PROCESS_MODE_DISABLED
		paint_manager.process_mode = Node.PROCESS_MODE_INHERIT
		brush = Brush.PAINTER
	else:
		paint_manager.process_mode = Node.PROCESS_MODE_DISABLED
		erase_manager.process_mode = Node.PROCESS_MODE_INHERIT
		brush = Brush.ERASER
		
