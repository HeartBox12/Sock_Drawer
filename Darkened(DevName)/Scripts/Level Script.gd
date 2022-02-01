extends Node2D


#func _ready():
#	$YSort/TilesCollision.get_navigation_polygon()



func _process(delta):
	if Input.is_mouse_button_pressed(1): #this don't work. 
		$M1Prompt.animation = "ReleaseAnim"
	
	if !Input.is_mouse_button_pressed(1) && $M1Prompt.animation == "ReleaseAnim":
		$M1Prompt.visible = false
