class_name EffectsManager
extends Node

@export var _affected_node: Node
@export var _stackable_effects: bool = false

var current_effects: Array[Effect] # _remove_current_effect_if_duplicate() prevents having two of the same effect type


func add_effect(effect: Effect):
	if not _stackable_effects:
		_remove_current_effect_if_duplicate(effect)
	effect.apply_effect(_affected_node)
	get_tree().create_timer(effect.time).timeout.connect(_on_timer_timeout.bind(effect))
	current_effects.append(effect)


func _on_timer_timeout(effect: Effect):
	# check if effect is active, if not, a removed effect will trigger timer
	if effect in current_effects:
		effect.remove_effect(_affected_node)
		current_effects.erase(effect)


func _remove_current_effect_if_duplicate(effect: Effect):
	# if there is an active effect of the same type, remove it
	for current_effect in current_effects:
		if current_effect.get_script() == effect.get_script():
			current_effect.remove_effect(_affected_node)
			current_effects.erase(current_effect)
