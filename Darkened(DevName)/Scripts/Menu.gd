extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.stop_music()

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Rooms/GreedeerTut{2}.tscn")
