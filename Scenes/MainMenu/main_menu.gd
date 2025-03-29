extends Control

## In this file you can find an embryo of localization logic
#func _ready():
	#TranslationServer.set_locale("en")

func _input(event):
	if visible and Input.is_action_just_pressed("ui_accept"):
		_on_start_button_pressed()

	#if event is InputEventKey and event.pressed:
		#if event.physical_keycode == KEY_L:
			#if TranslationServer.get_locale() == "en":
				#TranslationServer.set_locale("ru")
			#else:
				#TranslationServer.set_locale("en")

func _on_start_button_pressed():
	AudioManager.SFX.play_sfx("click")
	AudioManager.Music.fade_in()
	AudioManager.Music.play_main_theme()
	
	TransitionManager.change_scene("res://Scenes/MainGame/MainGame.tscn")
