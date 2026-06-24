extends Control
class_name WonMenu

signal next_level_pressed
signal level_menu_pressed



func _on_next_level_button_pressed() -> void:
	next_level_pressed.emit()


func _on_level_menu_pressed_pressed() -> void:
	level_menu_pressed.emit()
