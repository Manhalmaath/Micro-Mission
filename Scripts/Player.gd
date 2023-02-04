extends KinematicBody2D

export var heath = 100

var velocity = Vector2()
export var destence_from_mouse = 25
export var speed = 120
export var rotation_speed = 10
var rotate = 0
onready var muzzle = get_node("AnimatedSprite/muzzle")

func _ready():
	pass
 
func _process(delta):
	look_at(get_global_mouse_position())
	move_and_slide(velocity * delta * speed)
	velocity = Vector2(0,0)
	if Input.is_action_pressed("up") and global_position.distance_to(get_global_mouse_position()) > destence_from_mouse:
		velocity = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed("down"):
		velocity = Vector2(-speed/2, 0).rotated(rotation)
	if Input.is_action_just_pressed("Shoot"):
		$shoot_sound_effect.play()
		var lazer:Lazer = load('Sceans/lazer.tscn').instance()
		lazer.global_position = muzzle.global_position
		lazer.rotation_degrees = rotation_degrees +90
		lazer.set_diraction(rotation)
		get_tree().root.add_child(lazer)
