extends Navigation2D
onready var tree = get_tree()
var monsters:Array
var index:int

# Called when the node enters the scene tree for the first time.
func _ready():
	GameEvents.connect("footstep", self, "on_footstep")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_footstep(stepCount):
	tree.call_group("Monsters", "Move")
	monsters = tree.get_nodes_in_group("Monsters")
	for index in range(monsters.size()):
		monsters[index].path = get_simple_path(monsters[index].global_position, $YSort/Player.global_position, false)
		monsters[index].move(stepCount)
	
