class_name PauseMenu
extends Control

signal unpaused
signal quit_game

@export var continue_button: Button
@export var quit_button: Button
@export var scale_animation: MenuScaleAnimation


func _ready() -> void:
	continue_button.pressed.connect(_on_continue_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)


func show_animated() -> void:
	show()
	scale_animation.scale_in_animation()


func hide_animated() -> void:
	scale_animation.scale_out_animation()
	hide()


func _on_continue_button_pressed() -> void:
	unpaused.emit()


func _on_quit_button_pressed() -> void:
	quit_game.emit()
