@icon("res://assets/godot_icons/icon_map.png")
class_name Main
extends Node

@export var save_system: SaveSystem
@export var music_manager: MusicManager
@export var scene_manager: SceneManager


func _ready() -> void:
	main()


func main():
	# Start game
	save_system.load_game()
	scene_manager.change_to_scene(Scenes.main_menu)
