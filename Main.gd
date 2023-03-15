extends Node2D


# Declare member variables here. Examples:
onready var Ian = $Ian
var sitting = false
var gen_x = RandomNumberGenerator.new()
var gen_y = RandomNumberGenerator.new()
var coord_x = 0
var coord_y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().set_transparent_background(true)
	Ian.play("regularwave")
	Ian.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func flustered():
	Ian.play("flustered")
	Ian.frame = 0

func teleport():
	coord_x = gen_x.randi_range(0, 1800)
	coord_y = gen_y.randi_range(0, 900)
	yield(get_tree().create_timer(1.0), "timeout")
	OS.set_window_position(Vector2(coord_x, coord_y))
	yield(get_tree().create_timer(1.0), "timeout")
	

func sit():
	Ian.play("sit")
	Ian.frame = 0
	sitting = true

func stand():
	Ian.play("stand")
	Ian.frame = 0
		
func covered():
	Ian.play("coveredup")
	#Ian.play("blink")
	Ian.frame = 0

func _on_Timer_timeout():
	print("10 seconds passed")
	if sitting == false:
		teleport()
		Ian.play("shortwave")
		Ian.frame = 0
#	Ian.play("blink")
#	#if Ian.frame >= 11:
#	#	Ian.frame = 0
#	Ian.frame = 0


func _on_face_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if sitting == true:
			stand()
			sitting = false
		else:
			flustered()

func _on_arms_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if sitting == true:
			stand()
			sitting = false
		else:
			flustered()

func _on_crotch_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if sitting == true:
			stand()
			sitting = false
		else:
			covered()

func _on_chest_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if sitting == true:
			stand()
			sitting = false
		else:
			flustered()


func _on_legs_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if sitting == false:
			sit()
		
