extends Control

var loops = 0

func _ready():
	$RevealSFX.play()

func _on_DramaPause_timeout():
	match loops:
		1:
			$RevealSFX.play()
			
			$BoxCredit.visible = false
			$WobbCredit.visible = true
		2:
			$RevealSFX.play()
			
			$WobbCredit.visible = false
			$SugarCredit.visible = true
		3:
			$RevealSFX.play()
			
			$SugarCredit.visible = false
			$ThorneCredit.visible = true
		4:
			$RevealSFX.play()
			
			$ThorneCredit.visible = false
			$FontCredit.visible = true
		6:
			$RevealSFX.play()
			$FontCredit.visible = false
		7:
			get_tree().change_scene("res://Scenes/Menus/LogoScreen.tscn")
	
	loops = loops + 1
