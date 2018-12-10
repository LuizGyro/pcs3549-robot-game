extends Node2D

export(float) var mass
export(int) var max_hp

onready var animation = $AnimationPlayer

signal damaged

var attacking = false
var shielding = false
var hp

func _ready():
	hp = max_hp
	animation.playback_speed = 2/mass


func strong_attack():
	attack("strong")


func weak_attack():
	attack("weak")


func attack(name):
	if hp <= 0:
		return
	
	if !attacking:
		attacking = true
		animation.play(str(name + "_attack"))


func shield(s):
	if hp <= 0:
		return
	
	if shielding != s:
		shielding = s
		if shielding:
			animation.play("shield_begin")
		else:
			animation.play("shield_end")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name.ends_with("attack"):
		attacking = false
		animation.play("idle")
	elif anim_name == "shield_end":
		animation.play("idle")


func _on_Hurtbox_area_entered(area):
	if get_parent().get_parent().get_parent().is_a_parent_of(area):
		return
	
	hp -= area.damage / 10
	if hp <= 0:
		$Sprite.hide()
	
	emit_signal("damaged", float(hp) / max_hp * 100)
	
