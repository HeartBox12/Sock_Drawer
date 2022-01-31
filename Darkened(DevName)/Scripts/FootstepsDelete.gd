extends Sprite

func _ready():
	pass # Replace with function body.

func _on_animation_finished(anim_name):
	queue_free()
