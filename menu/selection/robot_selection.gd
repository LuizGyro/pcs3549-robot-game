extends Control

const P1_POS = Vector2(150, 350)
const P2_POS = Vector2(874, 350)
const CHARACTER = preload("res://character/character.tscn")

onready var p1_menu = $P1Menu
onready var p2_menu = $P2Menu

var player1
var player2
var p1_part = 0
var p2_part = 0

func _ready():
	player1 = CHARACTER.instance()
	player1.position = P1_POS
	player1.scale *= .7
	add_child(player1)
	
	player2 = CHARACTER.instance()
	player2.position = P2_POS
	player2.scale *= .7
	player2.scale.x *= -1
	player2.player_name = "P2"
	add_child(player2)


func _input(event):
	# Player 1 controls
	if event.is_action_pressed("P1_down"):
		p1_menu.next_part()
		p1_part = (p1_part + 1) % parts.total
	elif event.is_action_pressed("P1_up"):
		p1_menu.previous_part()
		p1_part = (p1_part + parts.total - 1) % parts.total
	elif event.is_action_pressed("P1_left"):
		p1_menu.left()
		parts.change(parts.p1, p1_part, -1)
		player1.replace_part(p1_part)
	elif event.is_action_pressed("P1_right"):
		p1_menu.right()
		parts.change(parts.p1, p1_part, 1)
		player1.replace_part(p1_part)
	
	# Player 2 controls
	elif event.is_action_pressed("P2_down"):
		p2_menu.next_part()
		p2_part = (p2_part + 1) % parts.total
	elif event.is_action_pressed("P2_up"):
		p2_menu.previous_part()
		p2_part = (p2_part + parts.total - 1) % parts.total
	elif event.is_action_pressed("P2_left"):
		p2_menu.left()
		parts.change(parts.p2, p2_part, -1)
		player2.replace_part(p2_part)
	elif event.is_action_pressed("P2_right"):
		p2_menu.right()
		parts.change(parts.p2, p2_part, 1)
		player2.replace_part(p2_part)
