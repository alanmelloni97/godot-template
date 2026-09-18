class_name SelectableComponent
extends Area2D

signal selected(selected: bool)

@export var parent: Node2D # used from outside to know what was selected


func select():
	selected.emit(true)


func deselect():
	selected.emit(false)
