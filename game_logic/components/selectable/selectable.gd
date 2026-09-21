class_name SelectableComponent
extends Area2D

# Used as an interface

signal selected(selected: bool)

@export var parent: Node2D # used from outside to know what was selected


func select() -> void:
	selected.emit(true)


func deselect() -> void:
	selected.emit(false)
