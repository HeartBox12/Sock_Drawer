extends RigidBody2D

onready var tree = get_tree()
onready var mothNode = load("res://Scenes/Instances/Moth Hitbox.tscn")
var newMoths

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_lifespan_over():
	#FIXME: Play animation for getting swarmed with moths.
	tree.call_group("Moths", "scatter")
	newMoths = tree.current_scene.add_child(mothNode)
	newMoths.position = position;
	queue_free()
