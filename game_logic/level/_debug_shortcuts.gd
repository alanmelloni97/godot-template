extends Node


# emit signals with keys to debug
func _unhandled_input(_event: InputEvent) -> void:
	if OS.is_debug_build():
		if Input.is_key_pressed(KEY_KP_0):
			pass
		elif Input.is_key_pressed(KEY_KP_1):
			pass
