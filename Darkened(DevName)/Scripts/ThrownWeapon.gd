extends RigidBody2D

#func _ready():
#	pass
	
#func _process(delta):
#	pass


func _on_lifespan_over():
	GameEvents.emit_signal("light_down")
	queue_free()
	#FIXME: Place moth hitbox
