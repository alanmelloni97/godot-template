class_name MainSignalsHandler
extends Node

# responds to signals of MainSignalBus connecting them with their manager

@export var save_system: SaveSystem
@export var scene_manager: SceneManager


func _ready() -> void:
	MainSignalBus.requested_save.connect(save_system.save_game)
	MainSignalBus.requested_scene_change.connect(scene_manager.change_to_scene)
