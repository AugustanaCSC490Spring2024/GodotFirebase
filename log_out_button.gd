extends Node
@export var login_scene_path = "res://authentication.tscn"

func _on_pressed():
	Firebase.Auth.logout()
	get_tree().change_scene_to_file(login_scene_path)
