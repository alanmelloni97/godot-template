@icon("res://assets/godot_icons/icon_hammer.png")
class_name PlatformConfig
extends Node

@export var desktop_fullscreen: bool
@export var mobile_fullscreen: bool
@export var mobile_stretch_aspect: bool


func _ready() -> void:
	# only apply on release
	if OS.is_debug_build():
		return
	# Always
	ProjectSettings.set_setting("input_devices/pointing/emulate_touch_from_mouse", false)
	# Mobile
	if DisplayServer.is_touchscreen_available():
		if mobile_fullscreen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		if mobile_stretch_aspect:
			ProjectSettings.set_setting("display/window/stretch/aspect", "expand")
	# Desktop
	else:
		if desktop_fullscreen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
