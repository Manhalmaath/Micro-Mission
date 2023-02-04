extends KinematicBody2D

export var health = 30
export var speed = 50
export var player_path:NodePath

var player

var motion = Vector2()

var go = false

func _ready():
	player = get_node(player_path)

func _physics_process(delta):
	if go:
		print("go")
		motion = position.direction_to(player.global_position) * speed * delta		
	motion = move_and_slide(motion)

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


func _on_detect_area_body_entered(body):
	if body.name == "Player":
		go = true
