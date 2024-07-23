extends Node2D

@onready var soundwin = $SoundWin
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("OpenChest")


func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		GameController.win()
		soundwin.play()
