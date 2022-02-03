extends Node2D

func _ready():
	$Cutscene.play("Cutscene")

func _on_Cutscene_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/Menus/Credits.tscn")
	pass
