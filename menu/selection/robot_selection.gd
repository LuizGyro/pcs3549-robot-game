extends Control

const P1_POS = Vector2(150, 350)
const P2_POS = Vector2(874, 350)
const CHARACTER = preload("res://character/character.tscn")

onready var fade = $Transition/Fade
onready var p1_label = $ReadyP1
onready var p2_label = $ReadyP2
onready var p1_menu = $P1Menu
onready var p2_menu = $P2Menu
onready var tween = $Tween

var on_transition = false
var player1
var player2
var p1_part = 0
var p2_part = 0
var p1_ready = false
var p2_ready = false

func _ready():
	player1 = CHARACTER.instance()
	player1.position = P1_POS
	player1.scale *= .7
	$Characters.add_child(player1)
	
	player2 = CHARACTER.instance()
	player2.position = P2_POS
	player2.scale *= .7
	player2.scale.x *= -1
	player2.player_name = "P2"
	$Characters.add_child(player2)


func toggle_ready(player):
	if player == 1:
		p1_ready = !p1_ready
		p1_label.visible = p1_ready
	elif player == 2:
		p2_ready = !p2_ready
		p2_label.visible = p2_ready
	
	if p1_ready and p2_ready:
		on_transition = true
		tween.interpolate_property(fade, "modulate", fade.modulate,
				Color(0, 0, 0, 1), 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
		tween.start()
		
		yield(tween, "tween_completed")
		get_tree().change_scene("res://stage/stage.tscn")


func _input(event):
	if on_transition:
		return
	
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
	elif event.is_action_pressed("P1_start"):
		toggle_ready(1)
	
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
	elif event.is_action_pressed("P2_start"):
		toggle_ready(2)
