class_name SpecificSceneLogic
extends Node

# script that checks game specific things
@export var scene_manager: SceneManager


func manage_before_changing_scene(current_scene: Node):
	# Check current scene data before changing
	pass


func manage_after_changing_scene(new_scene: Node):
	# Set up next scene
	pass
