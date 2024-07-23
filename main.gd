extends Node2D


@onready var audiobackground = $soundbackground

func _ready():
	$Container/soundbackground.play()
	$Container/Player.play("Idle") 
	$Container/Crab.play("Idle")

func _on_play_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
