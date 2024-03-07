extends Node

#@onready var player = (load("res://Player/player.tscn")).instantiate()
#@onready var level_map = (load("res://Menus & Util/level_loader.tscn")).instantiate()
#@onready var menu_list = (load("res://Menus & Util/menu_loader.tscn")).instantiate()
#@onready var hub = "res://Levels/hub_world.tscn"
#@onready var test_level = "res://Levels/test_level.tscn"
@onready var saving_demo = "res://test_cloud_saving.tscn"

#var curr_level
#var active_dungeon = []
#
#var curr_menu
#var menu_path = []
#
#func _ready():
	#pass
#
#func change_level(level):
	#if !(active_dungeon.has(level)):
		#active_dungeon.append(curr_level)
	#else:
		#active_dungeon.pop_back()
	#
	#curr_level = level
	#get_tree().change_scene_to_file(curr_level)
#
#func change_menu(menu):
	#if curr_menu != null:
		#menu_path.append(curr_menu)
	#
	#curr_menu = menu
	#get_tree().change_scene_to_file(curr_menu)
#
#func go_back():
	#curr_menu = menu_path.pop_back()
	#
	#get_tree().change_scene_to_file(curr_menu)

func return_to_hub():
	get_tree().change_scene_to_file(saving_demo)
