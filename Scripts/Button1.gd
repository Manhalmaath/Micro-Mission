extends Node2D


func _on_Start_pressed():
	$click.play()
	yield(get_tree().create_timer(0.45), "timeout")
	get_tree().change_scene("res://Sceans/levels.tscn")


func _on_credit_pressed():
	$click.play()
	yield(get_tree().create_timer(0.45), "timeout")
	get_tree().change_scene("res://Sceans/credit.tscn")
