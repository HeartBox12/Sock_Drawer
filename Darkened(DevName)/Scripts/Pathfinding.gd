extends Navigation2D
onready var tree = get_tree()
var monsters:Array

# Called when the node enters the scene tree for the first time.
func _ready():
	GameEvents.connect("footstep", self, "on_footstep")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_footstep(stepCount): #Called whenever the player takes a step.
	monsters = tree.get_nodes_in_group("Monsters") #Find all nodes to inform
	for index in range(monsters.size()):
		#First statement sets the value of a var local to each monster
		monsters[index].path = get_simple_path(monsters[index].global_position, $YSort/Player.global_position, false)
		#Second statement makes the monsters move
		monsters[index].move(stepCount)
	
