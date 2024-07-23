extends Node2D
@onready var soundpick = $"../../SoundDiamond"
func _ready():
	$AnimationPlayer.play("Idle")


func _on_area_2d_area_entered(area):
	GameController.gaine_diamond(1)
	soundpick.play()
	queue_free()
