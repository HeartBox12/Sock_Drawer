extends RigidBody2D

func _ready():
	GameEvents.connect("greedeer_active", self, "on_greedeer_active")
	
#func _process(delta):
#	pass


func _on_lifespan_over():
	GameEvents.emit_signal("light_down")
	queue_free()
	#FIXME: Place moth hitbox

func on_greedeer_active():
	GameEvents.emit_signal("light_down")
	queue_free()
