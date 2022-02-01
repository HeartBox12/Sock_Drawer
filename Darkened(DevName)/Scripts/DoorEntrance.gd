extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DoorEntrance_body_entered(body):
	pass # Replace with function body.


func _on_approached(body):
	if body.is_in_group("Player"):
		GameEvents.emit_signal("level_clear")
		$AudioStreamPlayer2D.play()


func _player_out():
	get_tree().change_scene("res://Scenes/Rooms/GreedeerTut{2}.tscn")
