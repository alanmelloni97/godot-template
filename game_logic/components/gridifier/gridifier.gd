class_name GridifierComponent
extends Node

signal grid_position_changed

@export var _node: Node2D

var aux_pos: Vector2 = Vector2.ZERO
var _grid: Vector2i


func _physics_process(_delta: float) -> void:
	_node.position = _snap_position(_node.position)
	if _node.position.x != aux_pos.x or _node.position.y != aux_pos.y:
		grid_position_changed.emit()
	aux_pos = _snap_position(_node.position)


func _snap_position(position: Vector2) -> Vector2:
	position.x = snapped(position.x, _grid.x)
	position.y = snapped(position.y, _grid.x)
	return position
