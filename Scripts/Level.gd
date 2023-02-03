extends Node2D


func _ready():
	$main_timer.start()
	set_process(false)
	$TileMap.visible = false


func _process(delta):
	$HUD/Timer.text = str(int($main_timer.time_left)  / 60) + ':' + str(int($main_timer.time_left) % 60)


func _on_main_timer_timeout():
	game_over()

func game_over():
	pass


func _on_HUD_start():
	set_process(true)
	$TileMap.visible = true	
