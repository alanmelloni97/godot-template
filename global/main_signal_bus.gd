extends Node

# Signals used to communicate from scripts to Main
@warning_ignore_start("unused_signal")
signal requested_save
signal requested_scene_change(new_sc: PackedScene, sc_data: SceneData)
