extends Node

# All sdks are disabled by default, enable required and call start() method on them (similar to _ready)

@export var steam_achievements: SteamAchievements
@export var steam_initializer: Node
@export var ads_admob: AdsAdmob
@export var debug_steam: bool


func _ready() -> void:
	if OS.has_feature("android"):
		_activate_sdk(ads_admob)
	elif OS.has_feature("steam") or (debug_steam and OS.is_debug_build() and OS.has_feature("pc")):
		_activate_sdk(steam_initializer)
		_activate_sdk(steam_achievements)


func _activate_sdk(sdk: Node) -> void:
	sdk.process_mode = Node.PROCESS_MODE_INHERIT
	@warning_ignore_start("unsafe_method_access")
	if sdk.has_method("start"):
		sdk.start()
	else:
		printerr("sdk doesnt have start() implemented")
