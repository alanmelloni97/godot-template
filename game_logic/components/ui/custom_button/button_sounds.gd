extends Node

@export var button: Button
@export var hover_sound: AudioStreamPlayer
@export var button_down_sound: AudioStreamPlayer
@export var button_pressed_sound: AudioStreamPlayer


func _ready() -> void:
	button.mouse_entered.connect(_on_hover_animation)
	button.button_down.connect(_on_button_down_animation)
	button.pressed.connect(_on_button_pressed_animation)


func _on_hover_animation() -> void:
	hover_sound.play()


func _on_button_down_animation() -> void:
	button_down_sound.play()


func _on_button_pressed_animation() -> void:
	button_pressed_sound.play()
