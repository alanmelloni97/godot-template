class_name QuitButtonWeb
extends Button


func _ready() -> void:
	if OS.has_feature("Web") or OS.has_feature("mobile"):
		hide()
