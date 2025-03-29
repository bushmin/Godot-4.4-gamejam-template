extends Node


func _physics_process(_delta):
	if %MovementBehaviour.disabled: return
	if Input.is_action_just_pressed("ui_accept"):
		bark_sound()
		%BarkTimeout.stop()
		%BarkTimeout.start()
		%AnimationBehaviour.isBarking = true

func bark_sound():
	%BarkSound.pitch_scale = randf_range(0.4, 0.6)
	%BarkSound.play()
