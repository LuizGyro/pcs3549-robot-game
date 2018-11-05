extends Node2D

const SPEED = 200

export var mass = 50
export var player_name = "p1"

onready var pushbox = $Torso/Pushbox
onready var right_attack = $Torso/RightArm/Hitbox/CollisionShape2D

var vel = 0

var right_attack_duration = .2
var right_attack_timer = 0

func _ready():
    pass


func _physics_process(delta):
    if !right_attack.disabled:
        right_attack_timer += delta
        if right_attack_timer >= right_attack_duration:
            right_attack.disabled = true
            right_attack_timer = 0
    
    if Input.is_action_pressed(player_name + "_shield"):
        vel = 0
        return
    
    if Input.is_action_pressed(player_name + "_left"):
        vel = -SPEED
    elif Input.is_action_pressed(player_name + "_right"):
        vel = SPEED
    else:
        vel = 0
    
    var seila = vel
    
    if pushbox.get_overlapping_areas():
        var other = pushbox.get_overlapping_areas()[0].get_parent().get_parent()
        seila = (vel * mass + other.vel * other.mass) / (mass + other.mass)
        printt(player_name, vel)
    
    position.x += seila * delta
    
    if Input.is_action_just_pressed(player_name + "_attack") and right_attack.disabled:
        right_attack.disabled = false
    
