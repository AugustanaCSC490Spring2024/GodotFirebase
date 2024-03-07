extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	Firebase.Auth.userdata_received.connect(set_username)
	%Username.text = "getting user data..."
	get_username()

func get_username():
	await get_tree().create_timer(1.0).timeout # wait a second before requesting
	Firebase.Auth.get_user_data() # make a user data request

# once user data is received by firebase, set username
# receives signal from userdata_received
# userdata_received only sends signal if logged in
func set_username(userdata: FirebaseUserData):
	%Username.text = userdata.email
