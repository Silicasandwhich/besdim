extends Node2D
var bed1
var bed2
var next_emergency_level = 1
var PR2_region


# Called when the node enters the scene tree for the first time.
func _ready():
	bed1 = get_node("%BED1")
	bed1.location = "PR1"
	bed2 = get_node("%BED2")
	bed2.location = "PR2"
	
	PR2_region = get_node("%PR2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_Z:
				next_emergency_level = 1
			KEY_X:
				next_emergency_level = 2
			KEY_C:
				next_emergency_level = 3
		if bed1.get_parent() is PathFollow2D:
			if event.keycode in [KEY_1, KEY_2, KEY_3, KEY_4] and bed1.get_parent().progress_ratio < 1:
				return
		if bed2.get_parent() is PathFollow2D:
			if event.keycode in [KEY_Q, KEY_W, KEY_E, KEY_R] and bed2.get_parent().progress_ratio < 1:
				return
		match event.keycode:
			KEY_1:
				bed1.next_location = "OR"
			KEY_2:
				bed1.next_location = "PR2"
			KEY_3:
				bed1.next_location = "PT"
			KEY_4:
				bed1.next_location = "PR1"
			KEY_Q:
				bed2.next_location = "OR"
			KEY_W:
				bed2.next_location = "PR2"
			KEY_E:
				bed2.next_location = "PT"
			KEY_R:
				bed2.next_location = "PR1"
		if event.keycode in [KEY_1, KEY_2, KEY_3, KEY_4]:
			if bed1.get_parent() is PathFollow2D:
				if bed1.get_parent().progress_ratio < 1:
					return
			if bed1.next_location == bed1.location or bed1.next_location == bed2.next_location or bed1.next_location == bed2.location:
				return
			if get_node("%"+bed1.location+"_TO_"+bed1.next_location+"_FOLLOW"):
				bed1.emergency_level = next_emergency_level
				bed1.follow_path(get_node("%"+bed1.location+"_TO_"+bed1.next_location+"_FOLLOW"), deg_to_rad(270))
		if event.keycode in [KEY_Q, KEY_W, KEY_E, KEY_R]:
			if bed2.get_parent() is PathFollow2D:
				if bed2.get_parent().progress_ratio < 1:
					return
			if bed2.next_location == bed2.location or bed2.next_location == bed1.next_location or bed2.next_location == bed1.location:
				return
			if get_node("%"+bed2.location+"_TO_"+bed2.next_location+"_FOLLOW"):
				bed2.emergency_level = next_emergency_level
				bed2.follow_path(get_node("%"+bed2.location+"_TO_"+bed2.next_location+"_FOLLOW"), deg_to_rad(270))
	
		
	
