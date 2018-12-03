extends Node2D

export var player_name = "P1"

var mass
var max_speed
var shielding
var speed
var hurtbox
var pushbox

signal hp_modified
signal died

func _ready():
	build_body()
	
	max_speed = $Torso/Leg/Legs.speed / mass
	
	pushbox = $Torso/Pushbox
	hurtbox = $Torso/Hurtbox
	
	hurtbox.connect("area_entered", self, "_on_Torso_area_entered")
	pushbox.character = self
	
	set_physics_process(false)


func build_body():
	var parts_array
	if player_name == "P1":
		parts_array = parts.p1
	else:
		parts_array = parts.p2
	
	var torso = load(parts.torsos[parts_array[parts.TORSO]]).instance()
	add_child(torso)
	mass = torso.mass
	
	var head = load(parts.heads[parts_array[parts.HEAD]]).instance()
	$Torso/Head.add_child(head)
	
	var left_arm = load(parts.arms[parts_array[parts.LEFT_ARM]]).instance()
	$Torso/LeftArm.add_child(left_arm)
	mass += left_arm.mass
	
	var right_arm = load(parts.arms[parts_array[parts.RIGHT_ARM]]).instance()
	$Torso/RightArm.add_child(right_arm)
	mass += right_arm.mass
	
	var leg = load(parts.legs[parts_array[parts.LEGS]]).instance()
	$Torso/Leg.add_child(leg)
	mass += leg.mass
	
	right_arm.set_mass(mass)
	left_arm.set_mass(mass)


func replace_part(part):
	var parts_array
	if player_name == "P1":
		parts_array = parts.p1
	else:
		parts_array = parts.p2
	
	var new
	
	match part:
		parts.HEAD:
			new = load(parts.heads[parts_array[parts.HEAD]]).instance()
			$Torso/Head.get_child(0).queue_free()
			$Torso/Head.add_child(new)
		parts.TORSO:
			remove_child($Torso)
			build_body()
		parts.RIGHT_ARM:
			new = load(parts.arms[parts_array[parts.RIGHT_ARM]]).instance()
			$Torso/RightArm.get_child(0).queue_free()
			$Torso/RightArm.add_child(new)
		parts.LEFT_ARM:
			new = load(parts.arms[parts_array[parts.LEFT_ARM]]).instance()
			$Torso/LeftArm.get_child(0).queue_free()
			$Torso/LeftArm.add_child(new)
		parts.LEGS:
			new = load(parts.legs[parts_array[parts.LEGS]]).instance()
			$Torso/Leg.get_child(0).queue_free()
			$Torso/Leg.add_child(new)
	


func get_height():
	return $Torso/Leg/Legs/Ground.global_position.y - global_position.y


func _physics_process(delta):
	
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
			final_speed = (speed * mass + other.speed * other.mass)\
					/ (mass + other.mass)
	
	position.x += final_speed * delta

	if Input.is_action_just_pressed(player_name + "_attack"):
        $Torso/RightArm/Arm.attack()
	
	# Lose condition
	if position.x < 0 or position.x > get_viewport().size.x:
		emit_signal("died", player_name)


func _on_Torso_area_entered(area):
	if self.is_a_parent_of(area):
		return
	
	$Torso.hp -= area.get_parent().get_parent().get_parent().dmg
	print(float($Torso.hp) / $Torso.max_hp)
	emit_signal("hp_modified", (float($Torso.hp) / $Torso.max_hp)*100, player_name, "Torso")
	
	if $Torso.hp <= 0:
		emit_signal("died", player_name)
