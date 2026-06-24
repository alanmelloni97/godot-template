extends Node

class_name StatsHandler

@export var level: Level
@export var paint_manager: PaintManager
@export var vehicle: Vehicle

func _ready() -> void:
	paint_manager.added_segment.connect(_on_added_segment)
	vehicle.picked.connect(_on_picked)
	vehicle.force_applied.connect(_on_force_applied)

func _on_added_segment(length: float):
	level.stats.ink -= length


func _on_picked(_pick: Pickable):
	if _pick.pick == _pick.Pick.INK:
		level.stats.ink += _pick.amount
	elif _pick.pick == _pick.Pick.FUEL:
		level.stats.fuel += _pick.amount


func _on_force_applied(force: float):
	level.stats.fuel -= force
