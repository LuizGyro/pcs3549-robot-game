extends Node2D

export(float) var mass
export(int) var max_hp
export(int) var dmg = 0

onready var animation = $AnimationPlayer

var attacking = false
var hp

func _ready():
	hp = max_hp

func set_mass(mass):
	animation.playback_speed = 13/mass

func attack():
	if !attacking:
		attacking = true
		animation.play("attack")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "attack":
		attacking = false
		animation.play("idle")
