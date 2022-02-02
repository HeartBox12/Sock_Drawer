extends Node2D


func _ready():
	GameEvents.connect("player_controlling", self, "_on_player_controlling")
	GameEvents.connect("level_clear", self, "_on_level_clear")

func _on_level_clear():
	MusicController.stop_music()
	
func _on_player_controlling():
	MusicController.play_music("res://Sounds/Spooky Ambient.mp3")
