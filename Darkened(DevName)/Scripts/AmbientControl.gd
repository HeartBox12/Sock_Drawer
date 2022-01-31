extends Node

func _ready():
	pass # Replace with function body.

func play_music(ambience):
	$Ambience.stream = load(ambience)
	$Ambience.play()

func stop_music():
	$Ambience.stop()
