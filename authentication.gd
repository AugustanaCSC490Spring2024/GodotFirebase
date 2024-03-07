'''
Referenced from
"Godot 4 Firebase Tutorial 2024 | Authentication & Cloud Save"
by Boon Makes Games on Youtube
https://www.youtube.com/watch?v=7ehE4IdSP5s&t=492s
'''
extends Control


func _ready():
	# connect to "res://export_presets.cfg"Firebase
	Firebase.Auth.login_succeeded.connect(on_login_succeeded)
	Firebase.Auth.signup_succeeded.connect(on_signup_succeeded)
	Firebase.Auth.login_failed.connect(on_login_failed)
	Firebase.Auth.signup_failed.connect(on_signup_failed)
	
	# Firebase can check if user previously logged in when starting the game
	# if user is already logged in, go straight to the game
	if Firebase.Auth.check_auth_file():
		%MessageLabel.text = "Logged in"
		GameManager.return_to_hub()

# connected to button from scene
func _on_login_button_pressed():
	var email = %EmailLineEdit.text # reference to the input field
	var password = %PasswordLineEdit.text
	Firebase.Auth.login_with_email_and_password(email, password)
	%MessageLabel.text = "Logging in..."
	
func _on_signup_button_pressed():
	var email = %EmailLineEdit.text
	var password = %PasswordLineEdit.text
	Firebase.Auth.signup_with_email_and_password(email, password)
	%MessageLabel.text = "Signing up..."

func on_login_succeeded(auth):
	print(auth)
	%MessageLabel.text = "Login success!"
	Firebase.Auth.save_auth(auth) # keeps user logged in
	Firebase.Auth.load_auth()
	GameManager.return_to_hub()

func on_signup_succeeded(auth):
	print(auth)
	%MessageLabel.text = "Signup success!"
	Firebase.Auth.save_auth(auth)
	Firebase.Auth.load_auth()
	GameManager.return_to_hub()
	
func on_login_failed(error_code, message):
	print(error_code)
	print(message)
	%MessageLabel.text = "Login failed. Error: %s" % message

func on_signup_failed(error_code, message):
	print(error_code)
	print(message)
	%MessageLabel.text = "Sign up failed. Error: %s" % message
	
