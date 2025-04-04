## welcome to homebrew Transition manager!
## it's super simple, but gets the job done.
## just call it like TransitionManager.change_scene("res://path/to/scene.tscn")

extends CanvasLayer

const IDLE_TIME = 0.1

func _ready():
	dissolve_at_once()

func change_scene(target: String, outroSpeed = 1, introSpeed = 1):
	$AnimationPlayer.set_speed_scale(outroSpeed)
	$AnimationPlayer.play("DISSOLVE")
	
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	await get_tree().create_timer(IDLE_TIME).timeout
	
	$AnimationPlayer.set_speed_scale(introSpeed)
	$AnimationPlayer.play_backwards('DISSOLVE')
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.set_speed_scale(1)
	
func dissolve_at_once():
	$AnimationPlayer.play_backwards('DISSOLVE')
	$AnimationPlayer.advance(1)
