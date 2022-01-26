extends Area2D

export var stepDistance:int
var stepVector:Vector2 #What are you doing, step-vector?

var goDown = false
var goUp = false
var goLeft = false
var goRight = false

func _ready():
	stepVector.x = 0.0
	stepVector.y = 0.0

func process(delta):
	pass

func _unhandled_key_input(event):
	if !event.echo && event.pressed: #if the player pressed a button...
		match event.scancode: #Figure out which one it was that they pressed.
			KEY_W: #player pressed W.
				$wTimer.start()
				stepVector.y -= 1
				goUp = true
			KEY_S:#Player pressed S.
				$sTimer.start()
				stepVector.y += 1
				goDown = true
			KEY_A:#player pressed A.
				$aTimer.start()
				stepVector.x -= 1
				goLeft = true
			KEY_D:#player pressed D.
				$dTimer.start()
				stepVector.x += 1
				goRight = true
			KEY_E: #Player pressed E.
				print("HEY! You're not supposed to do this yet!")
		
	elif !event.echo && !event.pressed:
		match event.scancode:
			KEY_W:
				print("W cancelled.")#DEBUG
				$wTimer.stop()
				stepVector.y += 1
				goUp = false
			KEY_S:
				print("S cancelled.")#DEBUG
				$sTimer.stop()
				stepVector.y -= 1
				goDown = false
			KEY_A:
				print("A cancelled.")#DEBUG
				$aTimer.stop()
				stepVector.x += 1
				goLeft = false
			KEY_D:
				print("D cancelled.")#DEBUG
				$dTimer.stop()
				stepVector.x -= 1
				goRight = false
func step():
	position += stepVector.normalized() * 20
	print("Sorry, did you press something?")#DEBUG
	
	if goDown:
		$sTimer.start()
		print("Going down, step thinks.")
		
	if goUp:
		$wTimer.start()
		print("Going Up, Step thinks.")
	
	if goLeft:
		$aTimer.start()
		print("Going left, Step thinks.")
		
	if goRight:
		$dTimer.start()
		print("Going right, Step thinks.")
