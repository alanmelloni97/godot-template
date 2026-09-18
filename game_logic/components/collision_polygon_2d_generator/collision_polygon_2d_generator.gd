class_name CollisionPolygonFromSpriteGenerator
extends Node

@export var _sprite_2d: Sprite2D
@export var _parent: Node2D


func _ready() -> void:
	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(_sprite_2d.texture.get_image())

	var polys = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, _sprite_2d.texture.get_size()))
	for poly in polys:
		var collision_polygon = CollisionPolygon2D.new()
		collision_polygon.polygon = poly
		collision_polygon.position = _sprite_2d.position
		_parent.add_child.call_deferred(collision_polygon)

		# Generated polygon will not take into account the half-width and half-height offset
		# of the image when "centered" is on. So move it backwards by this amount so it lines up.
		if _sprite_2d.centered:
			collision_polygon.position -= bitmap.get_size() / 2.0
