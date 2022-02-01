extends RigidBody2D

onready var tree = get_tree()
onready var mothNode = load("res://Scenes/Instances/Moth Hitbox.tscn")
var newMoths


func _on_lifespan_over():
	#FIXME: Play animation for getting swarmed with moths.
	tree.call_group("Moths", "scatter")
	newMoths = tree.current_scene.add_child(mothNode)
	newMoths.position = position;
	$MothedFlickerOut.play("MothedTurnOff")

func _on_MothedFlickerOut_animation_finished(anim_name):
	queue_free()
