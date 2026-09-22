extends TextureProgressBar
class_name AnimatedProgressBar

@export var low_value_anim_percent: float = 0.2
@export var anim_time: float = 0.3
var tween: Tween
var initial_progress_tint: Color


func _ready() -> void:
	value_changed.connect(_on_value_changed)
	initial_progress_tint = tint_progress
	_on_value_changed(value) # check if bar starts with low value and needs to animate


func _on_value_changed(bar_value: float) -> void:
	if bar_value < (max_value * low_value_anim_percent):
		animate_low_value_bar()
		print("Bar value is below low value threshold, starting animation.")
	else:
		if tween:
			tween.kill()
		tint_progress = initial_progress_tint
		print("Bar value is above low value threshold, stopping animation and resetting tint.")


func animate_low_value_bar() -> void:
	if tween:
		tween.kill()
	tween = create_tween().set_loops().set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "tint_progress", Color.GRAY, anim_time)
	tween.tween_property(self, "tint_progress", initial_progress_tint, anim_time)
