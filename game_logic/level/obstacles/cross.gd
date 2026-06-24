extends AnimatableBody2D

class_name Cross

@export var rot_vel: float
@export var sprite_2d: Sprite2D


func _physics_process(delta: float) -> void:
	rotation_degrees += delta * rot_vel

func _ready() -> void:
	Utilities.create_collision_polygon_from_sprite(sprite_2d, self)
