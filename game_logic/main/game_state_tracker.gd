extends Node

# react to game signals and call external SDKs


func _ready() -> void:
	SignalBus.gameplay_started.connect(_on_gameplay_start)
	SignalBus.gameplay_stopped.connect(_on_gameplay_stop)
	SignalBus.happy_moment.connect(_on_happy_moment)


func _on_gameplay_start():
	pass


func _on_gameplay_stop():
	pass


func _on_happy_moment():
	pass
