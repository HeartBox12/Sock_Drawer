extends KinematicBody2D

export var path:PoolVector2Array

var collision
var active = false

# Called when the node enters the scene tree for the first time.
#func _ready():
#	GameEvents.connect("footstep", self, "on_footstep")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_slide_count() > 0:
		collision = get_slide_collision(0)
		if collision.collider.is_in_group("Player"):
			get_tree().change_scene("res://Scenes/Menus/Death Menu.tscn")

func _on_found(_area_rid, area, _area_shape_index, _local_shape_index):
	if area.is_in_group("Lights"):
		$AnimatedSprite.animation = "Activate"
		active = true
		$ActivateNoise.play()
		$DetectLight.set_deferred("monitoring", false)

func move(_stepCount):
	if active:
		move_and_slide((path[1] - global_position).normalized() * 3000)


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Activate":
		$AnimatedSprite.animation = "Active"
		GameEvents.emit_signal("greedeer_active")
