extends VBoxContainer

onready var total_parts = get_child_count()

var selected_part = 0

func _ready():
	get_child(selected_part).selected()


func next_part():
	get_child(selected_part).unselected()
	selected_part = (selected_part + 1) % total_parts
	get_child(selected_part).selected()


func previous_part():
	get_child(selected_part).unselected()
	selected_part = (selected_part + total_parts - 1) % total_parts
	get_child(selected_part).selected()


func left():
	get_child(selected_part).left()


func right():
	get_child(selected_part).right()
