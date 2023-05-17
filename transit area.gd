extends Area2D
var bed1: Area2D
var bed2: Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	bed1 = get_node("%BED1")
	bed2 = get_node("%BED2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var speed = get_max_emergency_level()
	for i in self.get_overlapping_areas():
		if i == bed1 or i == bed2:
			i.set_speed_multiplier(speed)

func get_max_emergency_level():
	var level = 1
	for i in self.get_overlapping_areas():
		if i.emergency_level:
			if i.emergency_level > level:
				level = i.emergency_level
	return level
	
