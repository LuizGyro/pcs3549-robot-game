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
	
func play_sound(fx):
	var sound = AudioStreamPlayer.new()
	self.add_child(sound)
	if fx == "plop":
		sound.stream = load("res://assets/sound/plop.wav")
	elif fx == "p1_ready":
		sound.stream = load("res://assets/sound/p1_ready.wav")
	elif fx == "p2_ready":
		sound.stream = load("res://assets/sound/p2_ready.wav")
	sound.play()
	
	yield(sound, "finished")
	sound.queue_free()


func toggle_ready(player):
	if player == 1:
		p1_ready = !p1_ready
		p1_label.visible = p1_ready
	elif player == 2:
		p2_ready = !p2_ready
		p2_label.visible = p2_ready
	
	if p1_ready and p2_ready:
		tween.interpolate_property(fade, "modulate", fade.modulate,
				Color(0, 0, 0, 1), 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
		tween.start()
		
		yield(tween, "tween_completed")
		get_tree().change_scene("res://stage/stage.tscn")


func _input(event):
	# Player 1 controls
	if !p1_ready:
		if event.is_action_pressed("P1_down"):
			play_sound("plop")
			p1_menu.next_part()
			p1_part = (p1_part + 1) % parts.total
		elif event.is_action_pressed("P1_up"):
			play_sound("plop")
			p1_menu.previous_part()
			p1_part = (p1_part + parts.total - 1) % parts.total
		elif event.is_action_pressed("P1_left"):
			play_sound("plop")
			p1_menu.left()
			parts.change(parts.p1, p1_part, -1)
			player1.replace_part(p1_part)
		elif event.is_action_pressed("P1_right"):
			play_sound("plop")
			p1_menu.right()
			parts.change(parts.p1, p1_part, 1)
			player1.replace_part(p1_part)
	if event.is_action_pressed("P1_start"):
		play_sound("p1_ready")
		toggle_ready(1)
	
	# Player 2 controls
	if !p2_ready:
		if event.is_action_pressed("P2_down"):
			play_sound("plop")
			p2_menu.next_part()
			p2_part = (p2_part + 1) % parts.total
		elif event.is_action_pressed("P2_up"):
			play_sound("plop")
			p2_menu.previous_part()
			p2_part = (p2_part + parts.total - 1) % parts.total
		elif event.is_action_pressed("P2_left"):
			play_sound("plop")
			p2_menu.left()
			parts.change(parts.p2, p2_part, -1)
			player2.replace_part(p2_part)
		elif event.is_action_pressed("P2_right"):
			play_sound("plop")
			p2_menu.right()
			parts.change(parts.p2, p2_part, 1)
			player2.replace_part(p2_part)
	if event.is_action_pressed("P2_start"):
		play_sound("p2_ready")
		toggle_ready(2)
