extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_found(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("Lights"):
		$IdleSprite.visible = false
		$ActiveSprite.visible = true
	#FIXME: If area is in group "Lights", switch to active state.
