@icon("res://assets/godot_icons/icon_map.png")
class_name Main
extends Node

@export var save_system: SaveSystem
@export var music_manager: MusicManager
@export var preloading: Node


func _ready() -> void:
	main()


func main():
	# Start game
	save_system.load_game()
	SceneManager.change_to_scene(Scenes.main_menu)
