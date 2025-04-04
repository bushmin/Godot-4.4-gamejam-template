extends Control

func _ready():
	pass

func _on_pause_button_pressed():
	AudioManager.SFX.play_sfx("click")
	get_tree().call_group("PAUSE_MENU", "toggle_menu", false)
	$PauseButton.release_focus()


func _on_win_button_pressed():
	AudioManager.SFX.play_sfx("click")
	TransitionManager.change_scene("res://Scenes/EndScreen/EndScreen.tscn")
