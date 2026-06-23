extends StaticBody2D
class_name Segment


@export var collision_shape_2d: CollisionShape2D
@export var line_2d: Line2D


func set_segment(a: Vector2, b: Vector2):
	collision_shape_2d.shape.a = a
	collision_shape_2d.shape.b = b
	line_2d.add_point(a)
	line_2d.add_point(b)
