class_name QuitButtonWeb
extends Button


func _ready() -> void:
	if OS.get_name() == "Web":
		hide()
