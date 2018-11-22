extends HBoxContainer

const COL_SELECT = Color(.7, .7, .4)
const COL_UNSELECT = Color(.15, .15, .15)

onready var left = $Left
onready var texture = $Texture
onready var right = $Right

func selected(rect=texture):
	rect.material.set_shader_param("outline_color", COL_SELECT)


func unselected(rect=texture):
	rect.material.set_shader_param("outline_color", COL_UNSELECT)


func focus(arrow):
	selected(arrow)
	var timer = Timer.new()
	timer.wait_time = .15
	add_child(timer)
	timer.start()
	yield(timer, "timeout")
	timer.queue_free()
	unselected(arrow)


func left():
	focus(left)


func right():
	focus(right)
