extends RigidBody2D

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	#FIXME: add bounce functionality, so as to bounce off monsters and walls.


func _on_lifespan_over():
	queue_free()
