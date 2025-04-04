extends Node2D

func _ready():
	await get_tree().create_timer(1.5).timeout
	# this is just to demonstrate the usage of groups
	# in this specific case we can access the child node Fox,
	# but often there are cases when it's not a child/parent
	# but a sibling that could even be in another subscene
	get_tree().call_group("MAIN_CHARACTER", "activate")
