extends Node
class_name MousePainter

signal added_point()
signal added_line()


@export var POINT_DISTANCE: float = 10
@export var map: Node2D
@export var line: PackedScene
var last_point: Vector2
var current_static_body: StaticBody2D = StaticBody2D.new()
var points_placed: int = 1
var is_painting: bool

func _ready() -> void:
	map.add_child.call_deferred(current_static_body)

# TODO: parar linea cuando se encuentra con un rigidbody
func _unhandled_input(_event: InputEvent) -> void:
	var mouse_pos: Vector2 = map.get_global_mouse_position()
	if Input.is_action_just_pressed("draw"):
		last_point = mouse_pos
	elif Input.is_action_just_released("draw"):
		finish_collider()
	if not Input.is_action_pressed("draw"):
		return
	var mouse_distance: float = last_point.distance_to(mouse_pos)
	if mouse_distance > POINT_DISTANCE:
		place_collider(last_point, mouse_pos)
		draw_line(last_point, mouse_pos)
		last_point = mouse_pos


func place_collider(a: Vector2, b: Vector2):
	var new_collision_shape: CollisionShape2D = CollisionShape2D.new()
	var new_segment: SegmentShape2D = SegmentShape2D.new()
	new_segment.a = a
	new_segment.b = b
	new_collision_shape.shape = new_segment
	current_static_body.add_child(new_collision_shape)
	points_placed += 1
	is_painting = true
	added_point.emit()


func draw_line(a: Vector2, b: Vector2):
	var new_line: Line2D = line.instantiate()
	new_line.add_point(a)
	new_line.add_point(b)
	add_child(new_line)


func finish_collider():
	current_static_body = StaticBody2D.new()
	map.add_child(current_static_body)
	is_painting = false
	added_line.emit()
