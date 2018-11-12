extends Node2D

export (float) var mass
export(int) var max_hp
var hp

func _ready():
	hp = max_hp