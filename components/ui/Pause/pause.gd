class_name PauseControl
extends Control

signal paused
signal unpaused
signal quit

@export var _pause_menu: Control


func _on_pause_button_pressed() -> void:
	_pause_menu.show()
	paused.emit()


func _on_continue_button_pressed() -> void:
	_pause_menu.hide()
	unpaused.emit()


func _on_quit_button_pressed() -> void:
	unpaused.emit()
	quit.emit()
