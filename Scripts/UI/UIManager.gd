extends CanvasLayer

func _ready():
	GameController.pause_menu = $PauseMenu
	GameController.win_screen = $Result
	GameController.rank_label = $Result/Label
	GameController.gained_diamond.connect(update_diamond_display)

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		GameController.pause_play()
		

func update_diamond_display(gained_diamond):
	$DiamondDisplay.text = str(GameController.diamond)

func _on_resume_pressed():
	GameController.resume()

func _on_restart_pressed():
	GameController.restart()

func _on_quit_pressed():
	GameController.quit()
