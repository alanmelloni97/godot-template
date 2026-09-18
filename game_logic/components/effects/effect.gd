@abstract
class_name Effect
extends Resource

var time: float = 2.0


@abstract func apply_effect(affected_node: Node)


@abstract func remove_effect(affected_node: Node)
