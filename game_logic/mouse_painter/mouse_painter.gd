extends Node

class_name MousePainter

signal added_point()
signal added_line()
signal cant_start_line()
signal cant_continue_line()

enum State { IDLE, DRAWING, BLOCKED}

@export var map: Node2D
@export var line: PackedScene
@export var mouse_detector: Area2D
@export var POINT_DISTANCE: float = 10
var last_point: Vector2
var current_static_body: StaticBody2D
var points_placed: int = 1
var state: State = State.IDLE

func _ready() -> void:
	_add_static_body.call_deferred()

func _physics_process(delta: float) -> void:
	print(points_placed)
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
	if mouse_detector.has_overlapping_bodies():
		cant_start_line.emit()
		return
	last_point = mouse_pos
	try_placement(mouse_pos)
		
		
		
func try_placement(mouse_pos: Vector2) -> bool:
	if mouse_detector.has_overlapping_bodies():
		print(mouse_detector.get_overlapping_bodies())
		cant_continue_line.emit()
		finish_line()
		state = State.BLOCKED
		return false
	var mouse_distance: float = last_point.distance_to(mouse_pos)
	if mouse_distance > POINT_DISTANCE:
		place_line_collider(last_point, mouse_pos)
		draw_segment(last_point, mouse_pos)
		last_point = mouse_pos
		state = State.DRAWING
		return true
	return false


func place_line_collider(a: Vector2, b: Vector2):
	var new_collision_shape: CollisionShape2D = CollisionShape2D.new()
	var new_segment: SegmentShape2D = SegmentShape2D.new()
	new_segment.a = a
	new_segment.b = b
	new_collision_shape.shape = new_segment
	current_static_body.add_child(new_collision_shape)
	points_placed += 1
	added_point.emit()


func draw_segment(a: Vector2, b: Vector2):
	var new_line: Line2D = line.instantiate()
	new_line.add_point(a)
	new_line.add_point(b)
	add_child(new_line)


func finish_line():
	_add_static_body()
	added_line.emit()


func _add_static_body():
	current_static_body = StaticBody2D.new()
	current_static_body.set_collision_layer_value(1, false)
	current_static_body.set_collision_layer_value(2, true)
	map.add_child(current_static_body)
