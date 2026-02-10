class_name SceneManager
extends Node

# Generic SceneManagerScript
# Signals emitted by child SpecificSceneLogic
# Scripts that implemet scenes change or save must have signals called:
# scene_requested
# save_requested
@warning_ignore_start("unused_signal")
signal save_requested
signal level_won

@export var specific_scene_logic: SpecificSceneLogic

var current_scene: Node:
	set(x):
		current_scene = x
		get_tree().current_scene = x


func _on_before_scene_changed():
	specific_scene_logic.manage_before_changing_scene(current_scene)


func _instantiate_scene(scene: PackedScene) -> Node:
	# First remove current scene
	if current_scene != null: # to be able to call on _ready
		current_scene.queue_free()
	return scene.instantiate()


func _on_after_scene_instantiated(inst: Node):
	specific_scene_logic.manage_after_changing_scene(inst)


func _add_instanced_scene_to_tree(inst: Node):
	# add child is deferred to be called on ready.
	# set current scene deferred to wait until child was added
	get_tree().root.add_child.call_deferred(inst)
	_set_current_scene.call_deferred(inst)
	_connect_to_scene_signals(inst)


func _change_to_scene(scene: PackedScene):
	_on_before_scene_changed()
	var inst: Node = _instantiate_scene(scene)
	_on_after_scene_instantiated(inst)
	_add_instanced_scene_to_tree(inst)


func _set_current_scene(scene):
	current_scene = scene


func _connect_to_scene_signals(inst: Node):
	if inst.has_signal("scene_requested"):
		inst.scene_requested.connect(_change_to_scene)
	else:
		printerr("no scene requested signal")
	if inst.has_signal("save_requested"):
		inst.save_requested.connect(save_requested.emit)
