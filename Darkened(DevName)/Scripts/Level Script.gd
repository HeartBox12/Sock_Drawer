extends Node2D


# Called when the node enters the scene tree for the first time.
#func _ready():
#	$YSort/TilesCollision.get_navigation_polygon()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		$M1Prompt.animation = "ReleaseAnim"
