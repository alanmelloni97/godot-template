extends Node
class_name SteamInitializer


func start() -> void:
	initialize_steam()


func initialize_steam() -> void:
	var initialize_response: Dictionary = Steam.steamInitEx()
	print("Did Steam initialize?: %s " % initialize_response)


func _process(_delta: float) -> void:
	Steam.run_callbacks()
