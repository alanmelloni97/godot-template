class_name LevelsMenu
extends CanvasLayer

## Changes to level when signaled from LevelMenuLogic

@export var levels_menu_logic: LevelsMenuManager

func _ready() -> void:
	levels_menu_logic.level_chosen.connect(_on_level_selected)


func _on_level_selected(level_sc: PackedScene):
	var level: Level = level_sc.instantiate()
	var level_id: int = level.level_id
	MainSignalBus.requested_scene_change.emit(Scenes.levels[level_id - 1], null)


func _on_back_button_pressed() -> void:
	MainSignalBus.requested_scene_change.emit(Scenes.main_menu, null)
