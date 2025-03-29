extends Node

@onready var Music = get_node('Music')
@onready var SFX = get_node('SFX')

func _ready():
	# set nice default volume levels
	set_music_volume(0.4)
	set_sfx_volume(0.7)


func set_music_volume(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))
	
func set_sfx_volume(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value))


func get_music_volume():
	return db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	
func get_sfx_volume():
	return db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))
