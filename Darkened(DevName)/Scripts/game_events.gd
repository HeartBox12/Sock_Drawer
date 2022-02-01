extends Node

signal death()
signal footstep(arg)
signal light_down()
signal greedeer_active()
signal player_controlling()
signal level_clear()

var currLevel = 0
var levelList:PoolStringArray = ["res://Scenes/Rooms/TutRoom{1}.tscn",
"res://Scenes/Rooms/GreedeerTut{2}.tscn"]
