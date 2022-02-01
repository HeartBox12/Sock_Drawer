extends RigidBody2D

func _ready():
	GameEvents.connect("greedeer_active", self, "on_greedeer_active")
	
#func _process(delta):
#	pass


func _on_lifespan_over():
	$Flickerout.play("TurnOff")

func on_greedeer_active():
	$Flickerout.play("TurnOff")


func _on_Flickerout_animation_finished(anim_name):
	GameEvents.emit_signal("light_down")
	queue_free()
