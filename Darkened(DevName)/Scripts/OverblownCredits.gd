extends Control

var loops = 0

func _on_DramaPause_timeout():
	match loops:
		1:
			$BoxCredit.visible = false
			$WobbCredit.visible = false
		2:
			$SugarCredit.visible = true
			$ThorneCredit.visible = true
		3:
			get_tree().change_scene("res://Scenes/Menus/LogoScreen.tscn")
	
	loops = loops + 1
