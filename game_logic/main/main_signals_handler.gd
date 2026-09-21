class_name MainSignalsHandler
extends Node

# responds to signals of MainSignalBus connecting them with their manager

@export var save_system: SaveSystem
@export var scene_manager: SceneManager


func _ready() -> void:
	MainSignals.save_game_requested.connect(save_system.save_game)
	MainSignals.scene_change_requested.connect(scene_manager.change_to_scene)
