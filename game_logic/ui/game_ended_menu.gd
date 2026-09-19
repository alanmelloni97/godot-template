class_name GameOverMenu
extends Control

signal retry_pressed
signal main_menu_pressed

@export var show_animation: MenuScaleAnimation
@export var _retry_button: Button
@export var _main_menu_button: Button


func _ready() -> void:
	_retry_button.pressed.connect(_on_retry_button_pressed)
	_main_menu_button.pressed.connect(_on_main_menu_button_pressed)


func show_animated() -> void:
	show_animation.scale_in_animation()


func _on_retry_button_pressed() -> void:
	retry_pressed.emit()


func _on_main_menu_button_pressed() -> void:
	main_menu_pressed.emit()
