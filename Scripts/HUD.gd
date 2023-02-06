extends CanvasLayer
signal start




func _ready():
	pass 

func _on_Button_pressed():
	emit_signal("start")
	$Button.queue_free()
