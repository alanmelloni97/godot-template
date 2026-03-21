class_name UISoundPlayer
extends Node

@export var button_pressed_sound: AudioStreamPlayer
@export var button_hovered_sound: AudioStreamPlayer


func _ready():
	# when _ready is called, there might already be nodes in the tree, so connect all existing buttons
	get_tree().node_added.connect(_on_scenetree_node_added)


func _on_scenetree_node_added(node):
	if node is Button:
		_connect_to_button(node)


func _connect_to_button(button: Button):
	button.pressed.connect(_on_button_pressed)
	button.mouse_entered.connect(_on_button_hovered)


func _on_button_pressed():
	button_pressed_sound.play()


func _on_button_hovered():
	button_hovered_sound.play()
