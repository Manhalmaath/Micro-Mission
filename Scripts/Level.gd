extends Node2D

func _ready():
	$main_timer.start()


func _process(delta):
	$HUD/Timer.text = str(int($main_timer.time_left)  / 60) + ' ' + str(int($main_timer.time_left) % 60)


func _on_main_timer_timeout():
	queue_free()
	get_tree().change_scene("res://Sceans/gameover.tscn")
	
func game_over():
	print("Game Over")


