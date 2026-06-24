class_name PaintManager
extends Node


signal added_segment(length: float)
signal added_line()
signal cant_start_line()
signal cant_continue_line()
signal not_enough_ink()

enum State { IDLE, DRAWING, BLOCKED }

@export var map: Node2D
@export var segment: PackedScene
@export var mouse_pointer: Area2D
@export var POINT_DISTANCE: float = 10
var last_point: Vector2
var points_placed: int = 1
var state: State = State.IDLE
var has_ink: bool = true

func _physics_process(_delta: float) -> void:
	if not has_ink:
		not_enough_ink.emit()
		return
	var mouse_pos: Vector2 = map.get_global_mouse_position()
	if state == State.IDLE:
		if Input.is_action_just_pressed("draw"):
			try_start_line(mouse_pos)
			return
		elif Input.is_action_pressed("draw"):
			try_placement(mouse_pos)
	elif state == State.DRAWING:
		if Input.is_action_just_released("draw"):
			finish_line()
			state = State.IDLE
			return
		try_placement(mouse_pos)
	elif state == State.BLOCKED:
		if Input.is_action_just_released("draw"):
			state = State.IDLE


func try_start_line(mouse_pos: Vector2):
	if mouse_pointer.has_overlapping_bodies():
		cant_start_line.emit()
		return
	last_point = mouse_pos
	try_placement(mouse_pos)


func try_placement(mouse_pos: Vector2) -> bool:
	if mouse_pointer.has_overlapping_bodies():
		cant_continue_line.emit()
		finish_line()
		state = State.BLOCKED
		return false
	var mouse_distance: float = last_point.distance_to(mouse_pos)
	if mouse_distance > POINT_DISTANCE:
		place_segment(last_point, mouse_pos)
		last_point = mouse_pos
		state = State.DRAWING
		return true
	return false


func place_segment(a: Vector2, b: Vector2):
	var new_segment: Segment = segment.instantiate()
	new_segment.set_segment(a, b)
	map.add_child(new_segment)
	points_placed += 1
	added_segment.emit(a.distance_to(b))


func finish_line():
	added_line.emit()
