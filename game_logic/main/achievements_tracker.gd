extends Node
class_name AchievementsTracker

# reacts to global signals and decides when to unlock achievement. Whether it
# has been achieved before or not is checked by achievementsManager
@export var ach_man: AchievementsManager


func _ready() -> void:
	pass
	# connect here to SDKsignals


func _set_achievement(ach: AchievementsManager.Achievement) -> void:
	# convert achievement to string and call achivement manager method
	ach_man.set_achievement(str(AchievementsManager.Achievement.keys()[ach]))
