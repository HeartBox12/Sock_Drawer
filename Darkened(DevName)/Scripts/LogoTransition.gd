extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(0.5), "timeout")
	$Logo/AnimationPlayer.play("Fade")
	yield(get_tree().create_timer(2), "timeout")
	$Logo/AnimationPlayer.play("LogoSheen")
	yield(get_tree().create_timer(1.5), "timeout")
	$Logo/AnimationPlayer.play_backwards("Fade")
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://Scenes/Menus/Menu.tscn")
	GameEvents.currLevel = 0
