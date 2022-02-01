extends Control

func _on_DramaPause_timeout():
	get_tree().change_scene("res://Scenes/Menus/LogoScreen.tscn")
