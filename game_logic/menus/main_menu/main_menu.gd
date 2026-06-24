class_name MainMenu
extends CanvasLayer


func _on_play_button_pressed() -> void:
	MainSignalBus.requested_scene_change.emit(Scenes.levels_menu, null)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
