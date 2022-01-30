extends Navigation2D

var path:PoolVector2Array

# Called when the node enters the scene tree for the first time.
func _ready():
	path = get_simple_path($YSort/Greedeer.position, $YSort/Player.position)
	$YSort/Greedeer.move_and_slide(path[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _unhandled_key_input(event):
	if !event.echo:
		path = get_simple_path($YSort/Greedeer.position, $YSort/Player.position)
		$YSort/Greedeer.move_and_slide(path[0])
		$YSort/Greedeer/Line2D.points = path
