extends CanvasLayer

func _update_hp_bar(percentage, player, part):
	get_node(str("MarginContainer/", player, "/", part)).value = 100-percentage
#	$MarginContainer/P1/Torso.value = percentage
