class_name SaveSystem
extends Node

var _save_path: NodePath


func _ready() -> void:
	if OS.is_debug_build(): # If running on editor or debug build
		_save_path = "res://main/save_system/save_game.tres"
	else: # if release build
		_save_path = "user://save_game.tres"


func save_game():
	save_game_static()
	save_game_dynamic()


func save_game_static():
	# save things that are inherent to the whole game, like money and game progress,
	# things that there is one one of them
	var game_save: GameSave = GameSave.new()
	# call save method on all scenes that are on the saveable group
	get_tree().call_group("saveable_static", "save_data", game_save)
	var save_result: Error = ResourceSaver.save(game_save, _save_path)
	if save_result != Error.OK:
		push_error("Problem while saving:", save_result)


func save_game_dynamic():
	# save things that are not static, like all entities in a map. There could be
	# many of these things and i can not know in advance how many of them
	
	# call save method on all scenes that are on the saveable group
	pass


func load_game():
	load_game_static()
	load_game_dynamic()


func load_game_static():
	if ResourceLoader.exists(_save_path):
		var game_save: GameSave = ResourceLoader.load(_save_path)
		get_tree().call_group("saveable_static", "load_data", game_save)


func load_game_dynamic():
	pass
