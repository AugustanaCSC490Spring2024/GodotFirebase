'''
Loads user data when this scene loads
'''
extends Node
var COLLECTION_ID = "char_stats"
var char_name
var char_lvl

func _ready():
	load_data()

'''
Referenced from
"Godot 4 Firebase Tutorial 2024 | Authentication & Cloud Save"
by Boon Makes Games on youtube.com
https://www.youtube.com/watch?v=7ehE4IdSP5s&t=637s
'''
func load_data():
	var auth = Firebase.Auth.auth
	if auth.localid: # check if logged in
		var collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_ID)
		var task: FirestoreTask = collection.get_doc(auth.localid)
		var finished_task: FirestoreTask = await task.task_finished
		var document = finished_task.document
		if (document != null):
			on_doc_loaded(document)
		else:
			print(finished_task.error)

func on_doc_loaded(document):
		char_name = document.doc_fields.char_name
		char_lvl = document.doc_fields.char_lvl
		load_to_fields()

# displays loaded data in the input fields
func load_to_fields():
	%LineEdit.text = char_name
	%SpinBox.get_line_edit().text = str(char_lvl)
	
	
