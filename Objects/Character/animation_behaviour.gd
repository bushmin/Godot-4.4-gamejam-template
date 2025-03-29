extends Node

@onready var Character = $".."

var isBarking = false

const THRESHOLD_SPEED = 10

func _ready():
	%CharacterSprite.play("sit")

func _physics_process(_delta):
	update_animation()

	if Character.get_real_velocity().x>THRESHOLD_SPEED: %CharacterSprite.scale.x = 1
	elif Character.get_real_velocity().x<-THRESHOLD_SPEED: %CharacterSprite.scale.x = -1

func update_animation():
	if %MovementBehaviour.disabled: return
	if Character.velocity != Vector2.ZERO:
		if isBarking: %CharacterSprite.play("bark_run")
		else: %CharacterSprite.play("run")
	else:
		if isBarking: %CharacterSprite.play("bark_idle")
		else: %CharacterSprite.play("idle")


func _on_bark_timeout():
	isBarking = false
