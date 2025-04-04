extends Node

@onready var Character = $".."

var speed = 300  # speed in pixels/sec

var disabled = true

func _physics_process(_delta):
	if disabled: return
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	Character.velocity = direction * speed
	
	var playtime = %StepsSound.get_playback_position()
	if Character.velocity.length() > 0.1 and (playtime == 0.0 or playtime > 0.15):
		%StepsSound.play()

	Character.move_and_slide()


func enable():
	disabled = false
