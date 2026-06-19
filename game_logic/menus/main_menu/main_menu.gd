class_name MainMenu
extends CanvasLayer


func _on_play_button_pressed() -> void:
	pass
	#MainSignalBus.requested_scene_change.emit(null, null)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
