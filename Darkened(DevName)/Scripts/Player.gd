extends KinematicBody2D

var inputDir = Vector2.ZERO
const SPEED = 200
var aiming = false

onready var glowThrow = preload("res://Scenes/Instances/ThrownWeapon.tscn")

func _process(delta):
	# Variable speed determination for controls
	inputDir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputDir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	inputDir = inputDir.normalized() # Makes sure player moves same speed in all directions
	
	move_and_slide(inputDir * SPEED)
	
	if !aiming && Input.is_mouse_button_pressed(1): #player has just pressed M1
		begin_aim()
		aiming = true
		
	if aiming and !Input.is_mouse_button_pressed(1): #player has released M1
		aiming = false
		stop_aim()

func begin_aim():
	$RotateAround.visible = true
	
func stop_aim():
	print("Should have worked")
	$RotateAround.visible = false
	
	var newGlowThrow = glowThrow.instance()
	get_parent().add_child(newGlowThrow)
	newGlowThrow.position = position
	newGlowThrow.linear_velocity = get_local_mouse_position().normalized() * 1000
