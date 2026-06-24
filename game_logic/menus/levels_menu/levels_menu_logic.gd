extends Node

class_name LevelsMenuManager

signal level_chosen(level: PackedScene)

@export var levels_scroller: LevelsScroller
@export var level_preview: TextureRect
@export var start_button: Button
var current_level: PackedScene = null # to keep track of currently selected level


func _ready() -> void:
	levels_scroller.add_levels(Scenes.levels, Game.game_stats.levels_beaten)
	levels_scroller.level_pressed.connect(_on_level_pressed)
	start_button.pressed.connect(_on_start_pressed)


func _on_level_pressed(level_sc: PackedScene):
	# first time:
	if start_button.disabled:
		start_button.disabled = false
	current_level = level_sc
	var level_inst: Level = level_sc.instantiate()
	level_preview.texture = level_inst.icon


func _on_start_pressed():
	level_chosen.emit(current_level)
