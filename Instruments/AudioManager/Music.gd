## welcome to homebrew Audio manager!
## not much happening here,
## but I made handy tools for fading and low pass (which I love to enable in pause menu)

extends AudioStreamPlayer

var mainMusic = preload("res://music/Main Theme.mp3")

const FADE_TIME = 0.5

var currentSource = null

func _ready():
	set_bus('Music')


func fade_in(time = FADE_TIME):
	$'../AnimationPlayer'.set_speed_scale(FADE_TIME/time)
	$'../AnimationPlayer'.play_backwards('FADE')
	
	await $'../AnimationPlayer'.animation_finished
	$'../AnimationPlayer'.set_speed_scale(1)
	
func fade_out(time = FADE_TIME):
	$Ambient.stop()
	if (self.is_playing() == false): return
	
	$'../AnimationPlayer'.set_speed_scale(FADE_TIME/time)
	$'../AnimationPlayer'.play('FADE')
	
	await $'../AnimationPlayer'.animation_finished
	$'../AnimationPlayer'.set_speed_scale(1)
	
	
func _play_source(source):
	#if currentSource == source: return
	currentSource = source
	self.set_stream(source)
	self.play()


func enable_low_pass():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	var duration = 0.5
	var LOW_PASS = 700
	var effect = AudioServer.get_bus_effect(AudioServer.get_bus_index("Music"), 0)
	tween.tween_property(effect, "cutoff_hz", LOW_PASS, duration).set_trans(Tween.TRANS_LINEAR)


func disable_low_pass():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	var duration = 0.5
	var NORMAL_PASS = 10000
	var effect = AudioServer.get_bus_effect(AudioServer.get_bus_index("Music"), 0)
	tween.tween_property(self, "volume_db", 0, duration).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(effect, "cutoff_hz", NORMAL_PASS, duration).set_trans(Tween.TRANS_LINEAR)

###############

func play_main_theme():
	_play_source(mainMusic)
