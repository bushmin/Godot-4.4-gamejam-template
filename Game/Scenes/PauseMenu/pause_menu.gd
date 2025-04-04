extends Control

var showing: bool = false

func toggle_menu(show: bool):
	if $AnimationPlayer.is_playing():
		return
		
	if not show:
		show()
		#you can also freeze/unfreeze the whole game with get_tree().paused
		#get_tree().paused = true
		showing = true
		$AnimationPlayer.play_backwards("slide_out")
		AudioManager.Music.enable_low_pass()
	else:
		#get_tree().paused = false
		showing = false
		$AnimationPlayer.play("slide_out")
		AudioManager.Music.disable_low_pass()
		

func _on_button_pressed() -> void:
	AudioManager.SFX.play_sfx("click")
	$CardControl/Card/ResumeButton.release_focus()
	toggle_menu(true)
