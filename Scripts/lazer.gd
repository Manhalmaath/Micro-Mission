extends Node2D

class_name Lazer
export var damage = 10
export var speed = 70
var did_damage = false
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	position += velocity * delta * speed

func set_diraction(player_rotation):
	velocity = Vector2(speed,0).rotated(player_rotation)


func _on_lazer_area_body_entered(body):
	if is_instance_valid(self):
		yield(get_tree().create_timer(0.5), "timeout")
		queue_free()

