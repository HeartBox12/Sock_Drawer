extends Node2D


func _ready():
	$AudioStreamPlayer2D.play()
	$AnimatedSprite.play()


func _player_in():
	GameEvents.emit_signal("player_controlling")
