class_name LevelsScroller
extends Control

## Adds a level button for each level present in Scenes.levels
signal level_pressed(level: PackedScene)

@export var _levels_container: Control
@export var _level_button_sc: PackedScene


func add_levels(levels: Array[PackedScene], current_level: int):
	for level: PackedScene in levels:
		var level_instance: Level = level.instantiate()
		var level_button: Button = _level_button_sc.instantiate()
		level_button.text = str(level_instance.level_id)
		level_button.pressed.connect(_on_level_pressed.bind(level))
		_levels_container.add_child(level_button)
		if level_instance.level_id > current_level:
			level_button.disabled = true


func _on_level_pressed(level: PackedScene):
	level_pressed.emit(level)
