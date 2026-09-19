class_name UIHandler
extends Node

@export var _level: Level
@export var _main_ui: MainUI


func _ready() -> void:
	_main_ui.game_paused.connect(_on_game_paused)
	_main_ui.game_unpaused.connect(_on_game_unpaused)
	_main_ui.game_quit.connect(_on_game_quit)
	_main_ui.main_menu_requested.connect(_on_game_ended)
	_main_ui.retry_requested.connect(_on_retry_requested)


func _on_game_paused() -> void:
	get_tree().paused = true


func _on_game_unpaused() -> void:
	get_tree().paused = false


func _on_game_quit() -> void:
	_level.request_scene_change(Scenes.main_menu)


func _on_game_ended() -> void:
	pass


func _on_retry_requested() -> void:
	get_tree().reload_current_scene()
