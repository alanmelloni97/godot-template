class_name MenuScaleAnimation
extends Node

@export var obj: Control
@export var t_anim: float
@export var trans_anim: Tween.TransitionType
@export var ease_anim: Tween.EaseType

var tween: Tween


func scale_in_animation() -> void:
	if tween:
		tween.kill()
	tween = create_tween().set_trans(trans_anim).set_ease(ease_anim)
	obj.show()
	tween.tween_property(obj, "scale", Vector2.ONE, t_anim).from(Vector2.ZERO)


func scale_out_animation() -> void:
	if tween:
		tween.kill()
	tween = create_tween().set_trans(trans_anim).set_ease(ease_anim)
	tween.tween_property(obj, "scale", Vector2.ZERO, t_anim)
	#tween.tween_callback(obj.hide)
