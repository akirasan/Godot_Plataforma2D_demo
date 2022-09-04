extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const moveSpeed =  25
const maxSpeed = 50
const jumpHeight = -300
const up = Vector2(0,-1)
const gravity = 15

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

var motion = Vector2()



func _physics_process(delta):
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		animationPlayer.play("Walk")
		motion.x = min(motion.x + moveSpeed, maxSpeed)

	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		animationPlayer.play("Walk")
		motion.x = max(motion.x - moveSpeed, - maxSpeed)
	else:
		animationPlayer.play("Idle")
		friction = true
	
	if is_on_floor():
		if Input.is_action_pressed("ui_accept") || Input.is_action_just_pressed("ui_up"):
			motion.y = jumpHeight
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.01)
	
	motion = move_and_slide(motion, up)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_coin():
	var contador = get_tree().get_root().find_node("CanvasLayer", true, false)
	contador._on_CoinCollected()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FinMundo_body_entered(body):
	get_tree().change_scene("res://Scenes/Mundo.tscn")
	pass # Replace with function body.
