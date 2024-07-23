extends Node2D
class_name CheckPoint

@export var spampoint = false
var activated = false

func _ready():
	if spampoint:
		activate()

func activate():
	GameController.currentCheckpoint = self
	activated = true
	$AnimationPlayer.play("Activated")

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player && !activated:
		activate()
