extends Node2D

export(float) var mass
export(int) var max_hp
var hp

var attacking = false

func _on_AnimationPlayer_animation_started(anim_name):
    attacking = true


func _on_AnimationPlayer_animation_finished(anim_name):
    attacking = false
