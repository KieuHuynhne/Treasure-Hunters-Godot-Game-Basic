extends Node

signal gained_diamond(int)
signal victory_rank(String)

var diamond : int
var currentCheckpoint : CheckPoint
var player : Player
var pause_menu
var win_screen
var rank_label

var paused = false


func respawn_player():
	if currentCheckpoint != null:
		player.position = currentCheckpoint.global_position

func gaine_diamond(diamond_gained:int):
	diamond += diamond_gained
	emit_signal("gained_diamond", diamond_gained)
	if diamond_gained >= 35:
		print("All diamonds collected! Find the chest to win!")

func win():
	var rank : String
	if diamond >= 35:
		rank = "S"
	elif diamond >= 30:
		rank = "A"
	elif diamond >= 25:
		rank = "B"
	else:
		rank = "C"
	emit_signal("victory_rank", rank)
	print("You've won the game with rank: " + rank)
	win_screen.visible = true
	rank_label.text = "Rank: " + rank

func pause_play():
	paused = !paused
	pause_menu.visible = paused

func resume():
	pause_play()

func restart():
	diamond = 0
	get_tree().reload_current_scene()

func quit():
	get_tree().quit()
