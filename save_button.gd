extends Button

var COLLECTION_ID = "char_stats"
var char_name = "Name"
var char_lvl = 0

func _on_pressed():
	save_data()

# referenced from
# Godot 4 Firebase Tutorial 2024 | Authentication & Cloud Save
# from Boon Makes Games on youtube.com
# https://www.youtube.com/watch?v=7ehE4IdSP5s&t=637s
func save_data():
	var auth = Firebase.Auth.auth
	if auth.localid: # make sure user is logged in
		get_char_data()
		var collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_ID)
		var data: Dictionary = {
			"char_name": char_name,
			"char_lvl": char_lvl
		}
		var task: FirestoreTask = collection.update(auth.localid, data)
		
func get_char_data():
	char_name = %LineEdit.text
	char_lvl = int(%SpinBox.get_line_edit().text)
