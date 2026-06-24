extends Node
class_name UIHandler

@export var level: Level
@export var ui_manager: UIManager


func _ready() -> void:
	level.won.connect(_on_level_won)
	
func _on_level_won():
	ui_manager.show_won_menu()
