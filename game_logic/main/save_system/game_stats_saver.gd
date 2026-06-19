class_name GameStatsSaver
extends Node

# In charge of saving game_stats that holds all persistentdata

func load_data(game_save: GameSave):
	if game_save.game_stats == null:
		Game.game_stats = GameStats.new()
	else:
		Game.game_stats = game_save.game_stats

func save_data(game_save: GameSave):
	game_save.game_stats = Game.game_stats
