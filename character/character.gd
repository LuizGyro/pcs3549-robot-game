extends Node2D

export var player_name = "p1"

onready var pushbox = $Torso/Pushbox
#onready var right_attack = $Torso/RightArm/Hitbox/CollisionShape2D

var mass
var max_speed
var shielding
var speed

#var right_attack_duration = .2
#var right_attack_timer = 0

func _ready():
	mass = $Torso.mass + $Torso/LeftArm/Arm.mass + $Torso/RightArm/Arm.mass +\
			$Torso/Leg/Legs.mass
	max_speed = $Torso/Leg/Legs.speed / mass
	position.y = $Torso/Leg.position.y + $Torso/Leg/Legs/Ground.position.y


func _physics_process(delta):
#	if !right_attack.disabled:
#		right_attack_timer += delta
#	if right_attack_timer >= right_attack_duration:
#		right_attack.disabled = true
#		right_attack_timer = 0
	
	shielding = Input.is_action_pressed(player_name + "_shield")
	
	speed = 0
	if Input.is_action_pressed(player_name + "_left") and not shielding:
		speed -= max_speed
	if Input.is_action_pressed(player_name + "_right") and not shielding:
		speed += max_speed
	
	var final_speed = speed
	
	if pushbox.get_overlapping_areas():
		var other = pushbox.get_overlapping_areas()[0].character
		var delta_x = other.position.x - position.x
		
		var v1
		var v2
		if delta_x > 0:
			v1 = speed
			v2 = other.speed
		else:
			v1 = other.speed
			v2 = speed
		
		# Acoplar
		if (v1 > 0 and v2 <= 0) or (v1 == 0 and v2 < 0) or\
				(v1 > v2 and sign(v1) == sign(v2)):
			final_speed = (speed * mass + other.speed * other.mass) / (mass + other.mass)
	
	position.x += final_speed * delta
	
#	if Input.is_action_just_pressed(player_name + "_attack") and\
#			right_attack.disabled:
#		right_attack.disabled = false


func _on_Hurtbox_area_entered(area):
	if self.is_a_parent_of(area):
		return
	
	print("attacked")
