extends Node

signal death() #Called when the player dies
signal footstep(arg) #Called when the player takes a step
signal light_down() #Called when the light begins flickering
signal greedeer_active() #Called when a greedeer activates
signal player_controlling() #Called when the player is given control at the start of a level
signal level_clear() #Called when the player has reached (But not played the sound for) a door.

var currLevel = 0
var levelList:PoolStringArray = ["res://Scenes/Rooms/TutRoom{1}.tscn",
"res://Scenes/Rooms/GreedeerTut{2}.tscn",
"res://Scenes/Rooms/GreedeerIntro.tscn",
"res://Scenes/Rooms/OpenLevel1.tscn",
"res://Scenes/Rooms/OpenLevel2.tscn",
"res://Scenes/Rooms/OpenLevel3.tscn",
"res://Scenes/Rooms/ToolShed.tscn"]
