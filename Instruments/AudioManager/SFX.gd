## welcome to homebrew SFX manager! sorry for the mess
## use this for frequent/ui/weird sounds
## try to use local AudioStreamPlayer files in components in favor of this



extends AudioStreamPlayer

@onready var LAYERS = {
	1: $".",
	2: $SFX2,
	3: $SFX3
}

var MAX_LOW_DB = -40

var LAYER_TWEENS = [null, null, null]

var SOUNDS = {
	"click": {
		"sound": preload("res://sfx/Click.mp3"),
		"volume": 10,
		"layer": 1,
		"instantRestart": true
	},
}

func _ready():
	set_bus('SFX')
	$SFX2.set_bus('SFX')
	$SFX3.set_bus('SFX')

		
func play_sfx(sfx):
	if not SOUNDS[sfx]: return
	if LAYERS[SOUNDS[sfx].layer].stream == SOUNDS[sfx].sound and LAYERS[SOUNDS[sfx].layer].playing and not SOUNDS[sfx].has('instantRestart'): return
	
	LAYERS[SOUNDS[sfx].layer].set_pitch_scale(1.0 if not SOUNDS[sfx].has('pitch') else SOUNDS[sfx].pitch)
	LAYERS[SOUNDS[sfx].layer].set_stream(SOUNDS[sfx].sound)
	LAYERS[SOUNDS[sfx].layer].play()
	
	if SOUNDS[sfx].has('fade_in_time'):
		var duration = SOUNDS[sfx].fade_in_time
		var HIGH_DB = 0 if not SOUNDS[sfx].has('volume') else SOUNDS[sfx].volume
		
		LAYERS[SOUNDS[sfx].layer].set_volume_db(MAX_LOW_DB)
		LAYERS[SOUNDS[sfx].layer].tween_volume(HIGH_DB, duration)
	else:
		LAYERS[SOUNDS[sfx].layer].set_volume_db(0 if not SOUNDS[sfx].has('volume') else SOUNDS[sfx].volume)


func stop_sfx(sfx):
	if not SOUNDS[sfx]: return
	if not LAYERS[SOUNDS[sfx].layer].stream == SOUNDS[sfx].sound: return
	
	if SOUNDS[sfx].has('fade_out_time'):
		var duration = SOUNDS[sfx].fade_out_time
		await LAYERS[SOUNDS[sfx].layer].tween_volume(MAX_LOW_DB, duration)	
	else:
		LAYERS[SOUNDS[sfx].layer].stop()
		LAYERS[SOUNDS[sfx].layer].set_stream(null)
