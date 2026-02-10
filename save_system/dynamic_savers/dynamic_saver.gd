@abstract
class_name DynamicSaver
extends Node


# Script that stores entity info in saved_data resource. Each sub DYnamicSaver shold be attached as a node to entitys
@abstract func save_data(saved_data: SavedData) -> void


@abstract func load_data(saved_data: SavedData) -> void
