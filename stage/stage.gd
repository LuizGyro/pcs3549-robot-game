extends Node

const FLOOR_Y = 500

onready var screen_size = get_viewport().size

var GameOver = false

func _ready():
	place_character($Character, screen_size.x * .25)
	place_character($Character2, screen_size.x * .75)
	$Character.set_physics_process(true)
	$Character.connect("died", self, "_on_character_death")
	$Character2.set_physics_process(true)
	$Character2.connect("died", self, "_on_character_death")


func place_character(ch, x):
	ch.position.x = x
	ch.position.y = FLOOR_Y - ch.get_height()

func _input(event):
	if GameOver:
		get_tree().change_scene("res://menu/selection/robot_selection.tscn")

func _on_character_death(player_name):
	print(player_name)
	$Character.set_physics_process(false)
	$Character2.set_physics_process(false)
	if player_name == "P1":
		$HUD.victory("Vitória Jogador 2!!")
	else:
		$HUD.victory("Vitória Jogador 1!!")
	yield(get_tree().create_timer(2), "timeout")
	GameOver = true
	