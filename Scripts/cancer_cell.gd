extends StaticBody2D

export var health = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 
	
	
func _process(delta):
	if health == 0:
		$damage.play()
		queue_free()

func _on_Area2D_area_entered(area):
	get_hited(area)

func get_hited(area):
	if area.name == 'lazer_area':
		var lazer = area.get_parent()
		if is_instance_valid(lazer):
			if not lazer.did_damage:
				health -= lazer.damage
				lazer.did_damage = true
				lazer.queue_free()
