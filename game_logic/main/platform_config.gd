@icon("res://assets/godot_icons/icon_hammer.png")
class_name PlatformConfig
extends Node

@export var desktop_fullscreen: bool
@export var mobile_fullscreen: bool


func _ready() -> void:
	# only apply on release
	if not OS.is_debug_build() and not OS.has_feature("web"):
		# Mobile
		if DisplayServer.is_touchscreen_available():
			if mobile_fullscreen:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		# Desktop
		else:
			if desktop_fullscreen:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
