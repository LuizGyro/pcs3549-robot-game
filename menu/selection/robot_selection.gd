extends Control

const P1_POS = Vector2(150, 350)
const P2_POS = Vector2(874, 350)
const CHARACTER = preload("res://character/character.tscn")

onready var p1_menu = $P1Menu
onready var p2_menu = $P2Menu

var player1
var player2

func _ready():
	player1 = CHARACTER.instance()
	player1.position = P1_POS
	player1.scale *= .7
	add_child(player1)
	
	player2 = CHARACTER.instance()
	player2.position = P2_POS
	player2.scale *= .7
	player2.scale.x *= -1
	add_child(player2)


func _input(event):
	# Player 1 controls
	if event.is_action_pressed("P1_down"):
		p1_menu.next_part()
	elif event.is_action_pressed("P1_up"):
		p1_menu.previous_part()
	elif event.is_action_pressed("P1_left"):
		p1_menu.left()
	elif event.is_action_pressed("P1_right"):
		p1_menu.right()
	
	# Player 2 controls
	elif event.is_action_pressed("P2_down"):
		p2_menu.next_part()
	elif event.is_action_pressed("P2_up"):
		p2_menu.previous_part()
	elif event.is_action_pressed("P2_left"):
		p2_menu.left()
	elif event.is_action_pressed("P2_right"):
		p2_menu.right()
