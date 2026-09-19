extends Node2D
class_name Level


func request_scene_change(scene: PackedScene) -> void:
	var scene_data: LevelSceneData = LevelSceneData.new()
	MainSignals.scene_change_requested.emit(scene, scene_data)
