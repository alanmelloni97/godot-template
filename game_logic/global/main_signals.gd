extends Node
# Autoload: MainSignals

# Only signals that communicate with scripts in Main. Don't use to commmunicate between other scenes

@warning_ignore_start("unused_signal")

# Scene management
signal scene_change_requested(scene: PackedScene, scene_data: SceneData)

# Save game
signal save_game_requested

# Game Events
signal gameplay_started
signal gameplay_stopped
signal happy_moment

# Ads
signal interstitial_requested
signal interstitial_ended(succeeded: bool)
signal rewarded_ad_requested
signal rewarded_ad_ended(succeeded: bool)

# Review for android and ios
signal review_requested

# Achievements
signal won_level
