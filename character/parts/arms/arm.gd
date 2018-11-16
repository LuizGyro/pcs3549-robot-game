extends Node2D

export(float) var mass
export(int) var max_hp

onready var animation = $AnimationPlayer

var attacking = false
var hp

func attack():
	if !attacking:
		attacking = true
		animation.play("attack")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "attack":
		attacking = false
		animation.play("idle")
