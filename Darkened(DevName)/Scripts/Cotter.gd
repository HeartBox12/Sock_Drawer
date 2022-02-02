extends KinematicBody2D

export var path:PoolVector2Array

var collision
var speedToMoveBy = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_slide_count() > 0:
		collision = get_slide_collision(0)
		if collision.collider.is_in_group("Player"):
			get_tree().change_scene("res://Scenes/Menus/Death Menu.tscn")
			
	#Flips Sprite
	if get_parent().get_node("Player").position.x < position.x:
		$CotterAnimation.flip_h = true
	else:
		$CotterAnimation.flip_h = false

func move(stepCount):
	if stepCount % 2 == 0:
		move_and_slide((path[1] - global_position).normalized() * 2000)
		$FootstepNoise.play()
	else:
		speedToMoveBy = Vector2.ZERO
