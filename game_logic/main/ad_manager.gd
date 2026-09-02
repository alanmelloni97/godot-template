extends Node


func _ready() -> void:
	if not OS.has_feature("poki"):
		queue_free()
	SignalBus.commercial_requested.connect(_on_commercial_requested)
	SignalBus.rewarded_ad_requested.connect(_on_rewarded_ad_requested)


func _on_commercial_requested():
	pass


func _on_rewarded_ad_requested():
	pass


func _on_commercial_done():
	SignalBus.commercial_ended.emit()


func _on_rewarded_ad_done(response):
	if response:
		SignalBus.rewarded_ad_ended.emit(true)
	else:
		SignalBus.rewarded_ad_ended.emit(false)
