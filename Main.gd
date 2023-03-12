extends Node2D


# Declare member variables here. Examples:
onready var Ian = $Ian
var sitting = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().set_transparent_background(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func flustered():
	Ian.play("flustered")
	Ian.frame = 0

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

#func _on_Timer_timeout():
#	print("blink")
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
		
