class_name Utilities
extends Resource


# Global helper functions
static func get_random_point_in_rect(rect: Rect2):
	var x = randf_range(rect.position.x, rect.position.x + rect.size.x)
	var y = randf_range(rect.position.y, rect.position.y + rect.size.y)
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
