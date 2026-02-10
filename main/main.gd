class_name Main
extends Node

@export var save_system: SaveSystem
@export var scene_manager: SceneManager


func _ready() -> void:
	scene_manager.save_requested.connect(save_system.save_game)
	main()


func main():
	# Start game
	save_system.load_game()
	scene_manager._change_to_scene(Scenes.main_menu)
