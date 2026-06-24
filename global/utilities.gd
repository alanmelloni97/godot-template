class_name Utilities
extends Resource


# Global helper functions
static func play_audio_post_mortem(audio_stream_player: AudioStreamPlayer2D, new_parent: Node) -> void:
	audio_stream_player.play()
	audio_stream_player.reparent(new_parent)
	audio_stream_player.finished.connect(audio_stream_player.queue_free)


static func get_random_point_in_rect(rect: Rect2):
	var x = randf_range(rect.position.x, rect.position.x + rect.size.x)
	var y = randf_range(rect.position.y, rect.position.y + rect.size.y)
	return Vector2(x, y)


# for when a collision shape with a rectangleshape2d is used to define a rectangle in editor
static func get_random_point_in_rectangle_shape(rectangle_shape: RectangleShape2D):
	var x = randf_range(-rectangle_shape.size.x / 2, rectangle_shape.size.x / 2)
	var y = randf_range(-rectangle_shape.size.y / 2, rectangle_shape.size.y / 2)
	return Vector2(x, y)


static func duplicate_astar_grid(old_grid: AStarGrid2D) -> AStarGrid2D:
	# Copy grid data
	var new_grid: AStarGrid2D = AStarGrid2D.new()
	new_grid.cell_shape = old_grid.cell_shape
	new_grid.cell_size = old_grid.cell_size
	new_grid.default_compute_heuristic = old_grid.default_compute_heuristic
	new_grid.default_estimate_heuristic = old_grid.default_estimate_heuristic
	new_grid.diagonal_mode = old_grid.diagonal_mode
	new_grid.jumping_enabled = old_grid.jumping_enabled
	new_grid.offset = old_grid.offset
	new_grid.region = old_grid.region
	new_grid.update()
	# Set solid points from old grid
	var old_point_data: Array[Dictionary] = old_grid.get_point_data_in_region(old_grid.region)
	for old_point in old_point_data:
		if old_point.solid:
			new_grid.set_point_solid(old_point.id)
	return new_grid



static func create_collision_polygon_from_sprite(_sprite: Sprite2D, _parent: Node2D) -> void:
	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(_sprite.texture.get_image())

	var polys = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, _sprite.texture.get_size()))
	for poly in polys:
		var collision_polygon = CollisionPolygon2D.new()
		collision_polygon.polygon = poly
		collision_polygon.position = _sprite.position
		_parent.add_child.call_deferred(collision_polygon)

		# Generated polygon will not take into account the half-width and half-height offset
		# of the image when "centered" is on. So move it backwards by this amount so it lines up.
		if _sprite.centered:
			collision_polygon.position -= bitmap.get_size() / 2.0
