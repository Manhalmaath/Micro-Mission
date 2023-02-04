extends Node2D


func _ready():
	$playing.visible = false
	$playing.set_process(false)
	


func _process(delta):
	$HUD/Timer.text = str(int($main_timer.time_left)  / 60) + ':' + str(int($main_timer.time_left) % 60)


func _on_main_timer_timeout():
	game_over()

func game_over():
	print("Game Over")


func _on_HUD_start():
	$main_timer.start()
	$playing.visible = true
	$playing.set_process(true)
