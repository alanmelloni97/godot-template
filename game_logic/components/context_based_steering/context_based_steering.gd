class_name ContextBasedSteering
extends Node

# Based on: https://kidscancode.org/godot_recipes/3.x/ai/context_map/index.html
@export var agent: Node2D

var ray_directions: Array[Vector2]
var interest: Array[float]
var danger: Array[float]
var num_rays: int = 8
var target_position: Vector2
var chosen_dir: Vector2 = Vector2.ZERO


func _ready() -> void:
	ray_directions.resize(num_rays)
	interest.resize(num_rays)
	danger.resize(num_rays)
	for i in num_rays:
		var angle = i * 2 * PI / num_rays
		ray_directions[i] = Vector2.RIGHT.rotated(angle)


func _physics_process(_delta):
	set_interest()
	set_danger()
	choose_direction()


func set_interest():
	for i in num_rays:
		# rotation is the agent rotation
		var target_direction: Vector2 = agent.global_position.direction_to(target_position)
		var d = ray_directions[i].rotated(agent.rotation).dot(target_direction)
		interest[i] = max(0, d)


func set_danger():
	pass


func choose_direction():
	# Eliminate interest in slots with danger
	for i in num_rays:
		if danger[i] > 0.0:
			interest[i] = 0.0
	# Choose direction based on remaining interest
	chosen_dir = Vector2.ZERO
	for i in num_rays:
		chosen_dir += ray_directions[i] * interest[i]
		chosen_dir = chosen_dir.normalized()
