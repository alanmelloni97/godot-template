extends Node
# Autoload: SignalBus

# Only signals that communicate with scripts in Main. Don't use to commmunicate between other scenes

@warning_ignore_start("unused_signal")
# Game Events
signal gameplay_started
signal gameplay_stopped
signal happy_moment

# Ads
signal interstitial_requested
signal interstitial_ended
signal rewarded_ad_requested
signal rewarded_ad_ended
