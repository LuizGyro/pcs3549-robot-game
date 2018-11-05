extends Control

var ps_timer = 0
var ps_visibility = false

func _ready():
	set_process(true)

func _process(delta):
	if (ps_timer < 20):
		ps_timer += 1
	else:
		ps_timer = 0
		ps_visibility = !ps_visibility
		$PressStart.visible = ps_visibility
		
