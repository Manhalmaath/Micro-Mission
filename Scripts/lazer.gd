extends KinematicBody2D
class_name Lazer

export var speed = 10
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	position += velocity * delta * speed

func set_diraction(player_rotation):
	velocity = Vector2(speed,0).rotated(player_rotation)
