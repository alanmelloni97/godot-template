extends HBoxContainer
class_name ProgressBars

@export var ink_bar: ProgressBar
@export var fuel_bar: ProgressBar
@export var ui_manager: UIManager


func _ready() -> void:
	ui_manager.level.stats.changed.connect(_on_level_stats_changed)
	ink_bar.max_value = ui_manager.level.stats.ink
	fuel_bar.max_value = ui_manager.level.stats.fuel
	ink_bar.value = ink_bar.max_value
	
	
	
func _on_level_stats_changed():
	print(ink_bar.value)
	ink_bar.value = ui_manager.level.stats.ink
	fuel_bar.value = ui_manager.level.stats.fuel
