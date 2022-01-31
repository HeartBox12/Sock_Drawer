extends KinematicBody2D

var inputDir = Vector2.ZERO
const SPEED = 200
var aiming = false
var idleDir = "South Idle On"

onready var glowThrow = preload("res://Scenes/Instances/ThrownWeapon.tscn")

func _process(_delta):
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
		
	if Input.is_action_pressed("ui_down"):
		$PlayerAnimation.play("South Walk On")
		idleDir = "South Idle On"
		
	elif Input.is_action_pressed("ui_up"):
		pass
		
	elif Input.is_action_pressed("ui_left"):
		$PlayerAnimation.play("Left Idle On")
		idleDir = "Left Idle On"
		
	elif Input.is_action_pressed("ui_right"):
		pass
		
	else:
		$PlayerAnimation.play(idleDir)

func begin_aim():
	$WeaponEmitter/RotateAround.visible = true
	
func stop_aim():
	$WeaponEmitter/RotateAround.visible = false
	
	var newGlowThrow = glowThrow.instance()
	get_parent().add_child(newGlowThrow)
	newGlowThrow.position = position + ($WeaponEmitter.position * 2)
	newGlowThrow.linear_velocity = $WeaponEmitter.get_local_mouse_position().normalized() * 1000
	
	
