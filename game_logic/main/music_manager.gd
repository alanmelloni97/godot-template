@icon("res://assets/godot_icons/icon_audio.png")
class_name MusicManager
extends Node

@export var audio_stream_player: AudioStreamPlayer
@export var fade_in_seconds: float
@export var fade_out_seconds: float
@export var fade_db: int

var tween: Tween


func stop_music() -> void:
	# check for tween (first time will be null)
	if tween and tween.is_running():
		tween.kill()
	tween = get_tree().create_tween()
	tween \
			.tween_property(audio_stream_player, "volume_db", fade_db, fade_out_seconds) \
			.set_trans(Tween.TRANS_CUBIC) \
			.set_ease(Tween.EASE_IN)


func play_music() -> void:
	# check for tween (first time will be null)
	if tween and tween.is_running():
		tween.kill()
	tween = get_tree().create_tween()
	tween \
			.tween_property(audio_stream_player, "volume_db", 0, fade_in_seconds) \
			.set_trans(Tween.TRANS_CUBIC) \
			.set_ease(Tween.EASE_OUT)
