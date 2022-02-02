extends Node2D


func _ready():
	MusicController.play_music("res://Sounds/Spooky Ambient.mp3")
	GameEvents.connect("player_controlling", self, "_on_player_controlling")
#	$YSort/TilesCollision.get_navigation_polygon()

func _process(delta):
	if Input.is_mouse_button_pressed(1): #this don't work. 
		$M1Prompt.animation = "ReleaseAnim"
	
	if !Input.is_mouse_button_pressed(1) && $M1Prompt.animation == "ReleaseAnim":
		$M1Prompt.visible = false

func _on_player_controlling():
	$M1Prompt.visible = true
