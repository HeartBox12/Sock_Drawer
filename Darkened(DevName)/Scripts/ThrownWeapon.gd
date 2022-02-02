extends RigidBody2D

func _ready():
	GameEvents.connect("greedeer_active", self, "on_greedeer_active")
	

func _on_lifespan_over():
	$Flickerout.play("TurnOff")
	GameEvents.emit_signal("light_down")

func on_greedeer_active():
	$Flickerout.play("TurnOff")
	GameEvents.emit_signal("light_down")


func _on_Flickerout_animation_finished(anim_name):
	queue_free()
