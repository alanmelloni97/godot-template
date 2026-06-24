extends Node

class_name LevelHandler

@export var finish_point: FinishPoint
@export var level: Level
@export var vehicle: Vehicle
@export var ui_manager: UIManager


func _ready() -> void:
	finish_point.finished.connect(_on_level_finished)
	ui_manager.restart.connect(_on_restart)
	ui_manager.paused.connect(_on_pause)
	ui_manager.quit.connect(_on_quit)
	ui_manager.next_level.connect(_on_next_level)


func _on_level_finished():
	vehicle.disable_input(true)
	level.won.emit()


func _on_restart():
	level.get_tree().reload_current_scene()


func _on_quit():
	MainSignalBus.requested_scene_change.emit(Scenes.main_menu)


func _on_next_level():
	MainSignalBus.requested_scene_change.emit(Scenes.levels[Game.game_stats.current_level + 1])


func _on_pause(paused: bool):
	get_tree().paused = paused
