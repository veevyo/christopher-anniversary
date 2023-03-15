extends Node2D

#variables
onready var Ian = $Ian
var sitting = false
var moving = false
var gen_x = RandomNumberGenerator.new()
var gen_y = RandomNumberGenerator.new()
var coord_x = 0
var coord_y = 0

# called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().set_transparent_background(true)
	Ian.play("regularwave")
	Ian.frame = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#function to show a flustered animation
func flustered():
	Ian.play("flustered")
	Ian.frame = 0 #important to make sure other actions are easily togglable

#function to teleport to a random location
func teleport():
	moving = true
	coord_x = gen_x.randi_range(0, 1800)
	coord_y = gen_y.randi_range(0, 900)
	yield(get_tree().create_timer(1.0), "timeout")
	OS.set_window_position(Vector2(coord_x, coord_y))
	yield(get_tree().create_timer(1.0), "timeout")

#function to play sitting animation
func sit():
	sitting = true
	Ian.play("sit")
	Ian.frame = 0 #important to make sure other actions are easily togglable

#function to play standing animation
func stand():
	Ian.play("stand")
	Ian.frame = 0 #important to make sure other actions are easily togglable

#function to play covered up animation
func covered():
	Ian.play("coveredup")
	Ian.frame = 0 #important to make sure other actions are easily togglable

#timer function: ensures lil guy randomly teleports to a random location over a set interval
func _on_Timer_timeout():
	print("10 seconds passed")
	if sitting == false: #only moves when sitting
		teleport()
		Ian.play("shortwave")
		Ian.frame = 0 #important to make sure other actions are easily togglable
		moving = false

#function for when face clicked
func _on_face_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if sitting == true:
			sitting = false
			stand()
		if moving == false:
			flustered()

#function for when arms/hands clicked
func _on_arms_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if sitting == true:
			sitting = false
			stand()
		if moving == false:
			flustered()

#function for when crotch clicked
func _on_crotch_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if sitting == true:
			sitting = false
			stand()
		if moving == false:
			covered()

#function for when chest clicked
func _on_chest_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if sitting == true:
			sitting = false
			stand()
		else:
			flustered()

#function for when legs clicked
func _on_legs_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		if sitting == false && moving == false:
			sit()
