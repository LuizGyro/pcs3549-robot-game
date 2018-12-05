extends Node

const FLOOR_Y = 500

onready var p1 = $Character
onready var p2 = $Character2
onready var screen_size = get_viewport().size

var game_over = false

func _ready():
	place_character(p1, screen_size.x * .25)
	place_character(p2, screen_size.x * .75)
	p1.set_physics_process(true)
	p2.set_physics_process(true)
	
	set_process_input(false)


func place_character(ch, x):
	ch.position.x = x
	ch.position.y = FLOOR_Y - ch.get_height()


func _input(event):
	if event.is_action_type():
		get_tree().change_scene("res://menu/selection/robot_selection.tscn")


func _on_character_death(player_name):
	if game_over:
		return
	
	game_over = true
	p1.set_physics_process(false)
	p2.set_physics_process(false)
	if player_name == "P1":
		$HUD.victory("Player 2 wins!!")
	else:
		$HUD.victory("Player 1 wins!!")
	
	yield(get_tree().create_timer(2), "timeout")
	set_process_input(true)
