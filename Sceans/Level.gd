extends Node2D


func _ready():
	$main_timer.start()


func _process(delta):
	$Player/Camera2D/Label.text = $main_timer.time_left


func _on_main_timer_timeout():
	game_over()

func game_over():
	pass
