class_name UIManager
extends CanvasLayer

signal paused(paused: bool)
signal quit
signal restart
signal next_level
signal levels_menu

@export var _pause: PauseControl
@export var won_menu: WonMenu
@export var level: Level
@export var restart_button: Button

func _ready() -> void:
	# REDIRECT SIGNALS UP
	_pause.paused.connect(paused.emit.bind(true))
	_pause.unpaused.connect(paused.emit.bind(false))
	_pause.quit.connect(quit.emit)
	restart_button.pressed.connect(restart.emit)
	# SIGNAL CONNECTIONS

	# LOGIC

func show_won_menu():
	won_menu.show()
	won_menu.level_menu_pressed.connect(next_level.emit)
	won_menu.level_menu_pressed.connect(levels_menu.emit)
