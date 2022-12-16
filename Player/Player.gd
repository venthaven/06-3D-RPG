extends KinematicBody

onready var Camera = get_node("/root/Game/Player/Pivot/Camera")

var velocity = Vector3()
var gravity = -9.8
var speed = 0.2
var max_speed = 5
var notmoving = false

var mouse_sensitivity = 0.002
var turn_sensitivity = 0.015

var blaster = false

var target = Vector3()

func _physics_process(_delta):
	velocity.y += gravity * _delta
	var falling = velocity.y
	velocity.y = 0
	var desired_velocity = get_input() * speed
	if desired_velocity.length():
		velocity += desired_velocity
	else:
		velocity.x *= 0.9
	var current_speed = velocity.length()
	velocity = velocity.normalized() * clamp(current_speed,0,max_speed)
	velocity.y = falling
	$AnimationTree.set("parameters/Idle_Run/blend_amount", current_speed/max_speed)
	velocity = move_and_slide(velocity, Vector3.UP, true)
	if blaster != true:
		$Root/Skeleton/BoneAttachment.hide()
	else:
		$Root/Skeleton/BoneAttachment.show()

func _input(event):
	if event is InputEventMouseButton:
		#rotate_y(-event.relative.x * mouse_sensitivity)
		pass

func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("forward"):
		input_dir -= Camera.global_transform.basis.z
		notmoving = false
	if Input.is_action_pressed("back"):
		input_dir += Camera.global_transform.basis.z
		notmoving = false
	if Input.is_action_pressed("left"):
		rotate_y(turn_sensitivity)
		#input_dir -= Camera.global_transform.basis.x
	if Input.is_action_pressed("right"):
		rotate_y(-turn_sensitivity)# * mouse_sensitivity
		#input_dir += Camera.global_transform.basis.x
	if Input.is_action_just_released("forward"):
		velocity = Vector3(0,0,0)
	if Input.is_action_just_released("back"):
		velocity = Vector3(0,0,0)
	input_dir = input_dir.normalized()
	return input_dir

func blaster_get():
	blaster = true
