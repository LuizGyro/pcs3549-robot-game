extends Node

const FLOOR_Y = 500

onready var screen_size = get_viewport().size

func _ready():
	place_character($Character, screen_size.x * .25)
	place_character($Character2, screen_size.x * .75)


func place_character(ch, x):
	ch.position.x = x
	ch.position.y = FLOOR_Y - ch.get_height()
