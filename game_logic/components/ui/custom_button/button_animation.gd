extends Node

@export var button: Button
@export var anim_time: float
@export var scale_hover: Vector2
@export var rotation_hover: float
@export var modulate_hover: Color
@export var scale_pressed: Vector2
@export var modulate_pressed: Color
var tween: Tween
var initial_scale: Vector2
var initial_rotation: float
var initial_modulate: Color


func _ready() -> void:
	button.pivot_offset_ratio = Vector2(0.5, 0.5) # set offset in middle of button
	button.mouse_entered.connect(_on_hover_animation)
	button.mouse_exited.connect(_on_unhover_animation)
	button.button_down.connect(_on_button_down_animation)
	button.button_up.connect(_on_button_up_animation)
	initial_scale = button.scale
	initial_rotation = button.rotation
	initial_modulate = button.modulate


func _on_hover_animation() -> void:
	if tween:
		tween.kill()
	tween = create_tween().set_parallel()
	tween.tween_property(button, "scale", scale_hover, anim_time)
	tween.tween_property(
		button,
		"rotation_degrees",
		randf_range(-rotation_hover, rotation_hover),
		anim_time,
	)
	tween.tween_property(button, "modulate", modulate_hover, anim_time)


func _on_unhover_animation() -> void:
	if tween:
		tween.kill()
	tween = create_tween().set_parallel()
	tween.tween_property(button, "scale", initial_scale, anim_time)
	tween.tween_property(button, "rotation_degrees", initial_rotation, anim_time)
	tween.tween_property(button, "modulate", initial_modulate, anim_time)


func _on_button_down_animation() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(button, "scale", scale_pressed, anim_time)
	tween.tween_property(button, "modulate", modulate_pressed, anim_time)


func _on_button_up_animation() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(button, "scale", scale_hover, anim_time)
	tween.tween_property(button, "modulate", modulate_hover, anim_time)
