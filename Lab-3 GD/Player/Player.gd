extends Area2D

#loads laser in as plLaser
var plLaser := preload("res://Laser/laser.tscn")
#refrences
@onready var firingPosition := $FiringPosition
@onready var fireDelayTimer := $FireDelayTimer
# 100 pixels per sec
# so we can see it on sprite and edit it there
@export var speed : float = 100
#change this to chnage laser timer
@export var fireDelay : float = 0.2
# x and y axis
var vel := Vector2(0,0)

#shootinh action
func _process(_delta):
	if Input.is_action_just_pressed("shoot") and fireDelayTimer.is_stopped():
		fireDelayTimer.start(fireDelay)
		for weapon in firingPosition.get_children():
			var laser := plLaser.instantiate()
			laser.global_position = weapon.global_position
			get_tree().current_scene.add_child(laser)
			

func _physics_process(delta):
	# so it stops
	#vel.x = 0
	#vel.y = 0
	var dirVec := Vector2(0,0)
	if Input.is_action_pressed("move_left"):
		dirVec.x = -1
	elif Input.is_action_pressed("move_right"):
		dirVec.x = 1
	if Input.is_action_pressed("move_up"):
		dirVec.y = -1
	elif Input.is_action_pressed("move_down"):
		dirVec.y = 1
	
	# makes sure its zero
	vel = dirVec.normalized() * speed
	#convert speed to per second
	position += vel  * delta
		
