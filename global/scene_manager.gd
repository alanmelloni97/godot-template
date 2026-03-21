extends Node

# Autoload: SceneManager
static var aux_scene_data: SceneData

var current_scene: Node:
	set(x):
		current_scene = x
		get_tree().current_scene = x


func change_to_scene(scene: PackedScene, scene_data: SceneData = null):
	aux_scene_data = scene_data
	var inst: Node = _instantiate_scene(scene)
	_add_instanced_scene_to_tree(inst)


func _instantiate_scene(scene: PackedScene) -> Node:
	# First remove current scene
	if current_scene != null: # to be able to call on _ready
		current_scene.queue_free()
	return scene.instantiate()


func _add_instanced_scene_to_tree(inst: Node):
	# add child is deferred to be called on ready.
	# set current scene deferred to wait until child was added
	get_tree().root.add_child.call_deferred(inst)
	_set_current_scene.call_deferred(inst)


func _set_current_scene(scene):
	current_scene = scene
