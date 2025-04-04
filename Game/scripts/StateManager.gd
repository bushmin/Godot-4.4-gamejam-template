extends Node

## this is usually a place to store global stuff that is used by multiple components
## like score, gems found, etc.
## not so often used in gamejams tbh, but still a nice habit.

## also because it's loaded globally I sometimes dump some global logic here, like this:

func _input(event: InputEvent):
	 # debug hotkeys
	if event is InputEventKey and event.pressed and OS.is_debug_build():
		if event.keycode == KEY_1:
			pass
		if event.keycode == KEY_2:
			pass
		if event.keycode == KEY_3:
			pass
		if event.keycode == KEY_R: # restart
			get_tree().reload_current_scene()
