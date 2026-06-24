extends Node
class_name VehicleHandler

@export var level: Level
@export var vehicle: Vehicle


func _ready() -> void:
	level.stats.fuel_emptied.connect(_on_fuel_emptied)
	level.stats.fuel_refilled.connect(_on_fuel_refilled)
	
	
func _on_fuel_emptied():
	vehicle.disable_input(true)
	
func _on_fuel_refilled():
	vehicle.disable_input(false)
