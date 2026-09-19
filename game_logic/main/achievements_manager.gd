extends Node
class_name AchievementsManager

# Achievements must have same name in steam, google play and here

signal achieved(achievement: String)

enum Achievement{
	
}

var achievements: Dictionary[String, bool]

func _ready() -> void:
	for key: String in Achievement.keys():
		achievements[key] = false

func set_achievement(achievement: String) -> void:
	if not achievements.has(achievement):
		print("This achievement does not exist locally: %s" % achievement)
		return
	if achievements[achievement] == true:
		print("already achieved: ", achievement)
		return
	achievements[achievement] = true
	# convert enum to string and send it in signal
	print("achieved: ", achievement)
	achieved.emit(achievement)
