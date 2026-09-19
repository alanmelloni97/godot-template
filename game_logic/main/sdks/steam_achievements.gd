extends Node
class_name SteamAchievements

@export var ach_man: AchievementsManager


func start() -> void:
	ach_man.achieved.connect(_steam_set_achievement)


func _steam_set_achievement(this_achievement: String) -> void:
	if not Steam.setAchievement(this_achievement):
		print("Steam: Failed to set achievement: %s" % this_achievement)
		return
	print("Steam: Set acheivement: %s" % this_achievement)
	_store_steam_data()


func _store_steam_data() -> void:
	if not Steam.storeStats():
		print("Steam: Failed to store data on Steam, should be stored locally")
		return
	print("Steam: Data successfully sent to Steam")
