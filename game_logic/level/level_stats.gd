extends Resource
class_name LevelStats

signal fuel_emptied()
signal fuel_refilled()
signal ink_emptied()
signal ink_refilled()

@export var fuel: float:
	set(x):
		if x <= 0:
			fuel = 0
			fuel_emptied.emit()
		elif x >= MAX_FUEL:
			fuel = MAX_FUEL
		if fuel <= 0 and x > 0:
			fuel_refilled.emit()
		fuel = x
		emit_changed()
@export var ink: float:
	set(x):
		if x <= 0:
			ink = 0
			ink_emptied.emit()
		elif x >= MAX_INK:
			ink = MAX_INK
		if ink <= 0 and x > 0:
			ink_refilled.emit()
		ink = x
		emit_changed()
var MAX_FUEL: float
var MAX_INK: float

func _init() -> void:
	MAX_FUEL = fuel
	MAX_INK = ink
