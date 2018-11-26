extends HBoxContainer

const COL_SELECT = Color(.7, .7, .4)
const COL_UNSELECT = Color(.15, .15, .15)
const FOCUS_DURATION = .15

onready var left = $Left
onready var texture = $Texture
onready var right = $Right

func selected(rect=texture):
	rect.material.set_shader_param("outline_color", COL_SELECT)


func unselected(rect=texture):
	rect.material.set_shader_param("outline_color", COL_UNSELECT)


func focus(arrow):
	selected(arrow)
	yield(get_tree().create_timer(FOCUS_DURATION), "timeout")
	unselected(arrow)


func left():
	focus(left)


func right():
	focus(right)
