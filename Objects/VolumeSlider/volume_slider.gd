extends HSlider

enum AudioType {
	MUSIC,
	SFX
}

@export var type: AudioType = AudioType.MUSIC

func _ready():
	if type == AudioType.MUSIC: set_value_no_signal(AudioManager.get_music_volume())
	elif type == AudioType.SFX: set_value_no_signal(AudioManager.get_sfx_volume())

func _on_value_changed(value: float) -> void:
	AudioManager.SFX.play_sfx("click")
	if type == AudioType.MUSIC: AudioManager.set_music_volume(value)
	elif type == AudioType.SFX: AudioManager.set_sfx_volume(value)
