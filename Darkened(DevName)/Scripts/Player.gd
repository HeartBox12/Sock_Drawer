extends KinematicBody2D

var inputDir = Vector2.ZERO
const SPEED = 200

var aiming = false
var move = false
var collision

var idleDir = "Left Idle On"

# Direction id of footsteps spawned.
# 0 = Down, 1 = Left, 2 = Up, 3 = RIght
var stepDir = 0 

var stepCount = 0
var showFootSteps = true
var isLeftStep = true

export var light = true

var timerStarted = false

onready var glowThrow = preload("res://Scenes/Instances/ThrownWeapon.tscn")
onready var footStep = preload("res://Scenes/Instances/Footsteps.tscn")
onready var deathMenu = preload("res://Scenes/Menus/Death Menu.tscn")

func _ready():
	GameEvents.connect("light_down", self, "on_light_down")
	GameEvents.connect("player_controlling", self, "_in_level")
	GameEvents.connect("level_clear", self, "_on_level_clear")

func _process(_delta):
	if move:
		# Variable speed determination for controls
		inputDir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		inputDir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
		inputDir = inputDir.normalized() # Makes sure player moves same speed in all directions
		
		move_and_slide(inputDir * SPEED)
		
		if light:
			$PlayerSprite/PlayerEmitter.visible = false
			
			if !aiming && Input.is_mouse_button_pressed(1): #player has just pressed M1
				begin_aim()
				aiming = true
			
			if aiming and !Input.is_mouse_button_pressed(1): #player has released M1
				aiming = false
				stop_aim()
			
			# Movement Animation when light is on
			if Input.is_action_pressed("ui_down"):
				$PlayerAnimation.play("South Walk On")
				idleDir = "South Idle On"
			
				stepDir = 0
			
				if !timerStarted:
					$FootstepTime.start()
					timerStarted = true
			
			elif Input.is_action_pressed("ui_up"):
				$PlayerAnimation.play("North Walk On")
				idleDir = "North Idle On"
				
				stepDir = 2
			
				if !timerStarted:
					$FootstepTime.start()
					timerStarted = true
			
			elif Input.is_action_pressed("ui_left"):
				$PlayerAnimation.play("Left Walk On")
				idleDir = "Left Idle On"
			
				stepDir = 3
			
				if !timerStarted:
					$FootstepTime.start()
					timerStarted = true
			
			elif Input.is_action_pressed("ui_right"):
				$PlayerAnimation.play("Right Walk On")
				idleDir = "Right Idle On"
				
				stepDir = 1
			
				if !timerStarted:
					$FootstepTime.start()
					timerStarted = true
			
			else:
				$PlayerAnimation.play(idleDir)
				if timerStarted:
					$FootstepTime.stop()
					timerStarted = false
		else:
			$PlayerSprite/PlayerEmitter.visible = true
			
			# Bug fix to transition from On to Off when shooting idly
			match idleDir:
				"South Idle On":
					idleDir = "South Idle Off"
				"Left Idle On":
					idleDir = "Left Idle Off"
				"North Idle On":
					idleDir = "North Idle Off"
				"Right Idle On":
					idleDir = "Right Idle Off"
			
			# Movement animation when light is off
			if Input.is_action_pressed("ui_down"):
				$PlayerAnimation.play("South Walk Off")
				idleDir = "South Idle Off"
			
				stepDir = 0
			
				if !timerStarted:
					$FootstepTime.start()
					timerStarted = true
			
			elif Input.is_action_pressed("ui_up"):
				$PlayerAnimation.play("North Walk Off")
				idleDir = "North Idle Off"
				
				stepDir = 2
			
				if !timerStarted:
					$FootstepTime.start()
					timerStarted = true
			
			elif Input.is_action_pressed("ui_left"):
				$PlayerAnimation.play("Left Walk Off")
				idleDir = "Left Idle Off"
			
				stepDir = 3
			
				if !timerStarted:
					$FootstepTime.start()
					timerStarted = true
			
			elif Input.is_action_pressed("ui_right"):
				$PlayerAnimation.play("Right Walk Off")
				idleDir = "Right Idle Off"
				
				stepDir = 1
			
				if !timerStarted:
					$FootstepTime.start()
					timerStarted = true
			
			else:
				$PlayerAnimation.play(idleDir)
				if timerStarted:
					$FootstepTime.stop()
					timerStarted = false
	else:
		$PlayerAnimation.play(idleDir) #Used to switch to "cry"

func begin_aim():
	$WeaponEmitter/RotateAround.visible = true
	
func stop_aim():
	$WeaponEmitter/RotateAround.visible = false
	
	var newGlowThrow = glowThrow.instance()
	get_parent().add_child(newGlowThrow)
	newGlowThrow.position = position + ($WeaponEmitter.position * 2)
	newGlowThrow.linear_velocity = $WeaponEmitter.get_local_mouse_position().normalized() * 1000
	
	light = false
	move = false
	showFootSteps = false

func _on_Footstepped():
	if showFootSteps:
		var fifthstep = false
		AudioServer.set_bus_effect_enabled(1,0,false)
		
		if !light:
			stepCount += 1
			if stepCount >= 10:
				fifthstep = true
				stepCount = 0
				light = true
				AudioServer.set_bus_effect_enabled(1,0,true)
		
		$FootstepSound.play()
		
		# Spawns footstep
		var newFootStep = footStep.instance()
		get_parent().add_child(newFootStep)
		
		# Assign Footstep Animation based on Step Direction
		if fifthstep:
			if isLeftStep:
				match stepDir:
					0:
						newFootStep.get_node("AnimationPlayer").play("DownStepOnLeftFoot")
					1:
						newFootStep.get_node("AnimationPlayer").play("LeftStepOnLeftFoot")
					2:
						newFootStep.get_node("AnimationPlayer").play("UpStepOnLeftFoot")
					3:
						newFootStep.get_node("AnimationPlayer").play("RightStepOnLeftFoot")
			else:
				match stepDir:
					0:
						newFootStep.get_node("AnimationPlayer").play("DownStepOnRightFoot")
					1:
						newFootStep.get_node("AnimationPlayer").play("LeftStepOnRightFoot")
					2:
						newFootStep.get_node("AnimationPlayer").play("UpStepOnRightFoot")
					3:
						newFootStep.get_node("AnimationPlayer").play("RightStepOnRightFoot")
			
		else:
			if isLeftStep:
				match stepDir:
					0:
						newFootStep.get_node("AnimationPlayer").play("DownStepOffLeftFoot")
					1:
						newFootStep.get_node("AnimationPlayer").play("LeftStepOffLeftFoot")
					2:
						newFootStep.get_node("AnimationPlayer").play("UpStepOffLeftFoot")
					3:
						newFootStep.get_node("AnimationPlayer").play("RightStepOffLeftFoot")
			else:
				match stepDir:
					0:
						newFootStep.get_node("AnimationPlayer").play("DownStepOffRightFoot")
					1:
						newFootStep.get_node("AnimationPlayer").play("LeftStepOffRightFoot")
					2:
						newFootStep.get_node("AnimationPlayer").play("UpStepOffRightFoot")
					3:
						newFootStep.get_node("AnimationPlayer").play("RightStepOffRightFoot")
						
		newFootStep.position = position + Vector2(0, -9)
		isLeftStep = !isLeftStep
		
		#notify the ENTIRE GAME that the player has taken a step.
		GameEvents.emit_signal("footstep", stepCount)
	

func on_light_down(): #Triggers when a light vanishes, one way or another
	move = true
	showFootSteps = true

func _in_level(): #triggers when the player-entering-level animation finishes
	showFootSteps = true
	visible = true
	move = true

func _on_level_clear(): #Triggers when the player reaches the end and the animation begins playing
	showFootSteps = false
	visible = false
	move = false
