extends CanvasLayer

func _update_hp_bar(percentage, player, part):
	get_node(str(player, "/", part)).value = percentage


func victory(text):
	$P2.hide()
	$P1.hide()
	$GameOver.show()
	$GameOver/Label.text = text
