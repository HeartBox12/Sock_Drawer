extends KinematicBody2D

export var path:PoolVector2Array

var collision

# Called when the node enters the scene tree for the first time.
#func _ready():
#	GameEvents.connect("footstep", self, "on_footstep")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_slide_count() > 0:
		collision = get_slide_collision(0)
		print("Death")

func _on_found(_area_rid, area, _area_shape_index, _local_shape_index):
	if area.is_in_group("Lights"):
		$IdleSprite.visible = false
		$ActiveSprite.visible = true

func move(stepCount):
	move_and_slide((path[1] - global_position).normalized() * 2000)
