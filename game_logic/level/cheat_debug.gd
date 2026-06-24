extends Node

@export var level_handler: LevelHandler

func _ready() -> void:
	if not OS.is_debug_build():
		queue_free()

func _unhandled_key_input(input_event: InputEvent) -> void:
	if input_event is InputEventKey:
		if input_event.pressed and input_event.keycode == KEY_KP_1:
			print("cheat: game won")
			level_handler._on_level_finished()
			
