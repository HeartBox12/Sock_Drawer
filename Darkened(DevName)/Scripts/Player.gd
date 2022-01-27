extends KinematicBody2D

var inputDir = Vector2.ZERO
const SPEED = 200

func _process(delta):
	# Variable speed determination for controls
	inputDir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputDir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	inputDir = inputDir.normalized() # Makes sure player moves same speed in all directions
	
	move_and_slide(inputDir * SPEED)
	
