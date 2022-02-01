extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_music("res://Sounds/Game over Drone.mp3")

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Rooms/GreedeerTut{1}.tscn")
