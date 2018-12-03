extends CanvasLayer

func _update_hp_bar(percentage, player, part):
	get_node(str(player, "/", part)).value = 100 - percentage
	
func victory(text):
	$P2.hide()
	$P1.hide()
	$ColorRect.show()
	$ColorRect/Label.text = text
