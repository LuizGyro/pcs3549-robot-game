extends Node2D

export(float) var mass
export(int) var max_hp

onready var animation = $AnimationPlayer

var attacking = false
var hp

func _ready():
	hp = max_hp
	animation.playback_speed = 2/mass


func strong_attack():
	attack("strong")


func weak_attack():
	attack("weak")


func attack(name):
	if !attacking:
		attacking = true
		animation.play(str(name + "_attack"))


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name.ends_with("attack"):
		attacking = false
		animation.play("idle")
