extends StaticBody2D

export var health = 100
var is_layer_killed = false
var you_win = false

func _ready():
	pass



func _process(delta):
	if health < 0:
		if not you_win:
			you_win = true
			you_win()
			queue_free()
	if health == 50:
		if not is_layer_killed:
			$damage.play()
			$Layer_area.queue_free()
			is_layer_killed = true

		
func get_hited(area):
	if area.name == 'lazer_area':
		var lazer = area.get_parent()
		if is_instance_valid(lazer):
			if not lazer.did_damage:
				health -= lazer.damage
				lazer.did_damage = true
				lazer.queue_free()
	


func you_win():
	get_tree().change_scene("res://Sceans/win.tscn")


func _on_Layer_area_area_entered(area):
	get_hited(area)


func _on_core_area_area_entered(area):
	get_hited(area)
