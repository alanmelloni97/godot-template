class_name GameWonMenu
extends Control

signal quit

@export var main_menu_button: Button


func _ready() -> void:
	main_menu_button.pressed.connect(quit.emit)
