extends Node
class_name AdsAdmob

@export var interstitial_ad_id_prod: String = ""
@export var rewarded_ad_id_prod: String = ""
var interstitial_ad_id_debug: String = "ca-app-pub-3940256099942544/1033173712"
var rewarded_ad_id_debug: String = "ca-app-pub-3940256099942544/5224354917"
var interstitial_ad: InterstitialAd
var interstitial_loader: InterstitialAdLoader = InterstitialAdLoader.new()


func start() -> void:
	MainSignals.interstitial_requested.connect(_show_interstitial)
	MainSignals.rewarded_ad_requested.connect(_show_rewarded_ad)
	# Initialize Admob
	var listener: OnInitializationCompleteListener = OnInitializationCompleteListener.new()
	# when initialized, call ad load, for some reason the plugin uses this instead of signals
	listener.on_initialization_complete = func(_status: InitializationStatus) -> void:
		_loads_ads()
	MobileAds.initialize(listener)


func _loads_ads() -> void:
	_load_interstitial()
	_load_rewarded_ad()


func _load_interstitial() -> void:
	# set ad id
	var ad_unit_id: String
	if OS.is_debug_build():
		ad_unit_id = interstitial_ad_id_debug
	else:
		ad_unit_id = interstitial_ad_id_prod
	var callback: InterstitialAdLoadCallback = InterstitialAdLoadCallback.new()

	callback.on_ad_loaded = func(ad: InterstitialAd) -> void:
		interstitial_ad = ad
		print("Interstitial loaded. Ready to show.")
		_setup_interstitial_callbacks()

	callback.on_ad_failed_to_load = func(error: LoadAdError) -> void:
		print("Interstitial failed to load: ", error.message)

	interstitial_loader.load(ad_unit_id, AdRequest.new(), callback)


func _setup_interstitial_callbacks() -> void:
	if not interstitial_ad:
		return
	var callbacks: FullScreenContentCallback = FullScreenContentCallback.new()
	callbacks.on_ad_showed_full_screen_content = func() -> void:
		print("Interstitial showed.")
	callbacks.on_ad_dismissed_full_screen_content = func() -> void:
		print("Interstitial dismissed.")
		interstitial_ad.destroy()
		interstitial_ad = null
		MainSignals.interstitial_ended.emit(true)
		_load_interstitial()
	callbacks.on_ad_failed_to_show_full_screen_content = func(error: AdError) -> void:
		print("Interstitial failed to show: ", error.message)
		interstitial_ad.destroy()
		interstitial_ad = null
		MainSignals.interstitial_ended.emit(false)
		_load_interstitial()
	interstitial_ad.full_screen_content_callback = callbacks


func _show_interstitial() -> void:
	if interstitial_ad:
		interstitial_ad.show()
	else:
		print("Interstitial not loaded yet.")
		MainSignals.interstitial_ended.emit(false)


var rewarded_ad: RewardedAd
var rewarded_loader: RewardedAdLoader = RewardedAdLoader.new()


func _load_rewarded_ad() -> void:
	# set ad id
	var ad_unit_id: String
	if OS.is_debug_build():
		ad_unit_id = interstitial_ad_id_debug
	else:
		ad_unit_id = interstitial_ad_id_prod
	var callback: RewardedAdLoadCallback = RewardedAdLoadCallback.new()

	callback.on_ad_loaded = func(ad: RewardedAd) -> void:
		rewarded_ad = ad
		print("Rewarded ad loaded.")
		setup_rewarded_callbacks()

	callback.on_ad_failed_to_load = func(error: LoadAdError) -> void:
		print("Rewarded ad failed to load: ", error.message)

	rewarded_loader.load(ad_unit_id, AdRequest.new(), callback)


func setup_rewarded_callbacks() -> void:
	if not rewarded_ad:
		return
	var callbacks: FullScreenContentCallback = FullScreenContentCallback.new()
	callbacks.on_ad_dismissed_full_screen_content = func() -> void:
		print("Rewarded ad dismissed.")
		rewarded_ad.destroy()
		rewarded_ad = null
		MainSignals.rewarded_ad_ended.emit(true) # dismiss is when pressing the x after video played
		_load_rewarded_ad()
	callbacks.on_ad_failed_to_show_full_screen_content = func(error: AdError) -> void:
		print("Rewarded ad failed to show: ", error.message)
		rewarded_ad.destroy()
		rewarded_ad = null
		MainSignals.rewarded_ad_ended.emit(false)
		_load_rewarded_ad()

	rewarded_ad.full_screen_content_callback = callbacks


func _show_rewarded_ad() -> void:
	if not rewarded_ad:
		print("Rewarded ad not loaded.")
		return

	var reward_listener: OnUserEarnedRewardListener = OnUserEarnedRewardListener.new()
	reward_listener.on_user_earned_reward = func(rewarded_item: RewardedItem) -> void:
		print("Player rewarded! Amount: ", rewarded_item.amount, ", Type: ", rewarded_item.type)

	rewarded_ad.show(reward_listener)
