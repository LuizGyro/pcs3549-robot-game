extends Node

enum {HEAD, TORSO, RIGHT_ARM, LEFT_ARM, LEGS}

onready var total = 5

var heads = ["res://character/parts/heads/presser/presser_head.tscn",
		"res://character/parts/heads/thinker/thinker_head.tscn",
		"res://character/parts/heads/wood/wood_head.tscn"]
var torsos = ["res://character/parts/torsos/presser/presser_torso.tscn",
		"res://character/parts/torsos/thinker/thinker_torso.tscn",
		"res://character/parts/torsos/wood/wood_torso.tscn"]
var arms = ["res://character/parts/arms/presser/presser_arm.tscn",
		"res://character/parts/arms/thinker/thinker_arm.tscn",
		"res://character/parts/arms/wood/wood_arm.tscn"]
var legs = ["res://character/parts/legs/presser/presser_legs.tscn",
		"res://character/parts/legs/thinker/thinker_legs.tscn",
		"res://character/parts/legs/wood/wood_legs.tscn"]

var p1 = [0, 0, 0, 0, 0]
var p2 = [0, 0, 0, 0, 0]

func _ready():
	pass


func change(player, part, offset):
	player[part] = (player[part] + heads.size() + offset) % heads.size()
