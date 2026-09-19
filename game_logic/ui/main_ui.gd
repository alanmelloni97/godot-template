class_name MainUI
extends CanvasLayer

signal game_paused
signal game_unpaused
signal game_quit
signal main_menu_requested
signal retry_requested

@export var pause_button: Button
@export var _pause_menu: PauseMenu
@export var _game_over_menu: GameOverMenu


func _ready() -> void:
	pause_button.pressed.connect(_on_pause_button_pressed)
	_pause_menu.unpaused.connect(_on_pause_menu_unpaused)
	_pause_menu.quit_game.connect(_on_pause_menu_quit_game)
	# DIRECT RESIGNAL
	_game_over_menu.main_menu_pressed.connect(main_menu_requested.emit)
	_game_over_menu.retry_pressed.connect(retry_requested.emit)


func show_game_over_menu() -> void:
	_game_over_menu.show_animated()


func hide_pause_menu() -> void:
	pause_button.hide()
	_pause_menu.hide()


func _on_pause_button_pressed() -> void:
	_pause_menu.show_animated()
	game_paused.emit()


func _on_pause_menu_quit_game() -> void:
	game_unpaused.emit()
	game_quit.emit()


func _on_pause_menu_unpaused() -> void:
	_pause_menu.hide_animated()
	game_unpaused.emit()
