extends Control

var loops = 0

func _on_DramaPause_timeout():
	match loops:
		1:
			$BoxCredit.visible = false
			$WobbCredit.visible = true
		2:
			$WobbCredit.visible = false
			$SugarCredit.visible = true
		3:
			$SugarCredit.visible = false
			$ThorneCredit.visible = true
		4:
			get_tree().change_scene("res://Scenes/Menus/LogoScreen.tscn")
	
	loops = loops + 1
