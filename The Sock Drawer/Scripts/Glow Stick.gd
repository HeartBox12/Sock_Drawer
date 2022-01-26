extends KinematicBody2D

var velocity = Vector2(0.0, 0.0)
export var friction:float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	var collision = move_and_collide(velocity * delta)
	velocity = velocity / friction


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
