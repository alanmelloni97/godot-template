class_name UIManager
extends CanvasLayer

signal paused
signal unpaused
signal quit

@export var _pause: PauseControl


func _ready() -> void:
	# REDIRECT SIGNALS UP
	_pause.paused.connect(paused.emit)
	_pause.unpaused.connect(unpaused.emit)
	_pause.quit.connect(quit.emit)
	# SIGNAL CONNECTIONS

	# LOGIC
